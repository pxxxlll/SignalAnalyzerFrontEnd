/*
 * Copyright (C) 2018 - 2019 Xilinx, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 *
 */

/* Connection handle for a TCP Client session */

#include "tcp_client.h"

#include "xgpio.h"
#include "sccb_iic.h"
#include "protocol.h"
#include "freq_sweep.h" // sweep_freq

static struct tcp_pcb *c_pcb;
static struct perf_stats client;
struct tcp_pcb *request_pcb;
u8 first_trans_start;
u8 stop ;
u8 client_connected;
u8 tcp_trans_start;

XGpio gpio_user_rstn;
XGpio gpio_user_start;
XGpio rstn_5640;
XGpio sscb_cam0;
XGpio sscb_cam1;
packet_header *header_p;

extern volatile fdma_buf_st fdma_buf;

u32 *RxBufferPtr[16];
u32 *tcp_rx_buffer;

u32 *VIDEO_BUF[3];
u8 *bufaddr;

volatile u32 file_length;
u32 pkg_offset;


void fdma_wr_set(u32 set)
{
	if(set==0)
		XGpio_DiscreteWrite(&gpio_user_start, 1, 0x0);//start dma
	else
		XGpio_DiscreteWrite(&gpio_user_start, 1, 0x1);//start dma
}


void print_app_header()
{
#if LWIP_IPV6==1
	xil_printf("TCP client connecting to %s on port %d\r\n",
			TCP_SERVER_IPV6_ADDRESS, TCP_CONN_PORT);
	xil_printf("On Host: Run $iperf -V -s -i %d -w 2M\r\n",
			INTERIM_REPORT_INTERVAL);
#else
	xil_printf("TCP client connecting to %s on port %d\r\n",
			TCP_SERVER_IP_ADDRESS, TCP_CONN_PORT);
	xil_printf("On Host: Run $iperf -s -i %d -w 2M\r\n",
			INTERIM_REPORT_INTERVAL);
#endif /* LWIP_IPV6 */
}

static void print_tcp_conn_stats()
{
#if LWIP_IPv6==1
	xil_printf("[%3d] local %s port %d connected with ",
			client.client_id, inet6_ntoa(c_pcb->local_ip),
			c_pcb->local_port);
	xil_printf("%s port %d\r\n",inet6_ntoa(c_pcb->remote_ip),
			c_pcb->remote_port);
#else
	xil_printf("[%3d] local %s port %d connected with ",
			client.client_id, inet_ntoa(c_pcb->local_ip),
			c_pcb->local_port);
	xil_printf("%s port %d\r\n",inet_ntoa(c_pcb->remote_ip),
			c_pcb->remote_port);
#endif /* LWIP_IPV6 */

	//xil_printf("[ ID] Interval\t\tTransfer   Bandwidth\n\r");
}

static void stats_buffer(char* outString,
		double data, enum measure_t type)
{
	int conv = KCONV_UNIT;
	const char *format;
	double unit = 1024.0;

	if (type == SPEED)
		unit = 1000.0;

	while (data >= unit && conv <= KCONV_GIGA) {
		data /= unit;
		conv++;
	}

	/* Fit data in 4 places */
	if (data < 9.995) { /* 9.995 rounded to 10.0 */
		format = "%4.2f %c"; /* #.## */
	} else if (data < 99.95) { /* 99.95 rounded to 100 */
		format = "%4.1f %c"; /* ##.# */
	} else {
		format = "%4.0f %c"; /* #### */
	}
	sprintf(outString, format, data, kLabel[conv]);
}


/** The report function of a TCP client session */
static void tcp_conn_report(u64_t diff,
		enum report_type report_type)
{
	u64_t total_len;
	double duration, bandwidth = 0;
	char data[16], perf[16], time[64];

	if (report_type == INTER_REPORT) {
		total_len = client.i_report.total_bytes;
	} else {
		client.i_report.last_report_time = 0;
		total_len = client.total_bytes;
	}

	/* Converting duration from milliseconds to secs,
	 * and bandwidth to bits/sec .
	 */
	duration = diff / 1000.0; /* secs */
	if (duration)
		bandwidth = (total_len / duration) * 8.0;

