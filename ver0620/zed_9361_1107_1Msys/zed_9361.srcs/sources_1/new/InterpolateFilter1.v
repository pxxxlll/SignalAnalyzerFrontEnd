`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// 
//////////////////////////////////////////////////////////////////////////////////

//����InterpolateFilter.v�ļ��ĳ����嵥
module InterpolateFilter1 (
	rst,clk,din,uk,
	dout,f1,f2,strobe,count); 
	
	input		rst;   //��λ�źţ��ߵ�ƽ��Ч
	input		clk;   //ʱ���ź�/������������/4����������/4 MHz
	input  signed [15:0]	din;     //����I��Q֧·����/4 MHz��15 bitС��λ(����16λ������������)
	input  signed [31:0]	uk;      //��ֵ�����30 bitС��λ
	output signed [31:0]	dout;    //��ֵ�˲����/4 MHz��32bit��29bitС��λ
	output signed [17:0]  f1;
	output signed [17:0] f2;
	input strobe;
	input [1:0] count;
	

   //���ݼ�����Ҫ�������ݽ�����ʱ����
	reg  signed [15:0] din_1,din_2,din_3;

   always @(posedge clk or posedge rst)
      if (rst)
		   begin
            din_1 <= 16'd0;
            din_2 <= 16'd0;
            din_3 <= 16'd0;
			end
		else if(count == 2'd1)
		   begin
            din_1 <= din;
            din_2 <= din_1;
            din_3 <= din_2;
         end

    
    //������λ����ʵ��1/2���˷���f1=0.5*din-0.5din(m-1)-0.5*din(m-2)+0.5*din(m-3)
    //Ϊ��ֹ���������f1��f2����չ��3λ����λ��С��λ��Ϊ15 bit
	 wire signed [17:0] f1,f2;
	 assign f1 = (rst)? 18'd0: ({{3{din[15]}},din[15:1]}-{{3{din_1[15]}},din_1[15:1]}-{{3{din_2[15]}},din_2[15:1]}+{{3{din_3[15]}},din_3[15:1]});
	 
                  
    //f2=1.5*din(m-1)-0.5*din-0.5*din(m-2)-0.5*din(m-3) 
	 assign f2 = (rst)? 18'd0: ({{2{din_1[15]}},din_1}+{{3{din_1[15]}},din_1[15:1]}-{{3{din[15]}},din[15:1]}-{{3{din_2[15]}},din_2[15:1]}-{{3{din_3[15]}},din_3[15:1]});
	 
    //f3 <= din_2;
    
    reg [31:0] uk_tmp;
    always @(posedge clk) begin
        if(rst == 1'b1)
        uk_tmp <= 32'b00101000000000000000000000000000;  //��λ����λ��0.75
        else if((strobe == 1'b1)&&(count==2'd1))
        uk_tmp <= uk;
        else 
        uk_tmp <= uk_tmp;        
    end
    
    //f1_u=f1*uk,f1_u������λ��Ϊ4��С��λ��Ϊ30�����ݳ˷���IP�����õĴ�����ʱΪ2������
	 wire signed [49:0] f1_u;
    mult18_32 u1 (
	   // .CLK(clk),
		 .A (f1),   //18bit  15bitС��λ
		 .B (uk_tmp), //32bit  30bitС��λ
		 .P (f1_u));  //50bit, 45bitС��λ
    
   //f2_u=f2*uk,f2_u������λ��Ϊ4��С��λ��Ϊ30�����ݳ˷���IP�����õĴ�����ʱΪ2������
   wire signed [49:0] f2_u;
    mult18_32 u2 (
	   // .CLK( clk),
		 .A (f2),  //18bit  15bitС��λ
		 .B (uk_tmp),  //32bit  30bitС��λ
		 .P (f2_u));   //50bit, 45bitС��λ	 

    //f1_u2=f2*u*u��u_2Ϊu��ʱ2�����ں�����ݣ�ʹu��f1_uʱ���϶���
    //f1_uֻȡ15λС��λ3λ����λ�������㣬f1_u2������λ����Ϊ4��С��λ����Ϊ30
	 wire signed [49:0] f1_u2;
    mult18_32 u3 (
	   // .CLK( clk),
		 .A (f1_u[47:30]),   //18bit, 15bitС��λ
		 .B (uk_tmp),        //32bit��30bitС��λ
		 .P (f1_u2));		 //50bit,45bitС��λ
        
    //����f2_u,f1_u2,din_2��С��λ��С��λ����ȡ15 bit��
    //f1_u2�����������f2_u��2��������ʱ�������f3(din_2)��4��������ʱ�����
    //�ӷ���������Ҫͨ����ʱ�����Զ���ʱ��
	 wire signed [49:0] dt;
	 assign dt = (rst)? 49'd0:(f2_u+f1_u2+{{4{din_2[15]}},din_2,{30{1'b0}}});

   //����uֵС��1���ۺϿ������Ų�ֵ�㷨������2 bit����λ���ɷ�ֹ������������
   //ȡ3λ������15λС������18 bit�������
   //��ʱ����һ���Ĵ�������Ϊ������ϵͳ�������ٶ�
	reg signed [31:0] dtem;
   always @(posedge clk or posedge rst)
	   if (rst)
		   dtem <= 32'd0;
		else if((strobe == 1'b1)&&(count==2'd01))
		   dtem <= dt[47:16];
		else
		   dtem <= dtem; 
			
	assign dout =dtem;
 
	
endmodule


