`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// 
//////////////////////////////////////////////////////////////////////////////////

//这是InterpolateFilter.v文件的程序清单
module InterpolateFilter1 (
	rst,clk,din,uk,
	dout,f1,f2,strobe,count); 
	
	input		rst;   //复位信号，高电平有效
	input		clk;   //时钟信号/数据输入速率/4倍符号速率/4 MHz
	input  signed [15:0]	din;     //基带I或Q支路数据/4 MHz，15 bit小数位(保留16位，整个的输入)
	input  signed [31:0]	uk;      //插值间隔，30 bit小数位
	output signed [31:0]	dout;    //插值滤波输出/4 MHz，32bit，29bit小数位
	output signed [17:0]  f1;
	output signed [17:0] f2;
	input strobe;
	input [1:0] count;
	

   //根据计算需要，对数据进行延时处理
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

    
    //采用移位处理实现1/2倍乘法：f1=0.5*din-0.5din(m-1)-0.5*din(m-2)+0.5*din(m-3)
    //为防止数据溢出，f1、f2均扩展成3位整数位，小数位仍为15 bit
	 wire signed [17:0] f1,f2;
	 assign f1 = (rst)? 18'd0: ({{3{din[15]}},din[15:1]}-{{3{din_1[15]}},din_1[15:1]}-{{3{din_2[15]}},din_2[15:1]}+{{3{din_3[15]}},din_3[15:1]});
	 
                  
    //f2=1.5*din(m-1)-0.5*din-0.5*din(m-2)-0.5*din(m-3) 
	 assign f2 = (rst)? 18'd0: ({{2{din_1[15]}},din_1}+{{3{din_1[15]}},din_1[15:1]}-{{3{din[15]}},din[15:1]}-{{3{din_2[15]}},din_2[15:1]}-{{3{din_3[15]}},din_3[15:1]});
	 
    //f3 <= din_2;
    
    reg [31:0] uk_tmp;
    always @(posedge clk) begin
        if(rst == 1'b1)
        uk_tmp <= 32'b00101000000000000000000000000000;  //两位整数位，0.75
        else if((strobe == 1'b1)&&(count==2'd1))
        uk_tmp <= uk;
        else 
        uk_tmp <= uk_tmp;        
    end
    
    //f1_u=f1*uk,f1_u的整数位数为4，小数位数为30，根据乘法器IP核设置的处理延时为2个周期
	 wire signed [49:0] f1_u;
    mult18_32 u1 (
	   // .CLK(clk),
		 .A (f1),   //18bit  15bit小数位
		 .B (uk_tmp), //32bit  30bit小数位
		 .P (f1_u));  //50bit, 45bit小数位
    
   //f2_u=f2*uk,f2_u的整数位数为4，小数位数为30，根据乘法器IP核设置的处理延时为2个周期
   wire signed [49:0] f2_u;
    mult18_32 u2 (
	   // .CLK( clk),
		 .A (f2),  //18bit  15bit小数位
		 .B (uk_tmp),  //32bit  30bit小数位
		 .P (f2_u));   //50bit, 45bit小数位	 

    //f1_u2=f2*u*u，u_2为u延时2个周期后的数据，使u与f1_u时序上对齐
    //f1_u只取15位小数位3位整数位参与运算，f1_u2的整数位数仍为4，小数位数仍为30
	 wire signed [49:0] f1_u2;
    mult18_32 u3 (
	   // .CLK( clk),
		 .A (f1_u[47:30]),   //18bit, 15bit小数位
		 .B (uk_tmp),        //32bit，30bit小数位
		 .P (f1_u2));		 //50bit,45bit小数位
        
    //对齐f2_u,f1_u2,din_2的小数位（小数位数均取15 bit）
    //f1_u2的运算相对于f2_u有2个周期延时，相对于f3(din_2)有4个周期延时，因此
    //加法运算里需要通过延时处理，以对齐时序
	 wire signed [49:0] dt;
	 assign dt = (rst)? 49'd0:(f2_u+f1_u2+{{4{din_2[15]}},din_2,{30{1'b0}}});

   //由于u值小于1，综合考虑整信插值算法，增加2 bit整数位即可防止数据溢出，因此
   //取3位整数，15位小数，共18 bit数据输出
   //此时增加一级寄存器，是为了增加系统的运算速度
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