	stats_buffer(data, total_len, BYTES);
	stats_buffer(perf, bandwidth, SPEED);
	/* On 32-bit platforms, xil_printf is not able to print
	 * u64_t values, so converting these values in strings and
	 * displaying results
	 */
	sprintf(time, "%4.1f-%4.1f sec",
			(double)client.i_report.last_report_time,
			(double)(client.i_report.last_report_time + duration));
	xil_printf("[%3d] %s  %sBytes  %sbits/sec\n\r", client.client_id,
			time, data, perf);

	if (report_type == INTER_REPORT)
		client.i_report.last_report_time += duration;
}

/** Close a tcp session */
static void tcp_client_close(struct tcp_pcb *pcb)
{
	err_t err;

	if (pcb != NULL) {
		tcp_sent(pcb, NULL);
		tcp_err(pcb, NULL);
		err = tcp_close(pcb);
		if (err != ERR_OK) {
			/* Free memory with abort */
			tcp_abort(pcb);
		}
	}
}

/** Error callback, tcp session aborted */
static void tcp_client_err(void *arg, err_t err)
{
	LWIP_UNUSED_ARG(err);
	u64_t now = get_time_ms();
	u64_t diff_ms = now - client.start_time;

	tcp_client_close(c_pcb);
	c_pcb = NULL;
	tcp_conn_report(diff_ms, TCP_ABORTED_REMOTE);
	xil_printf("TCP connection aborted\n\r");
}

static err_t tcp_send_perf_traffic(void)
{
	err_t err;
	u8_t apiflags = TCP_WRITE_FLAG_COPY | TCP_WRITE_FLAG_MORE;

	if (c_pcb == NULL) {
		return ERR_CONN;
	}

#ifdef __MICROBLAZE__
	/* Zero-copy pbufs is used to get maximum performance for Microblaze.
	 * For Zynq A9, ZynqMP A53 and R5 zero-copy pbufs does not give
	 * significant improvement hense not used. */
	apiflags = 0;
#endif

	struct tcp_pcb *tpcb = c_pcb;

	if (!tpcb)
	return;

	if(first_trans_start==0)
	{
		fdma_buf.circle_cnt=0;
		fdma_buf.next=0;
		fdma_buf.pkg_done_cnt=0;
		fdma_buf.pkg_cnt=0;
		fdma_buf.fram_cnt=0;

		fdma_wr_set(1);
		pkg_offset =0;
		first_trans_start =1;
	}

	/*if the last fdma transmission is done, the interrupt triggered, then start TCP transmission*/
	if(fdma_buf.pkg_done_cnt> 0 && fdma_buf.pkg_done_cnt<3) //1MB divide in to 64 times
	{
			/*set fdma buffer transmission when the current transmission is done*/

				/* if tcp send buffer has enough space to hold the data we want to transmit from PL, then start tcp transmission*/
		if (tcp_sndbuf(tpcb) > TCP_FIRST_SEND_SIZE)
		{
			/*transmit received data through TCP*/
			//xil_printf("bufaddr1=: %x\r\n",bufaddr);
			if(fdma_buf.pkg_cnt==0)
			{
				bufaddr = (u8*)(RxBufferPtr[fdma_buf.record[fdma_buf.next]]);//16 = packet_header size
				header_p = (packet_header *)bufaddr;
				header_p->ID0 = HEADER_ID0;
				header_p->ID1 = HEADER_ID1;
				header_p->KSPS = (uint16_t) (sweep_freq /FREQ_STEP);
				// header_p->KSPS = HEADER_KSPS;
				header_p->Resolution= HEADER_RESOLUTION;
				header_p->channels_signbit= HEADER_CHANNLES_SIGNBIT;
				header_p->length = HEADER_LENGTH;
				header_p->fram_counter = fdma_buf.fram_cnt;

				Xil_DCacheInvalidateRange((u32)bufaddr + HEADER_SIZE, TCP_FIRST_SEND_SIZE);
				err = tcp_write(tpcb, bufaddr, TCP_FIRST_SEND_SIZE, apiflags);
				bufaddr = bufaddr + HEADER_SIZE;
				pkg_offset = pkg_offset + TCP_PACKEG_SIZE;
			}
			else if(fdma_buf.pkg_cnt < TCP_SEND_TIMES)
			{
				bufaddr = bufaddr + TCP_PACKEG_SIZE;
				Xil_DCacheInvalidateRange((u32)bufaddr, TCP_PACKEG_SIZE);
				err = tcp_write(tpcb, bufaddr, TCP_PACKEG_SIZE, apiflags);
				pkg_offset = pkg_offset + TCP_PACKEG_SIZE;
			}
			else if(TCP_SEND_LAST_SIZE>0)
			{
				bufaddr = bufaddr + TCP_PACKEG_SIZE;
				Xil_DCacheInvalidateRange((u32)bufaddr, TCP_SEND_LAST_SIZE);
				err = tcp_write(tpcb, bufaddr, TCP_SEND_LAST_SIZE, apiflags);
				pkg_offset = pkg_offset + TCP_SEND_LAST_SIZE;

			}

		    if (err != ERR_OK) {
				xil_printf("txperf: Error on tcp_write: %d\r\n", err);
				return;
			}
			err = tcp_output(tpcb);
			if (err != ERR_OK) {
				xil_printf("txperf: Error on tcp_output: %d\r\n",err);
				return;
			}

			fdma_buf.pkg_cnt++;

			if(pkg_offset == TOTAL_PKG_SIZE)
			{
				pkg_offset=0;
				fdma_buf.fram_cnt++;
//				fdma_buf.pkg_done_cnt--;
				fdma_buf.pkg_cnt = 0;
				if(fdma_buf.next<2)
					fdma_buf.next++;
				else
					fdma_buf.next=0;
				//
				first_trans_start = 0;
				usleep(10000);
				if(sweep_freq > FREQ_END) {
					sweep_freq = FREQ_START;
				}
				sweep_freq += FREQ_STEP;
				ad9361_set_rx_lo_freq(ad9361_phy, sweep_freq);
				adc_init();
			}
		}

	}
	else if(fdma_buf.pkg_done_cnt > 2) //������治�ܴ�����ͨ������irst_trans_start = 0�ٴ�ͬ��
	{
		xil_printf("error pkg_done_cnt = %d \r\n", fdma_buf.pkg_done_cnt);
		first_trans_start = 0;
	}

/*
	if (client.end_time || client.i_report.report_interval_time) {
		u64_t now = get_time_ms();
		if (client.i_report.report_interval_time) {
			if (client.i_report.start_time) {
				u64_t diff_ms = now - client.i_report.start_time;
				u64_t rtime_ms = client.i_report.report_interval_time;
				if (diff_ms >= rtime_ms) {
					tcp_conn_report(diff_ms, INTER_REPORT);
					client.i_report.start_time = 0;
					client.i_report.total_bytes = 0;
				}
			} else {
				client.i_report.start_time = now;
			}
		}

	}*/
	return ERR_OK;
}

