`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/09 17:15:00
// Design Name: 
// Module Name: prbs23
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


module prbs23(
 input clk,
  input rst_n,
  input prbs_en,
  output  out
    );
    reg [22:0] shift_reg;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        shift_reg <= 23'b1;
      end
      else if(prbs_en ==1)
        shift_reg <= {shift_reg[21:0], shift_reg[22] ^ shift_reg[17]};   

  end


assign out = shift_reg[22]; 

endmodule
