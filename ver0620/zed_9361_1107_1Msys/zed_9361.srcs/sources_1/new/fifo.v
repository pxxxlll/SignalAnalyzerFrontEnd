`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/15 17:10:29
// Design Name: 
// Module Name: fifo
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


module fifo(
input rst,
input clk,
input [35:0]reg_iq,
input div_valid,
input [15:0]div,
output wire [35 : 0] dout,
output wire full,
output wire empty,
output [17:0] yi_out,
output [17:0] yq_out,
output reg y_valid,   //需要补充y_valid信号，该信号每四个clk周期有效一次
output out_valid,
output reg [17:0]reg_div
    );
    
//四个周期写入一次数据
reg [2:0]count;


reg w_en,r_en;
 always @(posedge clk or posedge rst)begin
 if(rst)begin
 count<=3'b0;
 w_en<=1'b0;
 y_valid<=1'b0;
 end
 else if(count==3'b011)begin
 count<=3'b0;
 w_en<=1'b1;
 y_valid<=1'b1;
 end
 else begin
 count<=count+1'b1;
  w_en<=1'b0;
  y_valid<=1'b0;
 end
 end   
 
 //将角度储存
// reg [17:0]reg_div;
 always @(posedge clk or posedge rst)begin
 if(rst)begin
 reg_div<=18'b0;
 end
 else if(div_valid)begin
 reg_div<={div,{2{1'b0}}};
 end
 end
//FIFO存350个读出，进行补偿，同时在下一个周期后进行同步补偿
reg [16:0]flag;
always @(posedge clk or posedge rst)begin
 if(rst)begin
 flag<=17'd0;
 end
 else begin
 flag<=flag+17'd1;
 end
 end
always@(posedge clk )begin
if(flag>=17'd1660)begin
  flag<=flag;
  if(count==3'b011)
  r_en<=1;
  else
  r_en<=0;
end
end   

//fifo_36x512 f1 (
//  .clk(clk),      // input wire clk
//  .srst(rst),      // input wire rst
//  .din(reg_iq),      // input wire [35 : 0] din
//  .wr_en(w_en),  // input wire wr_en
//  .rd_en(r_en),  // input wire rd_en
//  .dout(dout),    // output wire [35 : 0] dout
//  .full(full),    // output wire full
//  .empty(empty)  // output wire empty
//);     
fifo_36x1024 f1 (
  .clk(clk),      // input wire clk
  .srst(rst),    // input wire srst
  .din(reg_iq),      // input wire [35 : 0] din
  .wr_en(w_en),  // input wire wr_en
  .rd_en(r_en),  // input wire rd_en
  .dout(dout),    // output wire [35 : 0] dout
  .full(full),    // output wire full
  .empty(empty)  // output wire empty
);
wire [47:0] iq_out;
cordic_1 f2 (
  .aclk(clk),                                        // input wire aclk
  .s_axis_phase_tvalid(1'b1),          // input wire s_axis_phase_tvalid
  .s_axis_phase_tdata(reg_div),            // input wire [23 : 0] s_axis_phase_tdata
  .s_axis_cartesian_tvalid(r_en),  // input wire s_axis_cartesian_tvalid
  .s_axis_cartesian_tdata({{6{1'b0}},dout[35:18],{6{1'b0}},dout[17:0]}),    // input wire [47 : 0] s_axis_cartesian_tdata
  .m_axis_dout_tvalid(out_valid),            // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(iq_out)              // output wire [47 : 0] m_axis_dout_tdata
);
assign yi_out=iq_out[17:0];
assign yq_out=iq_out[41:24];
endmodule