/** TCP sent callback, try to send more data */
static err_t tcp_client_sent(void *arg, struct tcp_pcb *tpcb, u16_t len)
{
	return tcp_send_perf_traffic();
}

/*this fuction is called when a tcp packet is received*/
err_t tcp_recv_callback(void *arg, struct tcp_pcb *tpcb, struct pbuf *p, err_t err)
{
	//err_t error;
	struct pbuf *q;
	u32 remain_length;

	q = p;
	/* close socket if the peer has sent the FIN packet  */
    if (p == NULL) {
        tcp_close(tpcb);
        xil_printf("tcp connection closed\r\n");
        return ERR_OK;
    }

	/*if received ip fragment packets*/
	if(q->tot_len > q->len)
	{
		remain_length = q->tot_len;
		while(remain_length > 0)
		{
			memcpy(tcp_rx_buffer + file_length, q->payload, q->len);

			file_length += q->len;
			remain_length -= q->len;
			/*go to next pbuf pointer*/
			q = q->next;
		}
	}
	/*if received no ip fragment packets*/
	else
	{
		memcpy(tcp_rx_buffer, q->payload, q->len);
	}

	/*change the endian of received command*/
	*tcp_rx_buffer = ntohl(*tcp_rx_buffer);


	if(*tcp_rx_buffer == TCP_START_CMD )
	{
		if(tcp_trans_start)
			xil_printf("TCP: already start!\r\n");
		else
		{
			tcp_trans_start = 1;

			xil_printf("TCP: start!\r\n");
		}
	}
	else if(*tcp_rx_buffer == TCP_STOP_CMD)
	{
		if(!tcp_trans_start)
			xil_printf("TCP: already stop!\r\n");
		else
		{
			tcp_trans_start = 0;

			xil_printf("TCP: stop!\r\n");
		}
	}
	else{
				tcp_trans_start = 0;
			}


	/* tell lwip we've received the tcp packet */
	tcp_recved(tpcb, p->tot_len);
	pbuf_free(p);

    return ERR_OK;
}

