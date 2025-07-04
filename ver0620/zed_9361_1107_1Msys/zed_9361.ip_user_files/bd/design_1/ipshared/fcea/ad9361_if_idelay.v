/********************************************************************
 Author       : Sean Hu
 Date         : 2023-05-24 11:49:30
 LastEditors  : Sean Hu
 LastEditTime : 2023-06-03 13:18:17
 FilePath     : e:\10_VSG\05_coding\ZED_AD9361_Sean_2019_2_002\ipdef\ad9361_if_idelay\ad9361_if_idelay.v
 Descripttion : 
 Copyright (c) 2023 by Sean Hu. All Rights Reserved.
********************************************************************/

`timescale 1ns / 1ps

module ad9361_if_idelay(
	//system signals 
	input	wire 			    idelay_clk_200m                     ,//200m idelay ctrl ref clock
	input	wire 			    rst_n                               ,
    output  wire 			    data_clk                            ,
    output  wire			    ap_rst_n                            ,
	//ad936x rx path signals                    
	input	wire 			    rx_clk_in_p                         ,
	input	wire 			    rx_clk_in_n                         ,
	input	wire	[ 5:0] 	    rx_data_in_p                        ,
	input	wire 	[ 5:0]	    rx_data_in_n                        ,
	input	wire 			    rx_frame_in_p                       ,
	input	wire 			    rx_frame_in_n                       ,
	//ad936x tx path signals                    
	output  wire 			    tx_clk_out_p                        ,
	output  wire 			    tx_clk_out_n                        ,
	output	wire 			    tx_frame_out_p                      ,
	output	wire 			    tx_frame_out_n                      ,
	output	wire 	[ 5:0]	    tx_data_out_p                       ,
	output	wire 	[ 5:0]	    tx_data_out_n                       ,
	// adc sample iq                        
	output	reg 			    adc_valid                           ,
	output	reg 	[11:0]	    adc_data_i1                         ,
	output	reg 	[11:0]	    adc_data_q1                         ,
	output	reg 	[11:0]	    adc_data_i2                         ,
	output	reg 	[11:0]	    adc_data_q2                         ,
	output 	reg 			    adc_status                          ,
	// dac sample iq                        
	input 	wire 			    dac_valid                           ,
	input 	wire 	[11:0]	    dac_data_i1                         ,
	input 	wire 	[11:0]	    dac_data_q1                         ,
	input 	wire 	[11:0]	    dac_data_i2                         ,
	input 	wire 	[11:0]	    dac_data_q2                         ,
	//var load idelay signals                   
	input	wire	[ 6:0]	    idly_en                             , //6 data + 1 frame
	input	wire 	[ 4:0]	    idly_d                              ,
	input	wire 			    data_clk_ce                         ,
	input 	wire 			    adc_mode_r1                         , //==1 is r1 mode;  == 2 is r2 mode
	input 	wire 			    dac_mode_r1                 
    );

/////////////////////////////////////////////////////////////////////

wire                data_clk_ibuf                                   ;
wire                rx_frame_ibuf                                   ;
wire                rx_frame_idelay                                 ;
wire                rx_frame_iddr_p                                 ;
wire                rx_frame_iddr_n                                 ;
wire    [ 5:0]      rx_data_ibuf                                    ;
wire    [ 5:0]      rx_data_idelay                                  ;
wire    [ 5:0]      rx_data_iddr_p                                  ;
wire    [ 5:0]      rx_data_iddr_n                                  ;
reg     [ 3:0]	    rx_frame_shift                                  ;//{}
reg     		    rx_valid_r1             =   0                   ;//1r1t mode data valid
reg     		    rx_error_r1             =   0                   ;// frame error
reg     [23:0]	    rx_data_shift                                   ;
reg     [11:0]	    rx_data_i_r1            =   0                   ; // 1r1t mode data i 
reg     [11:0]	    rx_data_q_r1            =   0                   ; // data q
reg     		    rx_valid_r2             =   0                   ;
reg     		    rx_error_r2             =   0                   ;
reg     [11:0]	    rx_data_i1_r2           =   0                   ;
reg     [11:0]	    rx_data_q1_r2           =   0                   ;
reg     [11:0]	    rx_data_i2_r2           =   0                   ;
reg     [11:0]	    rx_data_q2_r2           =   0                   ;
                
reg     		    tx_data_cnt_flag        =   0                   ;
reg     [ 1:0]	    tx_data_cnt             =   0                   ;
reg     [11:0]	    tx_data_i1_d            =   0                   ;
reg     [11:0]	    tx_data_q1_d            =   0                   ;
reg     [11:0]	    tx_data_i2_d            =   0                   ;
reg     [11:0]	    tx_data_q2_d            =   0                   ;
reg     [ 5:0]	    tx_data_p                                       ;
reg     [ 5:0]	    tx_data_n                                       ;
reg     		    tx_frame                                        ;
wire    [ 3:0]	    tx_data_sel                                     ;
                    
wire 			    tx_clk                                          ;
wire 			    tx_frame_out                                    ;
wire 	[ 5:0]	    tx_data_out                                     ;

reg 	[ 5:0]	    rx_data_iddr_n_dly                              ;
reg 			    rx_frame_iddr_n_dly                             ;
                    
reg 	[15:0]      ap_rst_n_r                                      ;

/////////////////////////////////////////////////////////////////////

always @(posedge data_clk) begin
    ap_rst_n_r <= {ap_rst_n_r[14:0], rst_n} ;
end

assign ap_rst_n = ap_rst_n_r[15] ;

/////////////////////////////////////////////////////////////////////

//rx rx_clk
   IBUFDS #(
      .DIFF_TERM("FALSE"),       // Differential Termination
      .IBUF_LOW_PWR("TRUE"),     // Low power="TRUE", Highest performance="FALSE" 
      .IOSTANDARD("DEFAULT")     // Specify the input I/O standard
   ) IBUFDS_data_clk_inst (
      .O(data_clk_ibuf),  // Buffer output
      .I(rx_clk_in_p),  // Diff_p buffer input (connect directly to top-level port)
      .IB(rx_clk_in_n) // Diff_n buffer input (connect directly to top-level port)
   );

      BUFGCE BUFGCE_data_clk_inst (
      .O(data_clk),   // 1-bit output: Clock output
      .CE(data_clk_ce), // 1-bit input: Clock enable input for I0
      .I(data_clk_ibuf)    // 1-bit input: Primary clock
   );

//rx rx_frame ->ibufds->idelay->iddr
   IBUFDS #(
      .DIFF_TERM("FALSE"),       // Differential Termination
      .IBUF_LOW_PWR("TRUE"),     // Low power="TRUE", Highest performance="FALSE" 
      .IOSTANDARD("DEFAULT")     // Specify the input I/O standard
   ) IBUFDS_rx_frame_inst (
      .O(rx_frame_ibuf),  // Buffer output
      .I(rx_frame_in_p),  // Diff_p buffer input (connect directly to top-level port)
      .IB(rx_frame_in_n) // Diff_n buffer input (connect directly to top-level port)
   );

IDELAYCTRL IDELAYCTRL_inst (
      .RDY(RDY),       // 1-bit output: Ready output
      .REFCLK(idelay_clk_200m), // 1-bit input: Reference clock input
      .RST(~rst_n)        // 1-bit input: Active high reset input
   );

   IDELAYE2 #(
      .CINVCTRL_SEL("FALSE"),          // Enable dynamic clock inversion (FALSE, TRUE)
      .DELAY_SRC("IDATAIN"),           // Delay input (IDATAIN, DATAIN)
      .HIGH_PERFORMANCE_MODE("FALSE"), // Reduced jitter ("TRUE"), Reduced power ("FALSE")
      .IDELAY_TYPE("VAR_LOAD"),           // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
      .IDELAY_VALUE(0),                // Input delay tap setting (0-31)
      .PIPE_SEL("FALSE"),              // Select pipelined mode, FALSE, TRUE
      .REFCLK_FREQUENCY(200.0),        // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
      .SIGNAL_PATTERN("DATA")          // DATA, CLOCK input signal
   )
   IDELAYE2_rx_frame_inst (
      .CNTVALUEOUT(), // 5-bit output: Counter value output
      .DATAOUT(rx_frame_idelay),         // 1-bit output: Delayed data output
      .C(idelay_clk_200m),                     // 1-bit input: Clock input
      .CE(1'b0),                   // 1-bit input: Active high enable increment/decrement input
      .CINVCTRL(),       // 1-bit input: Dynamic clock inversion input
      .CNTVALUEIN(idly_d),   // 5-bit input: Counter value input
      .DATAIN(),           // 1-bit input: Internal delay data input
      .IDATAIN(rx_frame_ibuf),         // 1-bit input: Data input from the I/O
      .INC(1'b0),                 // 1-bit input: Increment / Decrement tap delay input
      .LD(idly_en[6]),                   // 1-bit input: Load IDELAY_VALUE input
      .LDPIPEEN(),       // 1-bit input: Enable PIPELINE register to load data input
      .REGRST(1'b0)            // 1-bit input: Active-high reset tap-delay input
   );

      IDDR #(
      .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"), // "OPPOSITE_EDGE", "SAME_EDGE" 
                                      //    or "SAME_EDGE_PIPELINED" 
      .INIT_Q1(1'b0), // Initial value of Q1: 1'b0 or 1'b1
      .INIT_Q2(1'b0), // Initial value of Q2: 1'b0 or 1'b1
      .SRTYPE("SYNC") // Set/Reset type: "SYNC" or "ASYNC" 
   ) IDDR_rx_frame_inst (
      .Q1(rx_frame_iddr_p), // 1-bit output for positive edge of clock
      .Q2(rx_frame_iddr_n), // 1-bit output for negative edge of clock
      .C(data_clk),   // 1-bit clock input
      .CE(1'b1), // 1-bit clock enable input
      .D(rx_frame_idelay),   // 1-bit DDR data input
      .R(1'b0),   // 1-bit reset
      .S(1'b0)    // 1-bit set
   );
//end rx rx_frame

//rx data in  ->ibufds->idelay->iddr
genvar i;
generate
	for(i=0;i<6;i=i+1)begin
	   IBUFDS #(
	      .DIFF_TERM("FALSE"),       // Differential Termination
	      .IBUF_LOW_PWR("TRUE"),     // Low power="TRUE", Highest performance="FALSE" 
	      .IOSTANDARD("DEFAULT")     // Specify the input I/O standard
	   ) IBUFDS_rx_data_inst (
	      .O(rx_data_ibuf[i]),  // Buffer output
	      .I(rx_data_in_p[i]),  // Diff_p buffer input (connect directly to top-level port)
	      .IB(rx_data_in_n[i]) // Diff_n buffer input (connect directly to top-level port)
	   );

	   IDELAYE2 #(
	      .CINVCTRL_SEL("FALSE"),          // Enable dynamic clock inversion (FALSE, TRUE)
	      .DELAY_SRC("IDATAIN"),           // Delay input (IDATAIN, DATAIN)
	      .HIGH_PERFORMANCE_MODE("FALSE"), // Reduced jitter ("TRUE"), Reduced power ("FALSE")
	      .IDELAY_TYPE("VAR_LOAD"),           // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
	      .IDELAY_VALUE(0),                // Input delay tap setting (0-31)
	      .PIPE_SEL("FALSE"),              // Select pipelined mode, FALSE, TRUE
	      .REFCLK_FREQUENCY(200.0),        // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
	      .SIGNAL_PATTERN("DATA")          // DATA, CLOCK input signal
	   )
	   IDELAYE2_rx_frame_inst (
	      .CNTVALUEOUT(), // 5-bit output: Counter value output
	      .DATAOUT(rx_data_idelay[i]),         // 1-bit output: Delayed data output
	      .C(idelay_clk_200m),                     // 1-bit input: Clock input
	      .CE(1'b0),                   // 1-bit input: Active high enable increment/decrement input
	      .CINVCTRL(),       // 1-bit input: Dynamic clock inversion input
	      .CNTVALUEIN(idly_d),   // 5-bit input: Counter value input
	      .DATAIN(),           // 1-bit input: Internal delay data input
	      .IDATAIN(rx_data_ibuf[i]),         // 1-bit input: Data input from the I/O
	      .INC(1'b0),                 // 1-bit input: Increment / Decrement tap delay input
	      .LD(idly_en[i]),                   // 1-bit input: Load IDELAY_VALUE input
	      .LDPIPEEN(),       // 1-bit input: Enable PIPELINE register to load data input
	      .REGRST(1'b0)            // 1-bit input: Active-high reset tap-delay input
	   );


	    IDDR #(
	      .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"), // "OPPOSITE_EDGE", "SAME_EDGE" 
	                                      //    or "SAME_EDGE_PIPELINED" 
	      .INIT_Q1(1'b0), // Initial value of Q1: 1'b0 or 1'b1
	      .INIT_Q2(1'b0), // Initial value of Q2: 1'b0 or 1'b1
	      .SRTYPE("SYNC") // Set/Reset type: "SYNC" or "ASYNC" 
	   ) IDDR_rx_frame_inst (
	      .Q1(rx_data_iddr_p[i]), // 1-bit output for positive edge of clock
	      .Q2(rx_data_iddr_n[i]), // 1-bit output for negative edge of clock
	      .C(data_clk),   // 1-bit clock input
	      .CE(1'b1), // 1-bit clock enable input
	      .D(rx_data_idelay[i]),   // 1-bit DDR data input
	      .R(1'b0),   // 1-bit reset
	      .S(1'b0)    // 1-bit set
	   );
	end

endgenerate
//end rx data in

/////////////////////////////////////////////////////////////////////

//rx valid 1r1t

always @(posedge data_clk) begin
	rx_frame_iddr_n_dly <= rx_frame_iddr_n;
	rx_data_iddr_n_dly <= rx_data_iddr_n;
end

always @(posedge data_clk) begin
    rx_frame_shift <= {rx_frame_shift[1:0], rx_frame_iddr_p, rx_frame_iddr_n_dly} ;
end

always @(posedge data_clk) begin
    if(rx_frame_shift == 4'b1100) begin
        rx_valid_r1 <= 1'b1 ;
    end
    else begin
        rx_valid_r1 <= 1'b0 ;
    end
end

always @(posedge data_clk) begin
    rx_error_r1 <= (rx_frame_shift==4'b1100 || rx_frame_shift == 4'b0011) ? 1'b0 : 1'b1 ;
end

//rx data 1r1t
always @(posedge data_clk) begin
    rx_data_shift <= {rx_data_shift[11:0], rx_data_iddr_p, rx_data_iddr_n_dly} ;
end

always @(posedge data_clk) begin
    if(rx_frame_shift==4'b1100) begin
        rx_data_i_r1 <= {rx_data_shift[23:18], rx_data_shift[11:6]} ;
        rx_data_q_r1 <= {rx_data_shift[17:12], rx_data_shift[5:0]} ;
    end
end

//rx valid 2r2t 
always @(posedge data_clk) begin
    if(rx_frame_shift==4'b0000) begin
        rx_valid_r2 <= 1'b1 ;
    end
    else begin
        rx_valid_r2 <= 1'b0 ;
    end
end

always @(posedge data_clk ) begin
    rx_error_r2 <= (rx_frame_shift == 4'b0011 || rx_frame_shift ==4'b1111 || rx_frame_shift == 4'b1100 || rx_frame_shift == 4'b0000)?1'b0:1'b1;
end

//rx data 2r2t 
always @(posedge data_clk) begin
    if(rx_frame_shift == 4'b1111) begin
        rx_data_i1_r2 <= {rx_data_shift[23:18], rx_data_shift[11:6]} ;
        rx_data_q1_r2 <= {rx_data_shift[17:12], rx_data_shift[5:0]} ;
    end
end

always @(posedge data_clk) begin
    if(rx_frame_shift == 4'b0000) begin
        rx_data_i2_r2 <= {rx_data_shift[23:18], rx_data_shift[11:6]} ;
        rx_data_q2_r2 <= {rx_data_shift[17:12], rx_data_shift[5:0]} ;
    end
end
//r1 r2 mux

always @(posedge data_clk) begin
    if(adc_mode_r1 == 1'b1) begin
        adc_valid   <= rx_valid_r1 ;
        adc_status  <= rx_error_r1 ;
        adc_data_i1 <= rx_data_i_r1 ;
        adc_data_q1 <= rx_data_q_r1 ;
        adc_data_i2 <= 'd0 ;
        adc_data_q2 <= 'd0 ;
    end
    else begin
        adc_valid   <= rx_valid_r2 ;
        adc_status  <= rx_error_r2 ;
        adc_data_i1 <= rx_data_i1_r2 ;
        adc_data_q1 <= rx_data_q1_r2 ;
        adc_data_i2 <= rx_data_i2_r2 ;
        adc_data_q2 <= rx_data_q2_r2 ;
    end
end

//dac code 
//1r1t mode 2r2t mode
always @(posedge data_clk ) begin
    if(dac_valid == 1'b0 && tx_data_cnt_flag == 1'b1 && tx_data_cnt == 2'b1 && dac_mode_r1 == 1'b1)begin
        tx_data_cnt_flag <= 1'b0 ;
    end
    else if(dac_valid == 1'b0 && tx_data_cnt_flag == 1'b1 && tx_data_cnt == 2'd3 && dac_mode_r1 == 1'b0)begin
        tx_data_cnt_flag <= 1'b0 ;
    end
    else if(dac_valid == 1'b1) begin
        tx_data_cnt_flag <= 1'b1 ;
    end
end

always @(posedge data_clk ) begin
    if(tx_data_cnt_flag == 1'b1 && tx_data_cnt == 2'b1 && dac_mode_r1 == 1'b1) begin //1r1t clear 
        tx_data_cnt <= 'd0 ;
    end
    else if(tx_data_cnt_flag == 1'b1 && tx_data_cnt == 2'd3 && dac_mode_r1 == 1'b0)begin //2r2t clear
        tx_data_cnt <= 'd0 ;
    end
    else if(tx_data_cnt_flag == 1'b1 ) begin
        tx_data_cnt <= tx_data_cnt + 1'b1 ;
    end
end

always @(posedge data_clk) begin
    if(dac_valid == 1'b1 ) begin
        tx_data_i1_d <= dac_data_i1 ;
        tx_data_q1_d <= dac_data_q1 ;
        tx_data_i2_d <= dac_data_i2 ;
        tx_data_q2_d <= dac_data_q2 ;
    end
end

assign tx_data_sel = {dac_mode_r1, tx_data_cnt_flag, tx_data_cnt} ;

always @(posedge data_clk) begin
    case(tx_data_sel) 
    4'b1100: begin //1r1t
        tx_frame <= 1'b1 ;
        tx_data_p <= tx_data_i1_d[11:6] ;
        tx_data_n <= tx_data_q1_d[11:6] ;
    end
    4'b1101: begin//1r1t
        tx_frame <= 1'b0 ;
        tx_data_p <= tx_data_i1_d[5:0] ;
        tx_data_n <= tx_data_q1_d[5:0] ;
    end
    4'b0100:begin//2r2t
        tx_frame <= 1'b1 ;
        tx_data_p <= tx_data_i1_d[11:6] ;
        tx_data_n <= tx_data_q1_d[11:6] ;
    end
    4'b0101:begin//2r2t
        tx_frame <= 1'b1 ;
        tx_data_p <= tx_data_i1_d[5:0] ;
        tx_data_n <= tx_data_q1_d[5:0] ;
    end
    4'b0110:begin//2r2t
        tx_frame <= 1'b0 ;
        tx_data_p <= tx_data_i2_d[11:6] ;
        tx_data_n <= tx_data_q2_d[11:6] ;
    end
    4'b0111:begin//2r2t
        tx_frame <= 1'b0 ;
        tx_data_p <= tx_data_i2_d[5:0] ;
        tx_data_n <= tx_data_q2_d[5:0] ;
    end
    default : begin
        tx_frame <= 1'b0 ;
        tx_data_p <= 0 ;
        tx_data_n <= 0 ;		
    end
    endcase
end

/////////////////////////////////////////////////////////////////////

//oddr

   ODDR #(
      .DDR_CLK_EDGE("SAME_EDGE"), // "OPPOSITE_EDGE" or "SAME_EDGE" 
      .INIT(1'b0),    // Initial value of Q: 1'b0 or 1'b1
      .SRTYPE("SYNC") // Set/Reset type: "SYNC" or "ASYNC" 
   ) ODDR_frame_inst (
      .Q(tx_frame_out),   // 1-bit DDR output
      .C(data_clk),   // 1-bit clock input
      .CE(1'b1), // 1-bit clock enable input
      .D1(tx_frame), // 1-bit data input (positive edge)
      .D2(tx_frame), // 1-bit data input (negative edge)
      .R(1'b0),   // 1-bit reset
      .S(1'b0)    // 1-bit set
   );
   OBUFDS #(
      .IOSTANDARD("DEFAULT"), // Specify the output I/O standard
      .SLEW("SLOW")           // Specify the output slew rate
   ) OBUFDS_frame_inst (
      .O(tx_frame_out_p),     // Diff_p output (connect directly to top-level port)
      .OB(tx_frame_out_n),   // Diff_n output (connect directly to top-level port)
      .I(tx_frame_out)      // Buffer input
   );
generate
	for(i=0;i<6;i=i+1) begin
	   ODDR #(
	      .DDR_CLK_EDGE("SAME_EDGE"), // "OPPOSITE_EDGE" or "SAME_EDGE" 
	      .INIT(1'b0),    // Initial value of Q: 1'b0 or 1'b1
	      .SRTYPE("SYNC") // Set/Reset type: "SYNC" or "ASYNC" 
	   ) ODDR_tx_data_inst (
	      .Q(tx_data_out[i]),   // 1-bit DDR output
	      .C(data_clk),   // 1-bit clock input
	      .CE(1'b1), // 1-bit clock enable input
	      .D1(tx_data_p[i]), // 1-bit data input (positive edge)
	      .D2(tx_data_n[i]), // 1-bit data input (negative edge)
	      .R(1'b0),   // 1-bit reset
	      .S(1'b0)    // 1-bit set
	   );
	   OBUFDS #(
	      .IOSTANDARD("DEFAULT"), // Specify the output I/O standard
	      .SLEW("SLOW")           // Specify the output slew rate
	   ) OBUFDS_tx_data_inst (
	      .O(tx_data_out_p[i]),     // Diff_p output (connect directly to top-level port)
	      .OB(tx_data_out_n[i]),   // Diff_n output (connect directly to top-level port)
	      .I(tx_data_out[i])      // Buffer input
	   );		
	end
endgenerate

   ODDR #(
      .DDR_CLK_EDGE("SAME_EDGE"), // "OPPOSITE_EDGE" or "SAME_EDGE" 
      .INIT(1'b0),    // Initial value of Q: 1'b0 or 1'b1
      .SRTYPE("SYNC") // Set/Reset type: "SYNC" or "ASYNC" 
   ) ODDR_data_clk_inst (
      .Q(tx_clk),   // 1-bit DDR output
      .C(data_clk),   // 1-bit clock input
      .CE(1'b1), // 1-bit clock enable input
      .D1(1'b0), // 1-bit data input (positive edge)
      .D2(1'b1), // 1-bit data input (negative edge)
      .R(1'b0),   // 1-bit reset
      .S(1'b0)    // 1-bit set
   );
   OBUFDS #(
      .IOSTANDARD("DEFAULT"), // Specify the output I/O standard
      .SLEW("SLOW")           // Specify the output slew rate
   ) OBUFDS_data_clk_inst (
      .O(tx_clk_out_p),     // Diff_p output (connect directly to top-level port)
      .OB(tx_clk_out_n),   // Diff_n output (connect directly to top-level port)
      .I(tx_clk)      // Buffer input
   );

    
endmodule
