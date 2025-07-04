`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/09 17:22:50
// Design Name: 
// Module Name: qpsk
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


module qpsk(
 clk,
 rst_n,
    x_2bit,qpsk_en,
    y_I,y_Q,y_en
    );
     input clk,rst_n;
    input [1:0]x_2bit;   
    input qpsk_en;
    output reg signed [1:0] y_I; 
    output reg signed [1:0] y_Q; 
    output y_en;
 

always @(posedge clk or negedge rst_n) 
    begin
     if (!rst_n) begin
	       y_I <= 2'b00;
           y_Q <= 2'b00;
        end
    else if(qpsk_en)
	        case(x_2bit)
              2'b00: begin  y_I <= 2'b11;
                            y_Q <= 2'b11;
                     end
              2'b01: begin  y_I <= 2'b01;
                            y_Q <= 2'b11;
                     end
              2'b10: begin  y_I <= 2'b11;
                            y_Q <= 2'b01;
                     end
              2'b11: begin  y_I <= 2'b01;
                            y_Q <= 2'b01;
                     end
            endcase
        else begin
	       y_I <= 2'b00;
           y_Q <= 2'b00;
        end
    end


assign y_en = (qpsk_en)?1:0;
endmodule
