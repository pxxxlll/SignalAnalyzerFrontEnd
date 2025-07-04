`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//这是ErrorLp.v文件的程序清单
module ErrorLp (
	rst,clk,strobe,yik,yqk,
	yi,yq,sync,er,wk,eri,erq,count); 
	
	input		rst;    //复位信号，高电平有效
	input		clk;    //时钟信号/数据输入速率/4倍符号速率/4 MHz
	input		strobe; //gnco模块送来的选通信号	
	input  signed [31:0]	yik;   //插值滤波后的I路数据/4 MHz  32bit  29bit小数位
	input  signed [31:0]	yqk;   //插值滤波后的Q路数据/4 MHz	32bit  29bit小数位
	output signed [31:0]	yi;    //最佳采样时刻的插值I路数据/1 MHz位   32bit  29bit小数位
	output signed [31:0]	yq;    //最佳采样时刻的插值Q路数据/1 MHz位	32bit  29bit小数位
	output signed [31:0]	er;    //定时误差信号  32bit  30bit小数位
	output signed [31:0]	wk;    //环路滤波后信号   32bit  30bit小数位
	output sync;                //位同步时钟信号，与最佳采样时刻同步/1 MHz	
	output signed [31:0] eri,erq;
	input [1:0] count;
	
	reg signed [31:0] yik_0,yqk_0,yik_1,yqk_1,yik_2,yqk_2;
	reg signed [31:0] yit,yqt;
	reg signed [31:0] err_1;  //10bit整数位，54bit小数位
	wire signed [31:0] err;   //10bit整数位，54bit小数位
 	reg signed [31:0] w;
	reg sk;
	always @(posedge clk or posedge rst) begin
	    if(rst) sk <= 1'b0;
	    else if((strobe) && (count == 2'd1))
	        sk <= !sk;
	end
	
	always @(posedge clk or posedge rst)
	    if(rst) begin
	        yik_0 <= 32'd0;
            yqk_0 <= 32'd0;
            yik_1 <= 32'd0;
            yqk_1 <= 32'd0;
            yik_2 <= 32'd0;
            yqk_2 <= 32'd0;
	    end
	    else if((strobe)&&(count==2'd2)) begin
	          yik_0 <= yik;
              yqk_0 <= yqk;
              yik_1 <= yik_0;
              yqk_1 <= yqk_0;
              yik_2 <= yik_1;
              yqk_2 <= yqk_1;
        end
              
	
   always @(posedge clk or posedge rst)
      if (rst)  begin
            yit <= 32'd0;
            yqt <= 32'd0;
           // sk  <= 1'b0;
            err_1 <= 32'd0;
            //设置环路滤波器输出的初始值为0.5
            w <= 32'b00100000000000000000000000000000;  //两位整数位
         end
      else
		   begin
         //在检测到gnco模块送来的溢出信号strobe后，取出有效插值数据进行误差检测
         if ((strobe)&& (count==2'd3))
			   begin

              //设置sk信号，其周期为符号周期，作为位定时时钟输出
             // sk <= !sk;
              //每个符号进行一次环路滤波处理
				  if(sk) 
				     begin
                    //此时将最佳插值数据输出，获取最佳位定时采样值，用于基带信号的最后判决解码
                    yit <= yik_0;
                    yqt <= yqk_0;
                    //环路滤波器    
                    err_1 <= err;
                    //通过移位运算，近似实现乘以0.0156的小数运算
                    //err还需要乘以2才得到er，因此只需对err右移5位即实现乘以2^(-6)　
						  w <= w+{{5{err[31]}},err[31:5]}-{{5{err_1[31]}},err_1[31:5]};
						 //w <= w+{{9{err[17]}},err[17:11]}-{{9{err_1[17]}},err_1[17:11]};
                 end                    
           end
        end

reg sync;
always @(posedge clk or posedge rst) begin
    if(rst) begin
        sync <= 1'b0;
    end
    else if((strobe)&& (count==2'd3) && (sk)) begin
        sync <= 1'b1;
    end
    else begin
        sync <= 1'b0;
    end
end
   // assign sync = sk;
	 assign wk = w;
    assign yi = yit;
	 assign yq = yqt;
	 
   /////////////////////////基于Gardner算法的误差检测器//////////////////////////
	wire signed [32:0] Ia2_tmp,Qa2_tmp;
	wire signed [31:0] Ia2,Qa2;
	wire signed [31:0] yik1_Ia,yqk1_Qa;
	reg signed [31:0] eri,erq;
	
	wire signed [63:0] eri_tmp,erq_tmp;
	
   //计算式（8-29），这里没有除以2倍
   assign Ia2_tmp = {yik_0[31],yik_0}+{yik_2[31],yik_2};    
   assign Qa2_tmp = {yqk_0[31],yqk_0}+{yqk_2[31],yqk_2};   
   assign Ia2 = Ia2_tmp[32:1];
   assign Qa2 = Qa2_tmp[32:1];
   //计算式（8-28）中的乘数，进行减法时通过移位实现除以2的运算
   assign yik1_Ia = yik_1-Ia2;
   assign yqk1_Qa = yqk_1-Qa2;
   
   assign eri_tmp = (yik_1-Ia2)*(yik-yik_2);  //6bit整数位， 58bit 小数位
   assign erq_tmp = (yqk_1-Qa2)*(yqk-yqk_2);  //6bit整数位， 58bit 小数位
   
    
   //计算式（8-28），根据yik及yik_2的符号位实现乘法运算
   //err保留3bit整数位
	always @(*)
	    eri <= eri_tmp[60:29];
			
	always @(*)
	   	erq <= erq_tmp[60:29];
    
   assign err = eri+erq;
   assign er = err;
   //通过移位处理，实现2倍乘法运算
  // assign er = (sk)? {err[14:0],1'b0} :16'd0;
   /////////////////////////基于Gardner算法的误差检测器//////////////////////////

endmodule
	
