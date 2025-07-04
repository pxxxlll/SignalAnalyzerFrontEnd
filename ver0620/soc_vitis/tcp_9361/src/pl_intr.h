
/********************MILIANKE**************************

*Company : MiLianKe Electronic Technology Co., Ltd.
*WebSite:https://www.milianke.com
*TechWeb:https://www.uisrc.com
*tmall-shop:https://milianke.tmall.com
*jd-shop:https://milianke.jd.com
*taobao-shop1: https://milianke.taobao.com
*Create Date: 2021/10/15
*File Name: pl_intr.h
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


#ifndef SYS_PLINT_H_
#define SYS_PLINT_H_

#include <stdio.h>
#include "xscugic.h"
#include "xil_exception.h"
#include "sys_intr.h"


#define INT_CFG0_OFFSET 		0x00000C00
// Parameter definitions
#define FDMAW_INT_ID            61

#define PL_INT_TYPE_RISING_EDGE 0x03
#define PL_INT_TYPE_HIGHLEVEL   0x01
#define PL_INT_TYPE_MASK        0x03

void PS_TX_intr_Handler(void *param);
void PS_RX_intr_Handler(void *param);


int pl_intr_init(XScuGic * InstancePtr);

#endif
