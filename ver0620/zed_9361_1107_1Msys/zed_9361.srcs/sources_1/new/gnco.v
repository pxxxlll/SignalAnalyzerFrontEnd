`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/30 10:18:49
// Design Name: 
// Module Name: gnco
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


//这是gnco.v文件的程序清单
module gnco (
	rst,clk,wk,
	uk,nk,strobe,count); 
	
	input		rst;   //复位信号，高电平有效
	input		clk;   //时钟信号/数据输入速率/4倍符号速率/4 MHz
	input   signed [31:0] wk;     //环路滤波器输出定时误差信号，15 bit小数位
	output  signed [31:0] uk;     //NCO输出的插值间隔小数，15 bit小数位
	output  signed [31:0] nk;     //NCO寄存器值
	output  strobe;               //NCO输出的插值计算选通信号，高电平有效
	input [1:0] count;
   reg signed [31:0] nkt;
	reg signed [31:0] ut;
	reg str;
   always @(posedge clk or posedge rst)
      if (rst)
		   begin
				//设置nk、uk的初值
				nkt <= 32'b00111000000000000000000000000000;	//0.875
				str <= 1'b0;
				ut  <= 32'b00101000000000000000000000000000;	//0.625
			end
		else if(count == 2'd0)
		   begin
			   if (nkt < wk)
				   begin
						// 负值+1，相当于mod(1);
						nkt <= 32'b01000000000000000000000000000000+nkt-wk;
						str <= 1'b1;
						//取出nkt减去wk之前的值，后续乘以2作为u值输出
						//ut <= nkt;
						ut <= {nkt[30:0],1'b0}; 
					end
				else
				   begin
						nkt <= nkt-wk;
						str <= 1'b0;
					end
	        end
		
		assign nk = nkt;
	   //assign uk = {ut[14:0],1'b0};
	   //assign uk = (ut[14]==1'b1)?16'h7FFF:{ut[14:0],1'b0};
	   assign uk = ut;
	   assign strobe = str;	

endmodule
