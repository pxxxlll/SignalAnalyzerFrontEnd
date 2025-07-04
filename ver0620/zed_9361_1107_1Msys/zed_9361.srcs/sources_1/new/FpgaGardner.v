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


//����FpgaGardner.v�ļ��ĳ����嵥
//module FpgaGardner (
//	rst,clk,di,dq,
//	yi,yq,sync,u,e,w); 
module FpgaGardner (
	rst,clk,
	di,dq,yi,yq,sync,u,e,w,yik,yqk,strobe,f1_I,f1_Q,f2_I,f2_Q,eri,erq,nk,count); 
	
	input		rst;   //��λ�źţ��ߵ�ƽ��Ч
	input		clk;   //ʱ���ź�/������������/4����������/4 MHz   ����ʱ�ӵ�16MHz
    input  signed [15:0]	di;     //����I֧·����/4 MHz
    input  signed [15:0]	dq;     //����Q֧·����/4 MHz
	output signed [31:0]	yi;     //��ֵI֧·����/1 MHz
	output signed [31:0]	yq;     //��ֵQ֧·����/1 MHz
	output signed [31:0]	u;      //��ֵ������
	output signed [31:0]	e;      //����������	
	output signed [31:0]	w;      //����·�˲����˲���Ķ�ʱ���w
	output sync;                 //λͬ������/1MHz
	output signed [31:0] yik;  //32bit  30bitС��λ
	output signed [31:0] yqk;  //32bit  30bitС��λ
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
	
	//���ȶ���������ͨ���Ĵ�������  
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
		
	//ʵ����������������ֵ�������ģ��
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

   //ʵ������ֵ�˲���ģ��
	//wire signed [17:0] yik;
	InterpolateFilter1 u2  ( 
		.rst (rst),
		.clk (clk),
		.din (dit),
		.uk (uk),  //32bit  30bitС��λ
		.dout (yik),  //32bit  29bitС��λ
		.f1(f1_I),
		.f2(f2_I),
		.strobe(strobe),
		.count(count));
 
	//wire signed [17:0] yqk;
	InterpolateFilter1 u3  ( 
		.rst (rst),
		.clk (clk),
		.din (dqt),
		.uk (uk),  //32bit  30bitС��λ
		.dout (yqk),  //32bit  29bitС��λ
		.f1(f1_Q),
		.f2(f2_Q),
		.strobe(strobe),
		.count(count));
 
   
	//��ʱ����⼰��·�˲���ģ��
	ErrorLp u4  ( 
		.rst (rst),
		.clk (clk),
		.strobe (strobe),
		.yik (yik),  //32bit  29bitС��λ
		.yqk (yqk),  //32bit  29bitС��λ
		.yi (yi),   //32bit  29bitС��λ
		.yq (yq),   //32bit  29bitС��λ
		.sync (sync),
		.er (e),   //32bit  30bitС��λ
		.wk (wk),   //32bit  30bitС��λ
		.eri(eri),  //32bit  30bitС��λ
		.erq(erq),  //32bit  30bitС��λ
		.count(count));
endmodule




