`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//����ErrorLp.v�ļ��ĳ����嵥
module ErrorLp (
	rst,clk,strobe,yik,yqk,
	yi,yq,sync,er,wk,eri,erq,count); 
	
	input		rst;    //��λ�źţ��ߵ�ƽ��Ч
	input		clk;    //ʱ���ź�/������������/4����������/4 MHz
	input		strobe; //gncoģ��������ѡͨ�ź�	
	input  signed [31:0]	yik;   //��ֵ�˲����I·����/4 MHz  32bit  29bitС��λ
	input  signed [31:0]	yqk;   //��ֵ�˲����Q·����/4 MHz	32bit  29bitС��λ
	output signed [31:0]	yi;    //��Ѳ���ʱ�̵Ĳ�ֵI·����/1 MHzλ   32bit  29bitС��λ
	output signed [31:0]	yq;    //��Ѳ���ʱ�̵Ĳ�ֵQ·����/1 MHzλ	32bit  29bitС��λ
	output signed [31:0]	er;    //��ʱ����ź�  32bit  30bitС��λ
	output signed [31:0]	wk;    //��·�˲����ź�   32bit  30bitС��λ
	output sync;                //λͬ��ʱ���źţ�����Ѳ���ʱ��ͬ��/1 MHz	
	output signed [31:0] eri,erq;
	input [1:0] count;
	
	reg signed [31:0] yik_0,yqk_0,yik_1,yqk_1,yik_2,yqk_2;
	reg signed [31:0] yit,yqt;
	reg signed [31:0] err_1;  //10bit����λ��54bitС��λ
	wire signed [31:0] err;   //10bit����λ��54bitС��λ
 	reg signed [31:0] w;
	reg sk;
	always @(posedge clk or posedge rst) begin
	    if(rst) sk <= 1'b0;
	    else if((strobe) && (count == 2'd1))
	        sk <= !sk;
	end
	
	always @(posedge clk or posedge rst)
	    if(rst) begin
	        yik_0 <= 32'd0;
            yqk_0 <= 32'd0;
            yik_1 <= 32'd0;
            yqk_1 <= 32'd0;
            yik_2 <= 32'd0;
            yqk_2 <= 32'd0;
	    end
	    else if((strobe)&&(count==2'd2)) begin
	          yik_0 <= yik;
              yqk_0 <= yqk;
              yik_1 <= yik_0;
              yqk_1 <= yqk_0;
              yik_2 <= yik_1;
              yqk_2 <= yqk_1;
        end
              
	
   always @(posedge clk or posedge rst)
      if (rst)  begin
            yit <= 32'd0;
            yqt <= 32'd0;
           // sk  <= 1'b0;
            err_1 <= 32'd0;
            //���û�·�˲�������ĳ�ʼֵΪ0.5
            w <= 32'b00100000000000000000000000000000;  //��λ����λ
         end
      else
		   begin
         //�ڼ�⵽gncoģ������������ź�strobe��ȡ����Ч��ֵ���ݽ��������
         if ((strobe)&& (count==2'd3))
			   begin

              //����sk�źţ�������Ϊ�������ڣ���Ϊλ��ʱʱ�����
             // sk <= !sk;
              //ÿ�����Ž���һ�λ�·�˲�����
				  if(sk) 
				     begin
                    //��ʱ����Ѳ�ֵ�����������ȡ���λ��ʱ����ֵ�����ڻ����źŵ�����о�����
                    yit <= yik_0;
                    yqt <= yqk_0;
                    //��·�˲���    
                    err_1 <= err;
                    //ͨ����λ���㣬����ʵ�ֳ���0.0156��С������
                    //err����Ҫ����2�ŵõ�er�����ֻ���err����5λ��ʵ�ֳ���2^(-6)��
						  w <= w+{{5{err[31]}},err[31:5]}-{{5{err_1[31]}},err_1[31:5]};
						 //w <= w+{{9{err[17]}},err[17:11]}-{{9{err_1[17]}},err_1[17:11]};
                 end                    
           end
        end

reg sync;
always @(posedge clk or posedge rst) begin
    if(rst) begin
        sync <= 1'b0;
    end
    else if((strobe)&& (count==2'd3) && (sk)) begin
        sync <= 1'b1;
    end
    else begin
        sync <= 1'b0;
    end
end
   // assign sync = sk;
	 assign wk = w;
    assign yi = yit;
	 assign yq = yqt;
	 
   /////////////////////////����Gardner�㷨���������//////////////////////////
	wire signed [32:0] Ia2_tmp,Qa2_tmp;
	wire signed [31:0] Ia2,Qa2;
	wire signed [31:0] yik1_Ia,yqk1_Qa;
	reg signed [31:0] eri,erq;
	
	wire signed [63:0] eri_tmp,erq_tmp;
	
   //����ʽ��8-29��������û�г���2��
   assign Ia2_tmp = {yik_0[31],yik_0}+{yik_2[31],yik_2};    
   assign Qa2_tmp = {yqk_0[31],yqk_0}+{yqk_2[31],yqk_2};   
   assign Ia2 = Ia2_tmp[32:1];
   assign Qa2 = Qa2_tmp[32:1];
   //����ʽ��8-28���еĳ��������м���ʱͨ����λʵ�ֳ���2������
   assign yik1_Ia = yik_1-Ia2;
   assign yqk1_Qa = yqk_1-Qa2;
   
   assign eri_tmp = (yik_1-Ia2)*(yik-yik_2);  //6bit����λ�� 58bit С��λ
   assign erq_tmp = (yqk_1-Qa2)*(yqk-yqk_2);  //6bit����λ�� 58bit С��λ
   
    
   //����ʽ��8-28��������yik��yik_2�ķ���λʵ�ֳ˷�����
   //err����3bit����λ
	always @(*)
	    eri <= eri_tmp[60:29];
			
	always @(*)
	   	erq <= erq_tmp[60:29];
    
   assign err = eri+erq;
   assign er = err;
   //ͨ����λ����ʵ��2���˷�����
  // assign er = (sk)? {err[14:0],1'b0} :16'd0;
   /////////////////////////����Gardner�㷨���������//////////////////////////

endmodule
	
