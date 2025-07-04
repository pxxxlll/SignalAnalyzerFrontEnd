`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/10 12:09:36
// Design Name: 
// Module Name: FpgaPhase
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


module FpgaPhase(
input rst,
input clk,
input signed [15:0]	di,
input signed [15:0]	dq,
output signed  [17:0]yi_out,
output signed  [17:0]yq_out,
output y_valid,
    output [84:0]re_sum,
output [84:0]im_sum,
output [15:0]div,
output out_valid,
    output signed [17:0] yi,
     output signed [17:0] yq,
     output [17:0]reg_div
    );
    
    
     wire clk1;
clk1 clock(
.clk(clk),   //16M
.rst(rst),
.clk1(clk1)  //4M
);
wire  signed [31:0] yi_tmp,yq_tmp;

assign yi = yi_tmp[31:14];
	assign yq = yq_tmp[31:14];
		   FpgaGardner u0 (
	.rst(rst),
	.clk(clk),  //16M
	.di(di),
	.dq(dq),
	.yi(yi_tmp),
	.yq(yq_tmp),
	.sync(),
	.u(),
	.e(),
	.w()
	);
	
	   //先对数据存入寄存器
    reg signed [35:0] reg_iq;
    always @(posedge clk or posedge rst)
      if (rst)
		   begin
			reg_iq<=36'd0;
			end
		else
	      begin
            reg_iq<={yi,yq};
		   end
	wire [35:0]reg_l_iq;
	wire l_valid;
	 length_0 l0(
.rst(rst),
.clk(clk1),
.yi(yi),
.yq(yq),
.reg_l_iq(reg_l_iq),
.l_valid(l_valid)
    );
    
	//乘法运算
	wire [74:0]re_result2,im_result2;
	wire valid2;
	 complex_mult u1(
.rst(rst),
.clk(clk1),
.com_iq(reg_l_iq),//拼接后的带有实部虚部数据
.re_result2(re_result2),
.im_result2(im_result2),   
.valid2(valid2)
    );
    
    //求和求反正切
//    wire [84:0]re_sum;
//wire [84:0]im_sum;
//wire [15:0]div;
wire div_valid;
 sum_cordic u2(
.rst(rst),
.clk(clk1),
.re_result2(re_result2),
.im_result2(im_result2),   
.valid2(valid2),
.l_valid(l_valid),
.re_sum(re_sum),
.im_sum(im_sum),
.div(div),
.div_valid(div_valid)
    );
    
    
    	//fifo存数据
	wire [35 : 0]data;//存入的数据
	wire full;
	wire empty;
 fifo f0(
.rst(rst),
.clk(clk1),
.reg_iq(reg_iq),
.div_valid(div_valid),
.div(div),
.dout(data),
.full(full),
.empty(empty),
.yi_out(yi_out),
.yq_out(yq_out),
.y_valid(y_valid),
.out_valid(out_valid),
.reg_div(reg_div)
    );
endmodule
