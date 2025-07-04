`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/01 10:17:20
// Design Name: 
// Module Name: top_receive
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


module top_receive(
  input clk,
  input rst_n,
  input [11:0] data_in_I,
  input [11:0] data_in_Q,
  input data_in_valid,
  output [15:0] data_out_I,
  output [15:0] data_out_Q,
  output reg data_out_valid,   //80M时钟下对齐，5M符号率，所以每16个时钟周期读一个
  
  
  output [15:0] fir_data_I, 
  output [15:0]fir_data_Q,  
output [15:0] fifo3_data_I, 
output [15:0] fifo3_data_Q,
output    [84:0]re_sum,
output [84:0]im_sum,
output [15:0]div,
output out_valid,
output reg clk_4MHz,
output [17:0]yi,
output [17:0]yq,
     output signed [15:0] u,
      output signed [15:0] e,
       output signed [15:0] w,
       output signed [17:0] yik,
       output signed [17:0] yqk
);
    
wire clk_8MHz;
wire [11:0] fifo_data_I,fifo_data_Q;
wire [28:0] fir_data_I_tmp, fir_data_Q_tmp;    
//wire [15:0] fir_data_I, fir_data_Q;   
//wire [15:0] fifo3_data_I, fifo3_data_Q; 
 
assign fir_data_I =  fir_data_I_tmp[27:12];
assign fir_data_Q =  fir_data_Q_tmp[27:12];

assign rst = ~rst_n;
    
clk_wiz_1  u_pll
 (
  .clk_out1(clk_8MHz),   //
  //.clk_out2(clk_20MHz),
  // Status and control signals
  .reset(rst),
   .locked(),
   .clk_in1(clk)  //16MHz
 ); 
 
 
 always @(posedge clk_8MHz) begin
     clk_4MHz <= ~clk_4MHz;
 end
 
//从9361的数据接口读入数据，本地以8M时钟读出。 
fifo_generator_2 u_fifo_I
  (
    .wr_clk(clk),  //16MHz
    .rd_clk(clk_8MHz), 
    .din(data_in_I),
    .wr_en(data_in_valid),
    .rd_en(1'b1),
    .dout(fifo_data_I),
    .full(),
    .empty()
  );
  
fifo_generator_2 u_fifo_Q
  (
    .wr_clk(clk),  //16MHz
    .rd_clk(clk_8MHz),
    .din(data_in_Q),
    .wr_en(data_in_valid),
    .rd_en(1'b1),
    .dout(fifo_data_Q),
    .full(),
    .empty()
  );
 
//8M时钟下，8倍过采样，0.35 根升余弦 
fir_compiler_1 u_fir_I
 (
    .aclk(clk_8MHz),
    .s_axis_data_tvalid(1'b1),
   // .s_axis_data_tready(),
    .s_axis_data_tdata(fifo_data_I),
   // .m_axis_data_tvalid(),
    .m_axis_data_tdata(fir_data_I_tmp)
  );
    
  fir_compiler_1 u_fir_Q
 (
    .aclk(clk_8MHz),
    .s_axis_data_tvalid(1'b1),
   // .s_axis_data_tready(),
    .s_axis_data_tdata(fifo_data_Q),
   // .m_axis_data_tvalid(),
    .m_axis_data_tdata(fir_data_Q_tmp)
  );  
  
  reg wr_en;
  always @(posedge clk_8MHz) begin
      wr_en <= ~wr_en;  
  end
  
    reg [1:0] count33;
  always @(posedge clk) begin
      count33 <= count33+2'd1;  
  end
  
  wire rd_en = (count33==2'd1)?1'b1:1'b0;
 //2倍抽取，保证4倍增采样送给位同步 
 fifo_generator_3 u_fifo3_I
  (
    .wr_clk(clk_8MHz),  //80MHz
    .rd_clk(clk),
    .din(fir_data_I),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .dout(fifo3_data_I),
    .full(),
    .empty()
  );
  
   fifo_generator_3 u_fifo3_Q
  (
    .wr_clk(clk_8MHz),  //80MHz
    .rd_clk(clk),
    .din(fir_data_Q),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .dout(fifo3_data_Q),
    .full(),
    .empty()
  );
  wire [17:0] yi_out,yq_out;
 //在这里添加位同步和相偏补偿
 

 
 FpgaPhase u_phase(
  .rst(rst),
  .clk(clk),  //clk
  .di(fifo3_data_I),
  .dq(fifo3_data_Q),
  .yi_out(yi_out),
  .yq_out(yq_out),
  .y_valid(y_valid),
.re_sum(re_sum),
.im_sum(im_sum),
.div(div),
.out_valid(out_valid),
.yi(yi),
.yq(yq),
.reg_div(reg_div)
    );
    
    
    fifo_generator_4 u_fifo4_I(
    .wr_clk(clk_4MHz), //
    .rd_clk(clk), //16MHz
    .din(yi_out[17:2]),
    .wr_en(y_valid),
    .rd_en (data_out_valid),
    .dout(data_out_I),
    .full(),
    .empty()
  );
  
      fifo_generator_4 u_fifo4_Q(
    .wr_clk(clk_4MHz), //
    .rd_clk(clk), //80MHz
    .din(yq_out[17:2]),
    .wr_en(y_valid),
    .rd_en (data_out_valid),
    .dout(data_out_Q),
    .full(),
    .empty()
  );
    
    reg [3:0] count;
    always @(posedge clk) begin
        count <= count + 4'd1;    
    end
    
    always @(posedge clk) begin
        if(count == 4'd0) begin
           data_out_valid <= 1'b1;
        end
        else begin
           data_out_valid <= 1'b0;
        end
    end
    
    
endmodule
