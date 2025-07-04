`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/30 10:22:08
// Design Name: 
// Module Name: InterpolateFilter
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

//����InterpolateFilter.v�ļ��ĳ����嵥
module InterpolateFilter (
	rst,clk,din,uk,
	dout); 
	
	input		rst;   //��λ�źţ��ߵ�ƽ��Ч
	input		clk;   //ʱ���ź�/������������/4����������/4 MHz
	input  signed [15:0]	din;     //����I��Q֧·����/4 MHz��15 bitС��λ
	input  signed [15:0]	uk;      //��ֵ�����15 bitС��λ
	output signed [17:0]	dout;    //��ֵ�˲����/4 MHz����ΧΪ-4��4��15bitС��λ
	

   //���ݼ�����Ҫ�������ݽ�����ʱ����
	reg  signed [15:0] din_1,din_2,din_3,din_4,din_5,din_6;
	reg  signed [15:0] u_1,u_2;
	wire signed [33:0] f2_u;
	reg  signed [33:0] f2_u_1,f2_u_2;	
   always @(posedge clk or posedge rst)
      if (rst)
		   begin
            din_1 <= 16'd0;
            din_2 <= 16'd0;
            din_3 <= 16'd0;
            din_4 <= 16'd0;
            din_5 <= 16'd0;
            din_6 <= 16'd0;
            u_1   <= 16'd0;
            u_2   <= 16'd0;
            f2_u_1<= 34'd0;
            f2_u_2<= 34'd0;
			end
		else
		   begin
            din_1 <= din;
            din_2 <= din_1;
            din_3 <= din_2;
            din_4 <= din_3;
            din_5 <= din_4;
            din_6 <= din_5;
            u_1 <= uk;
            u_2 <= u_1;
            f2_u_1 <= f2_u;
            f2_u_2 <= f2_u_1;
         end

    
    //������λ����ʵ��1/2���˷���f1=0.5*din-0.5din(m-1)-0.5*din(m-2)+0.5*din(m-3)
    //Ϊ��ֹ���������f1��f2����չ��3λ����λ��С��λ��Ϊ15 bit
	 wire signed [17:0] f1,f2;
	 assign f1 = (rst)? 18'd0: ({{3{din[15]}},din[15:1]}-{{3{din_1[15]}},din_1[15:1]}-{{3{din_2[15]}},din_2[15:1]}+{{3{din_3[15]}},din_3[15:1]});
	 
                  
    //f2=1.5*din(m-1)-0.5*din-0.5*din(m-2)-0.5*din(m-3) 
	 assign f2 = (rst)? 18'd0: ({{2{din_1[15]}},din_1}+{{3{din_1[15]}},din_1[15:1]}-{{3{din[15]}},din[15:1]}-{{3{din_2[15]}},din_2[15:1]}-{{3{din_3[15]}},din_3[15:1]});
	 
    //f3 <= din_2;
    
    //f1_u=f1*uk,f1_u������λ��Ϊ4��С��λ��Ϊ30�����ݳ˷���IP�����õĴ�����ʱΪ2������
	 wire signed [33:0] f1_u;
    mult18_16 u1 (
	    .CLK( clk),
		 .A (f1),
		 .B (uk),
		 .P (f1_u));
    
   //f2_u=f2*uk,f2_u������λ��Ϊ4��С��λ��Ϊ30�����ݳ˷���IP�����õĴ�����ʱΪ2������
    mult18_16 u2 (
	    .CLK( clk),
		 .A (f2),
		 .B (uk),
		 .P (f2_u));	

    //f1_u2=f2*u*u��u_2Ϊu��ʱ2�����ں�����ݣ�ʹu��f1_uʱ���϶���
    //f1_uֻȡ15λС��λ3λ����λ�������㣬f1_u2������λ����Ϊ4��С��λ����Ϊ30
	 wire signed [33:0] f1_u2;
    mult18_16 u3 (
	    .CLK( clk),
		 .A (f1_u[32:15]),
		 .B (u_2),
		 .P (f1_u2));		 
        
    //����f2_u,f1_u2,din_2��С��λ��С��λ����ȡ15 bit��
    //f1_u2�����������f2_u��2��������ʱ�������f3(din_2)��4��������ʱ�����
    //�ӷ���������Ҫͨ����ʱ�����Զ���ʱ��
	 wire signed [18:0] dt;
	 assign dt = (rst)? 19'd0:(f2_u_2[33:15]+f1_u2[33:15]+{{3{din_6[15]}},din_6});

   //����uֵС��1���ۺϿ������Ų�ֵ�㷨������2 bit����λ���ɷ�ֹ������������
   //ȡ3λ������15λС������18 bit�������
   //��ʱ����һ���Ĵ�������Ϊ������ϵͳ�������ٶ�
	reg signed [17:0] dtem;
   always @(posedge clk or posedge rst)
	   if (rst)
		   dtem <= 18'd0;
		else
		   dtem <= dt[17:0];
			
	assign dout =dtem;
 
	
endmodule


