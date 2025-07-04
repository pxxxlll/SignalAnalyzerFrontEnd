`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/14 13:01:59
// Design Name: 
// Module Name: sum_cordic
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


module sum_cordic(
input rst,
input clk,
input [74:0] re_result2,
input [74:0] im_result2,   
input valid2,
input l_valid,
output [84:0]re_sum,
output [84:0]im_sum,
output [15:0]div,
output div_valid
    );
    
    reg [84:0]reg_re_sum;
    reg [84:0]reg_im_sum;
    reg [74:0] reg_re_result2,reg_im_result2;
//    assign re_result2=reg_re_result2;
//    assign im_result2=reg_im_result2;
always @(posedge clk or posedge rst) begin
if(rst)begin
    reg_re_result2 <= 75'd0;
    reg_im_result2 <=75'd0;
end
else begin
    reg_re_result2 <= re_result2;
    reg_im_result2 <= im_result2;
    end
end
//    assign re_sum=reg_re_sum;
//    assign im_sum=reg_im_sum;
    reg [9:0]count;
    reg [2:0]flag;//四个求一次和
    always@(posedge clk or posedge rst )begin
    if(rst)begin
    flag<=3'd0;
    end
    else if(flag==3'b011)
    flag<=3'd0;
    else
    flag<=flag+1'd1;
    end
   
//    always@(posedge clk )begin
////    if(rst)begin
////    reg_re_sum<=85'd0;
////    reg_im_sum<=85'd0;
////    end
////    else 
//if(flag==3'b011)begin
//    reg_re_sum<=reg_re_sum+{{10{reg_re_result2[74]}},reg_re_result2};
//    reg_im_sum<=reg_im_sum+{{10{reg_im_result2[74]}},reg_im_result2};
//    end
//    end
       //把有效信号延迟22个周期
   reg [21:0]dalay_valid;
   always @(posedge clk or posedge rst ) begin
  if (rst) begin
    dalay_valid <= 22'b0;
  end
  else begin
    dalay_valid <= {dalay_valid[20:0], l_valid};
  end
  end
  
  
//    wire valid3;
//    always@(posedge clk or posedge rst )begin
//       if(rst)begin
//           count<=10'd0;
//           reg_re_sum<=85'd0;
//           reg_im_sum<=85'd0;
//       end 
//     else if(count==10'd799)begin
//     count<=10'd0;
//    reg_re_sum<=85'd0;
//    reg_im_sum<=85'd0;
//     end
//     else if(flag==3'b011)begin
//    reg_re_sum<=reg_re_sum+{{10{reg_re_result2[74]}},reg_re_result2};
//    reg_im_sum<=reg_im_sum+{{10{reg_im_result2[74]}},reg_im_result2};
//    end
//     else
//         count<=count+10'd1;
//     end
    always@(posedge clk or posedge rst )begin
    if(rst)begin
    reg_re_sum<=85'd0;
    reg_im_sum<=85'd0;
    end
    else if(count==10'd799)begin
        reg_re_sum<=85'd0;
    reg_im_sum<=85'd0;
    end
    else if(valid2)begin
        if(dalay_valid[21])begin
            if(flag==3'b011)begin
            reg_re_sum<=reg_re_sum+{{10{reg_re_result2[74]}},reg_re_result2};
            reg_im_sum<=reg_im_sum+{{10{reg_im_result2[74]}},reg_im_result2};
            end
        end
    end
    end
   reg [16:0]counting;
     always@(posedge clk or posedge rst )begin
       if(rst)begin
           counting<=10'd0;
       end 
       else if(counting==16'd821)begin
            counting<=counting;
       end 
       else begin
            counting<=counting+16'd1;
       end
     end
    reg valid3;
    always@(posedge clk or posedge rst )begin
       if(rst)begin
           count<=10'd0;
       end 
       else if(counting==16'd820)begin
            count<=10'd0;
       end
     else if(count==10'd799)begin
     count<=10'd0;
     end
     else
         count<=count+10'd1;
     end     
     
     
          always@(posedge clk or posedge rst )begin
     if(rst)begin
           valid3<=1'd0;
       end 
     else if(valid2)begin
        if(count==10'd798)begin
        valid3<=1'd1;
        end
        else begin
        valid3<=1'd0;
        end
     end
     end
     
     //valid3有效时把数据给输出的wire,输出取相反数
// assign valid3=(count==10'd799)?1:0;
 assign re_sum=(valid3==1)?(~reg_re_sum+1'b1):0;
 assign im_sum=(valid3==1)?(~reg_im_sum+1'b1):0;
    
    //由valid2信号控制输入有效，valid2信号又受控于前面乘法器的输入有效
    wire [95 : 0]inputsum;
    wire [15 : 0] outputphase;
    wire cordic_valid;
    assign inputsum=(valid3==1)?{im_sum[70:23],re_sum[70:23]}:0;
    cordic_0 s1 (
  .aclk(clk),                                        // input wire aclk
  .s_axis_cartesian_tvalid(valid3),  // input wire s_axis_cartesian_tvalid
  .s_axis_cartesian_tdata(inputsum),    // input wire [95 : 0] s_axis_cartesian_tdata
  .m_axis_dout_tvalid(cordic_valid),            // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(outputphase)              // output wire [47 : 0] m_axis_dout_tdata
);

  //除以4
  wire [23:0]div_first;
  assign div=div_first[23:8];
div0 s2 (
  .aclk(clk),                                      // input wire aclk
  .s_axis_divisor_tvalid(cordic_valid),    // input wire s_axis_divisor_tvalid
  .s_axis_divisor_tdata(8'd4),      // input wire [7 : 0] s_axis_divisor_tdata
  .s_axis_dividend_tvalid(cordic_valid),  // input wire s_axis_dividend_tvalid
  .s_axis_dividend_tdata(outputphase),    // input wire [15 : 0] s_axis_dividend_tdata
  .m_axis_dout_tvalid(div_valid),          // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(div_first)            // output wire [23 : 0] m_axis_dout_tdata
);
endmodule
