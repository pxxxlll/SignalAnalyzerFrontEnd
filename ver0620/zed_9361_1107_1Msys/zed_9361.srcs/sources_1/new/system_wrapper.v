/********************************************************************
 Author       : Sean Hu
 Date         : 2023-08-25 14:29:48
 LastEditors  : Sean Hu
 LastEditTime : 2023-10-08 09:29:58
 FilePath     : d:\12_RFMU\05_coding\RFMU_v0_6_3\soc_prj\zed_9361\zed_9361.srcs\sources_1\new\system_wrapper.v
 Descripttion : 
 Copyright (c) 2023 by Sean Hu. All Rights Reserved.
********************************************************************/

/*******************************MILIANKE*******************************
*Company?:?MiLianKe?Electronic?Technology?Co.,?Ltd.
*WebSite:https://www.milianke.com
*TechWeb:https://www.uisrc.com
*tmall-shop:https://milianke.tmall.com
*jd-shop:https://milianke.jd.com
*taobao-shop1:?https://milianke.taobao.com
*Create?Date:?2021/10/15
*Module?Name:system_wrapper
*File?Name:system_wrapper.v
*Description:?
*The?reference?demo?provided?by?Milianke?is?only?used?for?learning.?
*We?cannot?ensure?that?the?demo?itself?is?free?of?bugs,?so?users?
*should?be?responsible?for?the?technical?problems?and?consequences
*caused?by?the?use?of?their?own?products.
*Copyright:?Copyright?(c)?MiLianKe
*All?rights?reserved.
*Revision:?1.0
*Signal?description
*1)?_i?input
*2)?_o?output
*3)?_n?activ?low
*4)?_dg?debug?signal?
*5)?_r?delay?or?register
*6)?_s?state?mechine
*********************************************************************/

