`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/30 10:18:49
// Design Name: 
// Module Name: gnco
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


//����gnco.v�ļ��ĳ����嵥
module gnco (
	rst,clk,wk,
	uk,nk,strobe,count); 
	
	input		rst;   //��λ�źţ��ߵ�ƽ��Ч
	input		clk;   //ʱ���ź�/������������/4����������/4 MHz
	input   signed [31:0] wk;     //��·�˲��������ʱ����źţ�15 bitС��λ
	output  signed [31:0] uk;     //NCO����Ĳ�ֵ���С����15 bitС��λ
	output  signed [31:0] nk;     //NCO�Ĵ���ֵ
	output  strobe;               //NCO����Ĳ�ֵ����ѡͨ�źţ��ߵ�ƽ��Ч
	input [1:0] count;
   reg signed [31:0] nkt;
	reg signed [31:0] ut;
	reg str;
   always @(posedge clk or posedge rst)
      if (rst)
		   begin
				//����nk��uk�ĳ�ֵ
				nkt <= 32'b00111000000000000000000000000000;	//0.875
				str <= 1'b0;
				ut  <= 32'b00101000000000000000000000000000;	//0.625
			end
		else if(count == 2'd0)
		   begin
			   if (nkt < wk)
				   begin
						// ��ֵ+1���൱��mod(1);
						nkt <= 32'b01000000000000000000000000000000+nkt-wk;
						str <= 1'b1;
						//ȡ��nkt��ȥwk֮ǰ��ֵ����������2��Ϊuֵ���
						//ut <= nkt;
						ut <= {nkt[30:0],1'b0}; 
					end
				else
				   begin
						nkt <= nkt-wk;
						str <= 1'b0;
					end
	        end
		
		assign nk = nkt;
	   //assign uk = {ut[14:0],1'b0};
	   //assign uk = (ut[14]==1'b1)?16'h7FFF:{ut[14:0],1'b0};
	   assign uk = ut;
	   assign strobe = str;	

endmodule
