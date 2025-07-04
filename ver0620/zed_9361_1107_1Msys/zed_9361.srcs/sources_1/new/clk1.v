`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/20 11:43:03
// Design Name: 
// Module Name: clk1
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

module clk1(
input clk,
input rst,
output reg clk1
    );
    
        //…Ëº∆clk1
    reg [1:0]count1;
    always@(posedge clk or negedge rst)begin
        if(rst)begin
         count1<=2'b0;
         clk1<=1'b0;
        end
        else if(count1==2'b01)begin
        count1<=2'b0;
        clk1<=~clk1;
        end
        else
        count1<=count1+2'b01;
    end
endmodule
