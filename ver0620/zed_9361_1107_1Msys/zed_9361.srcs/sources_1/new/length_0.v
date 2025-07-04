`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 10:18:49
// Design Name: 
// Module Name: length_0
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


module length_0(
input rst,
input clk,
input  [17:0]yi,
input  [17:0]yq,
output reg [35:0]reg_l_iq,
output  reg l_valid
    );
    wire [36:0]l;
reg valid_legnth;
wire [35:0] s_i,s_q;  
wire [36:0] add_mod;
reg [36:0] max_mod;
reg [36:0]max;
reg [9:0]count;
wire [35:0]iq;
wire full,empty;
reg w_en,r_en;
assign add_mod=s_i+s_q;
assign iq={yi,yq};
//assign max_mod=(add_mod>max_mod)?add_mod:max_mod;

//count ����
always@(posedge clk or posedge rst)begin
    if(rst)begin
    count<=10'd0;
    end
    else if(count==10'd799)begin
    count<=10'd0;
    end
    else begin
    count<=count+10'd1;
    end
end

always@(posedge clk or posedge rst)begin
    if(rst)begin
        max_mod<=37'd0;
        max<=37'd0;
        valid_legnth<=1'd0;
        r_en<=1'd0;
    end
    else if(count==10'd798)begin
        r_en<=1'b1;
    end
    else if(count==10'd799)begin
        max<=max_mod;
         valid_legnth<=1'd1;
         max_mod<=37'd0;
    end
    else if(add_mod>max_mod)begin
        max_mod<=add_mod;
    end
    else begin
          valid_legnth<=1'd0;
    end   
end

//������ĸ�����һ���ĵ�ĳ��ȣ�ԭ�㳤Ϊmax��0.56����ȡ0.75=0.5+0.25
assign l={max[36],max[36:1]}+{{2{max[36]}},max[36:2]};

//fifo

reg [2:0]count1;
wire [35:0]iq_f1;
wire [17:0] f_i,f_q;//f_��ʾ��fifo�г�����һ������һ�����
wire [35:0] ss_i,ss_q;
assign f_i=iq_f1[35:18];
assign f_q=iq_f1[17:0];
wire [36:0]f_l;//fifo���������ݵ�ģ��ƽ��
assign f_l=ss_i+ss_q;
//

reg [17:0]reg_i,reg_q;
//��fifo�����������ӳ�һ������
always @(posedge clk or posedge rst)begin
    if(rst)begin
        reg_i<=18'd0;
        reg_q<=18'd0;
    end
    else begin
        reg_i<=f_i;
        reg_q<=f_q;
    end
end
//��f_l��l���Ƚϣ��Ѵ��ڵ�l�����Ӧ��f_i,f_q������Ĵη�ģ��
always @(posedge clk or posedge rst)begin
    if(rst)begin
    reg_l_iq<=36'd0;
    l_valid<=1'd0;
    end
    else if(f_l>l)begin
    reg_l_iq<={reg_i,reg_q};
    l_valid<=1'd1;     //��ʾ����������Ĵη�
    end
    else begin
    l_valid<=1'd0;
    end
end

// always @(posedge clk1 or posedge rst)begin
// if(rst)begin
// count1<=3'b0;
// w_en<=1'b0;
// r_en<=1'b0;
// end
// else if(count1==3'b011)begin
// count1<=3'b0;
// w_en<=1'b1;
// end
// else if(valid_legnth)begin
// r_en<=1'b1;
// end
// else begin
// count1<=count1+1'b1;
//  w_en<=1'b0;
// end
// end   
 
 
mult_18x18 l0 (
  .CLK(clk),  // input wire CLK
  .A(yi),      // input wire [17 : 0] A
  .B(yi),      // input wire [17 : 0] B
  .P(s_i)      // output wire [35 : 0] P
);
    

mult_18x18 l1 (
  .CLK(clk),  // input wire CLK
  .A(yq),      // input wire [17 : 0] A
  .B(yq),      // input wire [17 : 0] B
  .P(s_q)      // output wire [35 : 0] P
);
    
// fifo_36x512 l2 (
//  .clk(clk1),      // input wire clk
//  .srst(rst),    // input wire srst
//  .din(iq),      // input wire [35 : 0] din
//  .wr_en(w_en),  // input wire wr_en
//  .rd_en(r_en),  // input wire rd_en
//  .dout(iq_f1),    // output wire [35 : 0] dout
//  .full(full),    // output wire full
//  .empty(empty)  // output wire empty
//);   

fifo_36x1024 l2 (
  .clk(clk),      // input wire clk
  .srst(rst),    // input wire srst
  .din(iq),      // input wire [35 : 0] din
  .wr_en(1'b1),  // input wire wr_en
  .rd_en(r_en),  // input wire rd_en
  .dout(iq_f1),    // output wire [35 : 0] dout
  .full(full),    // output wire full
  .empty(empty)  // output wire empty
);
 //��fifo����������ģ��ƽ��   
  mult_18x18 l3 (
  .CLK(clk),  // input wire CLK
  .A(f_i),      // input wire [17 : 0] A
  .B(f_i),      // input wire [17 : 0] B
  .P(ss_i)      // output wire [35 : 0] P
);  
 
   mult_18x18 l4 (
  .CLK(clk),  // input wire CLK
  .A(f_q),      // input wire [17 : 0] A
  .B(f_q),      // input wire [17 : 0] B
  .P(ss_q)      // output wire [35 : 0] P
);  


endmodule
