
/********************MILIANKE**************************

*Company : MiLianKe Electronic Technology Co., Ltd.
*WebSite:https://www.milianke.com
*TechWeb:https://www.uisrc.com
*tmall-shop:https://milianke.tmall.com
*jd-shop:https://milianke.jd.com
*taobao-shop1: https://milianke.taobao.com
*Create Date: 2021/10/15
*File Name: pl_intr.c
*Description:
*Declaration:
*The reference demo provided by Milianke is only used for learning.
*We cannot ensure that the demo itself is free of bugs, so users
*should be responsible for the technical problems and consequences
*caused by the use of their own products.
*Copyright: Copyright (c) MiLianKe
*All rights reserved.
*Revision: 1.0

****************************************************/

#include "pl_intr.h"
#include "protocol.h"

#define FDMA_DBUF_BASE_ADDR 0x43C00000

volatile fdma_buf_st fdma_buf;

void PS_RX_intr_Handler(void *param)
{
		fdma_buf.record[fdma_buf.circle_cnt]= Xil_In32((UINTPTR)FDMA_DBUF_BASE_ADDR);

		if(fdma_buf.circle_cnt<16)
			fdma_buf.circle_cnt ++ ;
		else
			fdma_buf.circle_cnt = 0;

		fdma_buf.pkg_done_cnt++;
}


void PS_TX_intr_Handler(void *param)
{
    //int ps_tx_intr_id = (int)param;
    //printf("ps_tx_intr_id=%d int\n\r", ps_tx_intr_id);
}

static void pl_intr_setup(XScuGic *InstancePtr, int intId, int intType)
{
    int mask;

    intType &= PL_INT_TYPE_MASK;
    mask = XScuGic_DistReadReg(InstancePtr, INT_CFG0_OFFSET + (intId/16)*4);
    mask &= ~(PL_INT_TYPE_MASK << (intId%16)*2);
    mask |= intType << ((intId%16)*2);
    XScuGic_DistWriteReg(InstancePtr, INT_CFG0_OFFSET + (intId/16)*4, mask);
}

int pl_intr_init(XScuGic * InstancePtr)
{
	int status;

    // Connect SW1~SW2 interrupt to handler
    status = XScuGic_Connect(InstancePtr,FDMAW_INT_ID,(Xil_ExceptionHandler)PS_RX_intr_Handler,(void *)1);

    if(status != XST_SUCCESS) return XST_FAILURE;

    //status = XScuGic_Connect(InstancePtr,FDMAR_INT_ID,(Xil_ExceptionHandler)PS_TX_intr_Handler,(void *)2);

    //if(status != XST_SUCCESS) return XST_FAILURE;

    // Set interrupt type of SW1~SW2 to rising edge
    pl_intr_setup(InstancePtr, FDMAW_INT_ID, PL_INT_TYPE_RISING_EDGE);
   // pl_intr_setup(InstancePtr, FDMAR_INT_ID, PL_INT_TYPE_RISING_EDGE);

    // Enable SW1~SW2 interrupts in the controller
    XScuGic_Enable(InstancePtr, FDMAW_INT_ID);
    //XScuGic_Enable(InstancePtr, FDMAR_INT_ID);


    return XST_SUCCESS;
}

