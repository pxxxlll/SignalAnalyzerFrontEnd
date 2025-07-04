`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/30 10:16:53
// Design Name: 
// Module Name: FpgaGardner
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//这是FpgaGardner.v文件的程序清单
//module FpgaGardner (
//	rst,clk,di,dq,
//	yi,yq,sync,u,e,w); 
module FpgaGardner (
	rst,clk,
	di,dq,yi,yq,sync,u,e,w,yik,yqk,strobe,f1_I,f1_Q,f2_I,f2_Q,eri,erq,nk,count); 
	
	input		rst;   //复位信号，高电平有效
	input		clk;   //时钟信号/数据输入速率/4倍符号速率/4 MHz   提升时钟到16MHz
    input  signed [15:0]	di;     //基带I支路数据/4 MHz
    input  signed [15:0]	dq;     //基带Q支路数据/4 MHz
	output signed [31:0]	yi;     //插值I支路数据/1 MHz
	output signed [31:0]	yq;     //插值Q支路数据/1 MHz
	output signed [31:0]	u;      //插值间隔输出
	output signed [31:0]	e;      //误差检测器输出	
	output signed [31:0]	w;      //经环路滤波器滤波后的定时误差w
	output sync;                 //位同步脉冲/1MHz
	output signed [31:0] yik;  //32bit  30bit小数位
	output signed [31:0] yqk;  //32bit  30bit小数位
	output strobe;
	output [17:0] f1_I;
	output [17:0] f2_I;
	output [17:0] f1_Q;
	output [17:0] f2_Q;
	output [31:0] eri,erq;
	output [31:0] nk;
	output [1:0] count;


    wire signed [15:0]	di;
    wire signed [15:0]	dq;
	
	reg [1:0] count;
	always @(posedge clk or posedge rst)
	    if(rst) count <= 2'd0;
	    else count <= count+2'd1;
	
	//首先对输入数据通过寄存器输入  
	reg signed [15:0] dit,dqt;
	always @(posedge clk or posedge rst)
      if (rst)
		   begin
			   dit <= 16'd0;
				dqt <= 16'd0;
			end
		else
	      begin
			   dit <= di;
		 	   dqt <= dq;
		   end
		
	//实例化数控振荡器及插值间隔产生模块
	wire signed [31:0] wk,uk,nk;
	wire strobe;
	gnco u1  ( 
		.rst (rst),
		.clk (clk),
		.wk (wk),
		.strobe (strobe),
		.uk (uk),
		.nk (nk),
		.count(count));

   //实例化插值滤波器模块
	//wire signed [17:0] yik;
	InterpolateFilter1 u2  ( 
		.rst (rst),
		.clk (clk),
		.din (dit),
		.uk (uk),  //32bit  30bit小数位
		.dout (yik),  //32bit  29bit小数位
		.f1(f1_I),
		.f2(f2_I),
		.strobe(strobe),
		.count(count));
 
	//wire signed [17:0] yqk;
	InterpolateFilter1 u3  ( 
		.rst (rst),
		.clk (clk),
		.din (dqt),
		.uk (uk),  //32bit  30bit小数位
		.dout (yqk),  //32bit  29bit小数位
		.f1(f1_Q),
		.f2(f2_Q),
		.strobe(strobe),
		.count(count));
 
   
	//定时误差检测及环路滤波器模块
	ErrorLp u4  ( 
		.rst (rst),
		.clk (clk),
		.strobe (strobe),
		.yik (yik),  //32bit  29bit小数位
		.yqk (yqk),  //32bit  29bit小数位
		.yi (yi),   //32bit  29bit小数位
		.yq (yq),   //32bit  29bit小数位
		.sync (sync),
		.er (e),   //32bit  30bit小数位
		.wk (wk),   //32bit  30bit小数位
		.eri(eri),  //32bit  30bit小数位
		.erq(erq),  //32bit  30bit小数位
		.count(count));
endmodule




