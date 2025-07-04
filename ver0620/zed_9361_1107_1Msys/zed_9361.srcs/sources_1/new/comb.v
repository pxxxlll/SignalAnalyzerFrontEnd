`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/09 17:21:50
// Design Name: 
// Module Name: comb
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


module comb(
input clk,
    input rst_n,
    input x,
    input [2:0]count,
    input qpsk_en,
    output [1:0]x_2bit
    );
      reg [1:0]x_reg;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        x_reg <=2'b00;
    end
    else if(count == 3'b001) begin
        x_reg[1] <= x;
    end
    else if(count == 3'b101) begin
        x_reg[0] <= x;
    end

end

assign x_2bit = (qpsk_en == 1)?x_reg:0;       
endmodule