/** TCP connected callback (active connection), send data now */
static err_t tcp_client_connected(void *arg, struct tcp_pcb *tpcb, err_t err)
{
	if (err != ERR_OK) {
		tcp_client_close(tpcb);
		xil_printf("Connection error\n\r");
		return err;
	}
	/* store state */
	c_pcb = tpcb;

	client.start_time = get_time_ms();
	client.end_time = TCP_TIME_INTERVAL * 1000; /* ms */
	client.client_id++;
	client.total_bytes = 0;

	/* report interval time in ms */
	client.i_report.report_interval_time = INTERIM_REPORT_INTERVAL * 1000;
	client.i_report.last_report_time = 0;
	client.i_report.start_time = 0;
	client.i_report.total_bytes = 0;

	print_tcp_conn_stats();

	/* set callback values & functions */
	tcp_arg(c_pcb, NULL);
	tcp_sent(c_pcb, tcp_client_sent);
	tcp_recv(c_pcb, tcp_recv_callback);
	tcp_err(c_pcb, tcp_client_err);

	/* disable nagle algorithm to ensure
	 * the last small segment of a ADC packet will be sent out immediately
	 * with no delay
	 * */
	tcp_nagle_disable(c_pcb);

	if(!tcp_nagle_disabled(c_pcb))
		xil_printf("tcp nagle disable failed!\r\n");

	client_connected = 1;

	/* initiate data transfer */
	return ERR_OK;
}

void transfer_data(void)
{
	if (client.client_id)
		tcp_send_perf_traffic();
}

void adc_init(void)
{
	RxBufferPtr[0] =(u32*)(RX_BUFFER0_BASE-HEADER_SIZE);
	RxBufferPtr[1] =(u32*)(RX_BUFFER1_BASE-HEADER_SIZE);
	RxBufferPtr[2] =(u32*)(RX_BUFFER2_BASE-HEADER_SIZE);

	tcp_rx_buffer = (u32 *)TCP_RXBUFFER_BASE_ADDR;

	XGpio_Initialize(&gpio_user_rstn, XPAR_GPIO_USER_RSTN_DEVICE_ID);
	XGpio_SetDataDirection(&gpio_user_rstn, 1, 0x0);
	XGpio_DiscreteWrite(&gpio_user_rstn,1,0x0);

	XGpio_Initialize(&gpio_user_start, XPAR_GPIO_USER_START_DEVICE_ID);
	XGpio_SetDataDirection(&gpio_user_start, 1, 0x0);

	XGpio_DiscreteWrite(&gpio_user_rstn,1,0x1);//reset done
}

void start_application(void)
{
	err_t err;

	ip_addr_t remote_addr;
	u32_t i;

	adc_init();
	first_trans_start = 0;
	client_connected =0;

#if LWIP_IPV6==1
	remote_addr.type= IPADDR_TYPE_V6;
	err = inet6_aton(TCP_SERVER_IPV6_ADDRESS, &remote_addr);
#else
	err = inet_aton(TCP_SERVER_IP_ADDRESS, &remote_addr);
#endif /* LWIP_IPV6 */

	if (!err) {
		xil_printf("Invalid Server IP address: %d\r\n", err);
		return;
	}

	/* Create Client PCB */
	request_pcb = tcp_new_ip_type(IPADDR_TYPE_ANY);
	if (!request_pcb) {
		xil_printf("Error in PCB creation. out of memory\r\n");
		return;
	}

	err = tcp_connect(request_pcb, &remote_addr, TCP_CONN_PORT,
			tcp_client_connected);
	if (err) {
		xil_printf("Error on tcp_connect: %d\r\n", err);
		tcp_client_close(request_pcb);
		return;
	}
	client.client_id = 0;


	return;
}
