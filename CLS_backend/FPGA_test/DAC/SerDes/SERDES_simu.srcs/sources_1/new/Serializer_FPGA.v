`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/21 13:52:40
// Design Name: 
// Module Name: Serializer_FPGA
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

module PSI(
input wire CLK,
input wire [11:0] DATA_IN, //A value, active high sel
input wire LOAD,
input wire RST,
output wire DATA_OUT,
output wire [3:0] COUNTER,
output wire SEL_DB,
output reg SYNC,
output wire CLK_DAC
    );
    

    reg clk_dac;
    assign CLK_DAC = clk_dac;
    
    always @(*)begin
    clk_dac = ~CLK;
    end
    
    
    reg [11:0]net_in = 12'd0;
    reg BEGIN = 0;
    
    
    always @(posedge LOAD)begin
    net_in <= DATA_IN;
    BEGIN <= 1;
    end
    
    
    reg [3:0] counter;
    assign COUNTER = counter;
    
    //// SYNC output, I put it after I declared counter
    ////b because it uses counter
    
    //reg sync = 0;
    //assign SYNC = sync;
    //reg sync_begin = 0;
    
//    reg sync0;
    
    always @(posedge CLK)begin
    if(counter == 4'd11)
    //sync_begin <= 1;
        SYNC <= 1;
        //sync0 <= 1;
        
    //if(sync_begin == 1)
    //sync <= 1;
    end
    
    always @(posedge CLK)begin///////////////////////////////////////////////////////////   NEG
    if(SYNC == 1)begin
    SYNC = 0;
    //sync_begin <= 0;
    end
    end
    
    
    
    
    always @(posedge CLK) begin
    if (BEGIN == 1) begin
    if(counter == 4'd11)begin
    counter <= 4'd0;
    net_in <= 12'd0;
    BEGIN <= 0; end
    else if(RST)
    counter <= 4'd0;
    else
        counter <= counter + 4'd1;
    end
    else
    counter <= 4'b0;
    end
    
    
    wire [11:0] PREV_OUT; // B value, active low sel
    reg SEL;
    assign SEL_DB = SEL;
        
    always @(*)begin
//    if(RST)
//    net_in <= 12'd0;
    if (counter == 4'd0)
    SEL <= 0; 
//    if (counter == 4'd11)
//    SEL <= 2'd2;
    else
    SEL <= 1;
    end
    
    PSI_module ins0(.counter(counter), .clk(CLK), .data_in(net_in[0]), .prev_out(1'd0), .rst(RST), .sel(SEL), .data_out(PREV_OUT[0]));
    PSI_module ins1(.counter(counter), .clk(CLK), .data_in(net_in[1]), .prev_out(PREV_OUT[0]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[1])); 
    PSI_module ins2(.counter(counter), .clk(CLK), .data_in(net_in[2]), .prev_out(PREV_OUT[1]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[2])); 
    PSI_module ins3(.counter(counter), .clk(CLK), .data_in(net_in[3]), .prev_out(PREV_OUT[2]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[3])); 
    PSI_module ins4(.counter(counter), .clk(CLK), .data_in(net_in[4]), .prev_out(PREV_OUT[3]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[4])); 
    PSI_module ins5(.counter(counter), .clk(CLK), .data_in(net_in[5]), .prev_out(PREV_OUT[4]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[5])); 
    PSI_module ins6(.counter(counter), .clk(CLK), .data_in(net_in[6]), .prev_out(PREV_OUT[5]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[6])); 
    PSI_module ins7(.counter(counter), .clk(CLK), .data_in(net_in[7]), .prev_out(PREV_OUT[6]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[7])); 
    PSI_module ins8(.counter(counter), .clk(CLK), .data_in(net_in[8]), .prev_out(PREV_OUT[7]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[8])); 
    PSI_module ins9(.counter(counter), .clk(CLK), .data_in(net_in[9]), .prev_out(PREV_OUT[8]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[9])); 
    PSI_module ins10(.counter(counter), .clk(CLK), .data_in(net_in[10]), .prev_out(PREV_OUT[9]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[10])); 
    PSI_module ins11(.counter(counter), .clk(CLK), .data_in(net_in[11]), .prev_out(PREV_OUT[10]), .rst(RST), .sel(SEL), .data_out(DATA_OUT)); 
endmodule
    
    
module PSI_module(
input wire clk,
input wire data_in, //A value, active high sel
input wire prev_out, // B value, active low sel
//input wire load,
input wire rst,
input wire sel,
input wire counter,
output wire data_out
    );
    
    reg net_out;
    assign data_out = net_out;
   // always@(posedge load)begin
    // net_in <= data_in;
   // end
    
    always @(posedge clk)begin
    if(rst)
    net_out <= 1'b0;
    if(sel == 1)
    net_out <= prev_out;
    if(sel == 0)
    net_out <= data_in;
//    if(sel == 2'd2)
//    net_out <= 1'b0;
    end
    
 
 endmodule
 
 // 12 (3ish bits???) counter


	
//	always@(negedge clk) begin
//	if (counter == 1)
//	sel <= 0 ;
//	end
	
//	assign sclk = sel?0:S_AXI_ACLK;
	
//	always @(posedge S_AXI_ACLK) begin
//	       counter <= counter + 1'b1;
//	end
	
//	reg sync =0;
//	assign SYNC = sync;
	
//	always @(posedge S_AXI_ACLK) begin
//	   if(counter == 11)
//	       sync <= 1;
//	   else
//	       sync = 0;
//	end
	
//	reg clk_spi = 0;
//	assign CLK_SPI = clk_spi;
	
//	always @(negedge sclk)begin
//	   clk_spi <= sclk;
//	end
	
	
//	reg [0:11] data_reg, data_next;
//	reg [0:11]data_out;
//	assign DATA_OUT = data_out;

//	//already have counter up till 12
//	always @(posedge S_AXI_ACLK, posedge rst)begin
//	   if(rst)
//	       data_reg <= 0;
//	   else
//	       data_reg <= data_next;
//	 end
	 
//	 always @* begin
//	   data_next <= data_reg;
//	   data_out <= data_reg[counter];
//	 end
	 
//	always @(posedge change_data or rst)begin
//	   if(rst)
//	       data_next <= 1'b0;
//	   else
//	       data_next <= data;
//	end
	 
//	 always @(posedge sclk or rst)begin
//	   if(rst)
//	       PSI_single <= 1'b0;
//	   else if (sel == 0)
//	       PSI_single <= PSI_datain;
//	   else
//	       PSI_single <= B;
//	 end
	  
	
	// 12 (3ish bits???) counter

	//out: PSI_SYNC, DATA_OUT, PSI_CLK
	// User logic ends

