`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/10 18:47:26
// Design Name: 
// Module Name: complex_mult
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


module complex_mult(
input rst,
input clk,
input  [35:0] com_iq,//拼接后的带有实部虚部数据
output [74:0] re_result2,
output [74:0] im_result2,   
output valid2
    );
    wire [36:0] re_result1;
    wire [36:0] im_result1;  
    wire [79 : 0] result1; 
    wire [47:0]a;
    wire valid1;  //第一层乘法输出有效
    wire [159 : 0] result2;
    reg [79 : 0]reg_b;
    wire [79 : 0]b;
    //取出1结果中实部和虚部
    assign im_result1=result1[76:40];
    assign re_result1=result1[36:0];
    
    //取出2结果中的实部和虚部
    assign im_result2=result2[154:80];
    assign re_result2=result2[74:0];
    
    //拼接合适的第一次输入a
    assign a={{6{1'b0}},com_iq[17:0],{6{1'b0}},com_iq[35:18]};

//把第一次输出的结果给b

 
//    reg_b<={{2{1'b0}},im_result1,{2{1'b0}},re_result1};
    assign b=valid1?{{3{1'b0}},im_result1,{3{1'b0}},re_result1}:0;

//输入计数，记录输入200个数据的内容
//reg [7:0]count;
//reg in_valid;
//always@(posedge clk or posedge rst)begin
//if(valid2)
//count<=count+8'd1;
//else if(count==8'd200)begin
//count<=0;
//end
//end
        wire a_tvalid;
    assign a_tvalid=(com_iq>36'd0)?1:0;
    cmpy_0 u1 (
  .aclk(clk),                              // input wire aclk
  .s_axis_a_tvalid(a_tvalid),        // input wire s_axis_a_tvalid
  .s_axis_a_tdata(a),          // input wire [47 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(a_tvalid),        // input wire s_axis_b_tvalid
  .s_axis_b_tdata(a),          // input wire [47 : 0] s_axis_b_tdata
  .m_axis_dout_tvalid(valid1),  // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(result1)    // output wire [79 : 0] m_axis_dout_tdata
);


   cmpy_1 u2 (
  .aclk(clk),                              // input wire aclk
  .s_axis_a_tvalid(valid1),        // input wire s_axis_a_tvalid
  .s_axis_a_tdata(b),          // input wire [79 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(valid1),        // input wire s_axis_b_tvalid
  .s_axis_b_tdata(b),          // input wire [79 : 0] s_axis_b_tdata
  .m_axis_dout_tvalid(valid2),  // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(result2)    // output wire [159 : 0] m_axis_dout_tdata
);
endmodule
