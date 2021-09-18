`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2021 01:27:27 PM
// Design Name: 
// Module Name: stimrec
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

module stimrec(
input wire [15:0] DATA_IN,
input wire ARR_SEL,
input wire CLK,
output reg RST_OUT,
output wire CLK_OUT,
output reg DATA_OUT
);

//wire [15:0] DATA_IN;
//	assign DATA_IN = slv_reg0 [15:0];
	
	reg [3:0] counter = 0;
	reg [4:0]MAX = 0;
	
//	wire ARR_SEL;
//	assign ARR_SEL = slv_reg1[0];
	
	assign CLK_OUT = CLK;
	
    always @(posedge CLK)
    begin
        if(counter == MAX)
        begin
            counter <= 4'd0;
            RST_OUT <= 0;
        end
        else
        begin
            counter <= counter + 4'd1;
            RST_OUT <= 1;
        end
    end
    
    
    wire [15:0] PREV_OUT;
    reg SEL;
        
    always @(*)
    begin
        if(ARR_SEL == 1)
        begin
            DATA_OUT <= PREV_OUT[15];
            MAX <= 5'd16;
        end
        if(ARR_SEL == 0)
        begin
            DATA_OUT <= PREV_OUT[6];
            MAX <= 5'd7;
        end
        if (counter == 4'd0)
            SEL <= 0;
        else
            SEL <= 1;
    end
    
    
    
    PSI ins0(.CLK(CLK), .RST(RST), .DATA_IN(DATA_IN[0]),.PREV_OUT(0),.DATA_OUT(PREV_OUT[0]), .SEL(SEL));
	PSI ins1(.CLK(CLK),.RST(RST),.DATA_IN(DATA_IN[1]),.PREV_OUT(PREV_OUT[0]),.DATA_OUT(PREV_OUT[1]), .SEL(SEL));
	PSI ins2(.CLK(CLK),.RST(RST),.DATA_IN(DATA_IN[2]),.PREV_OUT(PREV_OUT[1]),.DATA_OUT(PREV_OUT[2]), .SEL(SEL));
	PSI ins3(.CLK(CLK),.RST(RST),.DATA_IN(DATA_IN[3]),.PREV_OUT(PREV_OUT[2]),.DATA_OUT(PREV_OUT[3]), .SEL(SEL));
	PSI ins4(.CLK(CLK),.RST(RST),.DATA_IN(DATA_IN[4]),.PREV_OUT(PREV_OUT[3]),.DATA_OUT(PREV_OUT[4]), .SEL(SEL));
	PSI ins5(.CLK(CLK),.RST(RST),.DATA_IN(DATA_IN[5]),.PREV_OUT(PREV_OUT[4]),.DATA_OUT(PREV_OUT[5]), .SEL(SEL));
	PSI ins6(.CLK(CLK),.RST(RST),.DATA_IN(DATA_IN[6]),.PREV_OUT(PREV_OUT[5]),.DATA_OUT(PREV_OUT[6]), .SEL(SEL));
	PSI ins7(.CLK(CLK),.RST(RST),.DATA_IN(DATA_IN[7]),.PREV_OUT(PREV_OUT[6]),.DATA_OUT(PREV_OUT[7]), .SEL(SEL));
	PSI ins8(.CLK(CLK),.RST(RST),.DATA_IN(DATA_IN[8]),.PREV_OUT(PREV_OUT[7]),.DATA_OUT(PREV_OUT[8]), .SEL(SEL));
	PSI ins9(.CLK(CLK),.RST(RST),.DATA_IN(DATA_IN[9]),.PREV_OUT(PREV_OUT[8]),.DATA_OUT(PREV_OUT[9]), .SEL(SEL));
	PSI ins10(.CLK(CLK),.RST(RST),.DATA_IN(DATA_IN[10]),.PREV_OUT(PREV_OUT[9]),.DATA_OUT(PREV_OUT[10]), .SEL(SEL));
	PSI ins11(.CLK(CLK),.RST(RST),.DATA_IN(DATA_IN[11]),.PREV_OUT(PREV_OUT[10]),.DATA_OUT(PREV_OUT[11]), .SEL(SEL));
	PSI ins12(.CLK(CLK),.RST(RST),.DATA_IN(DATA_IN[12]),.PREV_OUT(PREV_OUT[11]),.DATA_OUT(PREV_OUT[12]), .SEL(SEL));
	PSI ins13(.CLK(CLK),.RST(RST),.DATA_IN(DATA_IN[13]),.PREV_OUT(PREV_OUT[12]),.DATA_OUT(PREV_OUT[13]), .SEL(SEL));
	PSI ins14(.CLK(CLK),.RST(RST),.DATA_IN(DATA_IN[14]),.PREV_OUT(PREV_OUT[13]),.DATA_OUT(PREV_OUT[14]), .SEL(SEL));
	PSI ins15(.CLK(CLK),.RST(RST),.DATA_IN(DATA_IN[15]),.PREV_OUT(PREV_OUT[14]),.DATA_OUT(PREV_OUT[15]), .SEL(SEL));
	
endmodule
    
	
	
// User logic ends
module PSI(
input wire CLK,
input wire RST,
input wire SEL,
input wire DATA_IN,
input wire PREV_OUT,
output reg DATA_OUT);

always @(posedge CLK)
begin
    if(~RST)
    begin
        DATA_OUT <= 0;
    end
    
    if(~SEL)
    begin
        DATA_OUT <= DATA_IN;
    end
    
    if(SEL)
    begin
        DATA_OUT <= PREV_OUT;
    end
end

endmodule
