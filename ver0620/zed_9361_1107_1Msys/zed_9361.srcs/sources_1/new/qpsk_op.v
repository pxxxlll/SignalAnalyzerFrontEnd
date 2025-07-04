`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/09 17:35:37
// Design Name: 
// Module Name: qpsk_op
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


module qpsk_op(clk,
clk_out1,
rst_n,
 Y_I,Y_Q,
 data_valid
    );
    input clk,rst_n;

/*
	output signed [21:0]Y_I;
	output signed [21:0]Y_Q;      //滤波后的输出数据   
*/

	output signed [11:0]Y_I;
	output signed [11:0]Y_Q;      //滤波后的输出数据 变为12位 
    output data_valid;
    output clk_out1;
 wire rst;
 wire clk_out1;
 wire signed [11:0] Y_I_temp;
  wire signed [11:0] Y_Q_temp;
  assign rst=~rst_n;
  clk_wiz_0 instance_name
   (
    // Clock out ports
    .clk_out1(clk_out1),     // output clk_out1 ，8MHz
    // Status and control signals
    .reset(rst), // input reset
    //.locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk));   //输入时钟16MHz，AD9361单发单收情况下
   
  // output signed [1:0] y_I;  
  // output signed [1:0] y_Q;

    wire signed [1:0] y_I;  
    wire signed [1:0] y_Q;
    wire [1:0]x_2bit;
    wire prbs_en;  
    wire qpsk_en;
    wire y_en;    
    wire [2:0]cnt1;
 wire signed [18:0] Y_I_temp_0;
  wire signed [18:0] Y_Q_temp_0;

   
wire out;

 reg [2:0]cnt;
 always @(posedge clk_out1 or negedge rst_n) begin    //产生8分频计数
     if(!rst_n) cnt<=3'b000;
     else    cnt<=cnt+3'b001;  
 end

assign prbs_en = (cnt == 3'b001 || cnt == 3'b101)?1:0;   //1M符号率 对应2Mbps
assign qpsk_en = (cnt == 3'b111)?1:0;  //1M符号率

 reg [0:0]cnt2;
 always @(posedge clk or negedge rst_n) begin    //产生8分频计数
     if(!rst_n) cnt2<=1'b0;
     else cnt2<=cnt2+1'b1;  
 end
 
 assign data_valid = (cnt2[0] == 1'b1)?1:0;  //16M时钟下，每两个时钟周期有效一次

            prbs23 U1(
            .clk(clk_out1),
            .prbs_en(prbs_en),
            .rst_n(rst_n),
            .out(out)
            );

 assign cnt1 = cnt;
 assign out_out = out;

  comb U2(
        .clk(clk_out1),
        .rst_n(rst_n),
        .qpsk_en(qpsk_en),
        .x(out),
        .count(cnt1),
        .x_2bit(x_2bit)

    );

            qpsk U3(
            .clk(clk_out1),
            .rst_n(rst_n),
            .x_2bit(x_2bit),
            .qpsk_en(qpsk_en),
            .y_I(y_I),
            .y_Q(y_Q),
            .y_en(y_en)
            );



//   fir_op U4(
//        .clk(clk_out1),
//        .rst_n(rst_n),
//        .x(y_I),      //注意数据输入符号率
//        .Y(Y_I_temp)
//    );

//   fir_op U5(
//        .clk(clk_out1),
//        .rst_n(rst_n),
//        .x(y_Q),      //注意数据输入符号率
//        .Y(Y_Q_temp)
//);
fir_compiler_0 fir_compiler_I (
  .aclk(clk_out1),                              // input wire aclk
  .s_axis_data_tvalid(1'd1),  // input wire s_axis_data_tvalid
//  .s_axis_data_tready(1'd1),  // output wire s_axis_data_tready
  .s_axis_data_tdata(y_I),    // input wire [1 : 0] s_axis_data_tdata
 // .m_axis_data_tvalid(),  // output wire m_axis_data_tvalid
  .m_axis_data_tdata(Y_I_temp_0)    // output wire [15 : 0] m_axis_data_tdata
);

fir_compiler_0 fir_compiler_Q (
  .aclk(clk_out1),                              // input wire aclk
  .s_axis_data_tvalid(1'd1),  // input wire s_axis_data_tvalid
 // .s_axis_data_tready(1'd1),  // output wire s_axis_data_tready
  .s_axis_data_tdata(y_Q),    // input wire [1 : 0] s_axis_data_tdata
 // .m_axis_data_tvalid(),  // output wire m_axis_data_tvalid
  .m_axis_data_tdata(Y_Q_temp_0)    // output wire [15 : 0] m_axis_data_tdata
);

  wire signed [11:0] Y_I_temp_1;
  wire signed [11:0] Y_Q_temp_1;
  
    assign Y_I_temp_1 = Y_I_temp_0[15:4];
    assign Y_Q_temp_1 = Y_Q_temp_0[15:4];
    
    //assign Y_I_temp_1 = y_I;
    //assign Y_Q_temp_1 = y_Q;
fifo_generator_1 I (
  .wr_clk(clk_out1),                // input wire wr_clk
  .rd_clk(clk),                // input wire rd_clk
  .din(Y_I_temp_1),                      // input wire [11 : 0] din
  .wr_en(1),                  // input wire wr_en
  .rd_en(data_valid),                  // input wire rd_en
  .dout(Y_I)                    // output wire [11 : 0] dout
 // .full(full),                    // output wire full
  //.empty(empty),                  // output wire empty
//  .rd_data_count(rd_data_count),  // output wire [6 : 0] rd_data_count
 // .wr_data_count(wr_data_count)  // output wire [6 : 0] wr_data_count
);

fifo_generator_1 Q (
  .wr_clk(clk_out1 ),                // input wire wr_clk
  .rd_clk(clk),                // input wire rd_clk
  .din(Y_Q_temp_1),                      // input wire [11 : 0] din
  .wr_en(1),                  // input wire wr_en
  .rd_en(data_valid),                  // input wire rd_en
  .dout(Y_Q)                    // output wire [11 : 0] dout
 // .full(full),                    // output wire full
  //.empty(empty),                  // output wire empty
//  .rd_data_count(rd_data_count),  // output wire [6 : 0] rd_data_count
 // .wr_data_count(wr_data_count)  // output wire [6 : 0] wr_data_count
);
endmodule
