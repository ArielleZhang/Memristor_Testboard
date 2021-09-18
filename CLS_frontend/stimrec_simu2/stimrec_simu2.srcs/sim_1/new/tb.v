`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2021 10:25:26 PM
// Design Name: 
// Module Name: tb
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


module tb;
reg [15:0] DATA_IN;
reg ARR_SEL;
reg CLK;
reg RST;
wire RST_OUT;
wire DATA_OUT;
wire CLK_OUT;

data ins0(.CLK_OUT(CLK_OUT), .DATA_IN(DATA_IN), .REF_CLK(CLK), .RST(RST), .ARR_SEL(ARR_SEL), .RST_OUT(RST_OUT), .DATA_OUT(DATA_OUT));

initial
begin
    CLK = 0;
    ARR_SEL = 1;
    RST = 1;
    DATA_IN = 16'b1111000011110010;
    #200
    $finish;
end

always #0.5 CLK = ~CLK;



endmodule