`timescale 1 ps / 1 ps

module system_wrapper
(
// inout wire [14:0]DDR_addr,
// inout wire [2:0]DDR_ba,
// inout wire DDR_cas_n,
// inout wire DDR_ck_n,
// inout wire DDR_ck_p,
// inout wire DDR_cke,
// inout wire DDR_cs_n,
// inout wire [3:0]DDR_dm,
// inout wire [31:0]DDR_dq,
// inout wire [3:0]DDR_dqs_n,
// inout wire [3:0]DDR_dqs_p,
// inout wire DDR_odt,
// inout wire DDR_ras_n,
// inout wire DDR_reset_n,
// inout wire DDR_we_n,
// inout wire FIXED_IO_ddr_vrn,
// inout wire FIXED_IO_ddr_vrp,
// inout wire [53:0]FIXED_IO_mio,
// inout wire FIXED_IO_ps_clk,
// inout wire FIXED_IO_ps_porb,
// inout wire FIXED_IO_ps_srstb,
//******************************
    //signal led
    output  wire                        ledb_trx1_o                 ,
    output  wire                        ledg_trx1_o                 ,
    output  wire                        ledr_trx1_o                 ,
    output  wire                        ledb_trx2_o                 ,
    output  wire                        ledg_trx2_o                 ,
    output  wire                        ledr_trx2_o                 ,
    //ad936x spi        
    output  wire                        ad9361_spi_csn_o            , 
    output  wire                        ad9361_spi_clk_o            , 
    output  wire                        ad9361_spi_mosi_o           ,
    input   wire                        ad9361_spi_miso_i           ,
    //ad936x ctrl signals
    output  wire                        ad9361_en_agc_o             ,    
    output  wire                        ad9361_enable_o             ,    
    output  wire                        ad9361_resetb_o             ,
    output  wire                        ad9361_txnrx_o              , 
    output  wire                        ad9361_sync_in_o            ,  
    output  wire                        ad9361_clk_out_o            ,  
    output  wire       [ 3:0]           ad9361_ctrl_in_o            ,
    //tx channel
    output  wire                        ad9361_tx_clk_out_n         ,    
    output  wire                        ad9361_tx_clk_out_p         ,    
    output  wire        [ 5:0]          ad9361_tx_data_out_n        ,
    output  wire        [ 5:0]          ad9361_tx_data_out_p        ,
    output  wire                        ad9361_tx_frame_out_n       , 
    output  wire                        ad9361_tx_frame_out_p       , 
    //rx channel
    input   wire                        ad9361_rx_clk_in_n          ,     
    input   wire                        ad9361_rx_clk_in_p          ,     
    input   wire        [ 5:0]          ad9361_rx_data_in_n         , 
    input   wire        [ 5:0]          ad9361_rx_data_in_p         ,
    input   wire                        ad9361_rx_frame_in_n        , 
    input   wire                        ad9361_rx_frame_in_p  
);

assign ad7606card_en = 1'b1;

wire pl_clk;
wire user_rstn;
wire user_start;
wire [127:0]ud_wdata_0;

wire ud_wde_0;
wire ud_wclk_0;
wire    [31:0]      gpio_o                                          ;
wire                ap_rst_n                                        ;
wire                data_clk                                        ;
reg                 phase_tvalid                                    ;
reg     [ 1:0]      phase_cnt                                       ;
reg     [11:0]      phase_data                                      ;
wire    [11:0]      phase                                           ;

wire                fddtdd_sw                                       ;  
wire                fddtdd_sw_n                                     ;
wire                trx_sw                                          ;     
wire                trx_sw_n                                        ;  

wire                dac_r1_mode                                     ;
wire                adc_r1_mode                                     ;
wire                data_clk_ce                                     ;
wire                dds_en		                                    ;

wire    [31:0]      data_tdata                                      ;
wire 		        data_tvalid                                     ;

reg	                dac_valid                                       ;
reg     [11:0]      dac_data_i1,dac_data_q1                         ;
reg     [11:0]      dac_data_i2,dac_data_q2                         ;
wire                adc_valid                                       ;
wire                adc_status                                      ;
wire    [11:0]      adc_data_i1,adc_data_q1,adc_data_i2,adc_data_q2 ;

/////////////////////////////////////////////////////////////////////

assign      trx_sw		        =	    gpio_o[0]                   ;
assign      trx_sw_n	        =	    ~gpio_o[0]                  ;
assign      fddtdd_sw	        =	    gpio_o[1]                   ;
assign      fddtdd_sw_n	        =	    ~gpio_o[1]                  ;
assign      ad9361_txnrx_o	    =	    gpio_o[2]                   ;
assign      ad9361_enable_o	    =	    gpio_o[3]                   ;
assign      ad9361_resetb_o	    =	    gpio_o[4]                   ;
assign      ad9361_sync_in_o    =	    gpio_o[5]                   ;
assign      ad9361_en_agc_o	    =	    gpio_o[6]                   ;
assign      ad9361_ctrl_in_o    =	    gpio_o[10:7]                ;
assign      ledr_trx1_o	        =	    gpio_o[11]                  ;
assign      ledg_trx1_o	        =	    gpio_o[12]                  ;
assign      ledb_trx1_o	        =	    gpio_o[13]                  ;
assign      ledr_trx2_o	        =	    gpio_o[14]                  ;
assign      ledg_trx2_o	        =	    gpio_o[15]                  ;
assign      ledb_trx2_o	        =	    gpio_o[16]                  ;
assign      dac_r1_mode	        =	    gpio_o[17]                  ;
assign      adc_r1_mode	        =	    gpio_o[18]                  ;
assign      data_clk_ce	        =	    gpio_o[19]                  ;
assign      dds_en		        =	    gpio_o[20]                  ;

/////////////////////////////////////////////////////////////////////




///////////////////////////////////////////////////////////////////////
//接收部分
wire [15:0] data_out_I,data_out_Q;

wire [15:0] fir_data_I, fir_data_Q;   
wire [15:0] fifo3_data_I, fifo3_data_Q; 
wire [84:0]re_sum;
wire [84:0]im_sum;
wire [15:0]div;
wire out_valid;
wire clk_4MHz;
wire [17:0]yi,yq;
wire [15:0] u,e,w;
wire [17:0] yik,yqk;
top_receive m_top_receive(
  .clk(data_clk),
  .rst_n(rst_n),
  .data_in_I(adc_data_i1),
  .data_in_Q(adc_data_q1),
  .data_in_valid(adc_valid),
  .data_out_I(data_out_I),
  .data_out_Q(data_out_Q),
  .data_out_valid(data_out_valid),
  .fir_data_I(fir_data_I),//guance
  .fir_data_Q(fir_data_Q),
  .fifo3_data_I(fifo3_data_I),
  .fifo3_data_Q(fifo3_data_Q),
.re_sum(re_sum),
.im_sum(im_sum),
.div(div),
.out_valid(out_valid),
.clk_4MHz(clk_4MHz),
.yi(yi),
.yq(yq)
);


///////////////////////////////////////////////////////////////////////
reg [9:0] count;

always @(posedge data_clk) begin
  if (count < 10'd1000) begin
       count <= count+10'd1;
     end
   else begin
      count <= count;
   end
end

assign rst_n = (count !=10'd1000)?1'b0:1'b1;


wire [11:0] dac_data_i1_qpsk;
wire [11:0] dac_data_q1_qpsk;
wire data_valid_qpsk;

reg [13:0] addr;

always @(posedge data_clk) begin
   addr <= addr+13'd1;
end


blk_mem_gen_R U_R
  (
    .clka(data_clk),
    .addra(addr[13:1]),
    .douta(dac_data_i1_qpsk)
  );

blk_mem_gen_I U_I
  (
    .clka(data_clk),
    .addra(addr[13:1]),
    .douta(dac_data_q1_qpsk)
  );
 
assign data_valid_qpsk = addr[0];


always @(posedge data_clk) begin
    if(rst_n == 1'b0) begin
        dac_valid <= 1'b0;
        dac_data_i1 <= 'd0;
        dac_data_q1 <= 'd0;
        dac_data_i2 <='d0;
        dac_data_q2 <= 'd0;
    end
    else begin
        dac_valid <= data_valid_qpsk;
        dac_data_i1 <= dac_data_i1_qpsk;    //dac_data_i1_qpsk
        dac_data_q1 <= dac_data_q1_qpsk;   //dac_data_q1_qpsk
        dac_data_i2 <= dac_data_i1_qpsk;    //dac_data_i1_qpsk
        dac_data_q2 <= dac_data_q1_qpsk;  //dac_data_q1_qpsk
    end
end


reg         start_cnt_flag = 0 ;
reg     [31:0]      data_cnt     = 0 ;

always @(posedge data_clk ) begin
    if (data_cnt < 32'h0004_0000 && user_start == 1'b1)
        start_cnt_flag <= 1'b1 ;
    else
        start_cnt_flag <= 'd0 ;
end


always@(posedge data_clk)begin
        if(user_rstn == 1'b0)begin
            data_cnt <= 32'd0;
        end
        else if (user_start == 1'b0)
            data_cnt <= 32'd0;
        else if(start_cnt_flag & data_out_valid) begin
            data_cnt <= data_cnt + 1'b1; 
        end
end

reg rd_en ;
wire empty ;
reg empty_r ;
wire [127:0] dout ;
always @(posedge data_clk ) begin
    if (empty == 1'b0 && empty_r == 1'b1)
        rd_en <= 1'b1 ;
    else 
        rd_en <= 1'b0 ;
end

always @(posedge data_clk ) begin
    empty_r <= empty ;
end


wire [31:0] din ;
//assign din = {4'h0,adc_data_q1,4'h0,adc_data_i1};
assign din = {data_out_I,data_out_Q};

fifo_generator_0 your_instance_name (
  .wr_clk(data_clk),  // input wire wr_clk
  .rd_clk(data_clk),  // input wire rd_clk
  .din(din),        // input wire [31 : 0] din
 // .wr_en(start_cnt_flag & adc_valid),    // input wire wr_en
  .wr_en(start_cnt_flag & data_out_valid),    // input wire wr_en
  .rd_en(rd_en),    // input wire rd_en
  .dout(dout),      // output wire [127 : 0] dout
  .full(),      // output wire full
  .empty(empty)    // output wire empty
);

// assign ud_wdata_0 = {test_data, 96'h12131415_16171819_20212223} ;
assign ud_wdata_0 = {dout[31:0],dout[63:32],dout[95:64],dout[127:96]} ;
// assign ud_wde_0   = user_start & adc_valid;
assign ud_wde_0   = start_cnt_flag & rd_en;
assign ud_wclk_0  = data_clk;


ila_0 ila0_dg 
(
.clk(data_clk),
.probe0({fir_data_I,fir_data_Q,fifo3_data_I,fifo3_data_Q,yi,yq,data_out_I,data_out_Q,dac_data_i1,dac_data_q1})
);

design_1_wrapper system_i
(
    .DDR_addr(DDR_addr),
    .DDR_ba(DDR_ba),
    .DDR_cas_n(DDR_cas_n),
    .DDR_ck_n(DDR_ck_n),
    .DDR_ck_p(DDR_ck_p),
    .DDR_cke(DDR_cke),
    .DDR_cs_n(DDR_cs_n),
    .DDR_dm(DDR_dm),
    .DDR_dq(DDR_dq),
    .DDR_dqs_n(DDR_dqs_n),
    .DDR_dqs_p(DDR_dqs_p),
    .DDR_odt(DDR_odt),
    .DDR_ras_n(DDR_ras_n),
    .DDR_reset_n(DDR_reset_n),
    .DDR_we_n(DDR_we_n),
    .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
    .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
    .FIXED_IO_mio(FIXED_IO_mio),
    .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
    .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
    .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
    .GPIO_O_0                   (gpio_o                             ),
    .ap_rst_n_0				    (ap_rst_n                           ),
    .M_AXIS_DATA_0_tdata        (data_tdata                         ),
    .M_AXIS_DATA_0_tvalid       (data_tvalid                        ),
    .SPI0_MISO_I_0              (ad9361_spi_miso_i                  ),
    .SPI0_MOSI_O_0              (ad9361_spi_mosi_o                  ),
    .SPI0_SCLK_O_0              (ad9361_spi_clk_o                   ),
    .SPI0_SS_O_0                (ad9361_spi_csn_o                   ),
    .S_AXIS_PHASE_0_tdata       (phase_data                         ),
    .S_AXIS_PHASE_0_tvalid      (phase_tvalid                       ),
    .adc_data_i1_0              (adc_data_i1                        ),
    .adc_data_i2_0              (adc_data_i2                        ),
    .adc_data_q1_0              (adc_data_q1                        ),
    .adc_data_q2_0              (adc_data_q2                        ),
    .adc_mode_r1_0              (adc_r1_mode                        ),
    .adc_status_0               (adc_status                         ),
    .adc_valid_0                (adc_valid                          ),
    .dac_data_i1_0              (dac_data_i1                        ),
    .dac_data_i2_0              (dac_data_i2                        ),
    .dac_data_q1_0              (dac_data_q1                        ),
    .dac_data_q2_0              (dac_data_q2                        ),
    .dac_mode_r1_0              (dac_r1_mode                        ),
    .dac_valid_0                (dac_valid                          ),
    .data_clk_0                 (data_clk                           ),
    .data_clk_ce_0              (data_clk_ce                        ),
    .phase_0                    (phase                              ),
    .rx_clk_in_n_0              (ad9361_rx_clk_in_n                 ),
    .rx_clk_in_p_0              (ad9361_rx_clk_in_p                 ),
    .rx_data_in_n_0             (ad9361_rx_data_in_n                ),
    .rx_data_in_p_0             (ad9361_rx_data_in_p                ),
    .rx_frame_in_n_0            (ad9361_rx_frame_in_n               ),
    .rx_frame_in_p_0            (ad9361_rx_frame_in_p               ),
    .tx_clk_out_n_0             (ad9361_tx_clk_out_n                ),
    .tx_clk_out_p_0             (ad9361_tx_clk_out_p                ),
    .tx_data_out_n_0            (ad9361_tx_data_out_n               ),
    .tx_data_out_p_0            (ad9361_tx_data_out_p               ),
    .tx_frame_out_n_0           (ad9361_tx_frame_out_n              ),
    .tx_frame_out_p_0           (ad9361_tx_frame_out_p              ),
    .ud_wclk_0                  (ud_wclk_0                          ),
    .ud_wdata_0                 (ud_wdata_0                         ),
    .ud_wde_0                   (ud_wde_0                           ),
    .user_rstn                  (user_rstn                          ),
    .user_start                 (user_start                         )
);


endmodule


