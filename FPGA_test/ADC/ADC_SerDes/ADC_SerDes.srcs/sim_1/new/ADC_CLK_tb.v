`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2021 07:23:23 PM
// Design Name: 
// Module Name: ADC_CLK_tb
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


module ADC_CLK_tb;

reg CLK_REF;
wire [19:0]CLK_SAMPLE;
wire CLK;

//adjustable frequency from 100 000Hz (10 000ns period) to 10 000 000 Hz(100ns period)

ADC_CLK ins1 (.CLK_REF(CLK_REF), .FREQUENCY(20'd100000), .CLK_SAMPLE(CLK_SAMPLE),
.CLK(CLK));


initial begin
CLK_REF = 0;

#100000

$stop;
end

always #0.5 CLK_REF = ~CLK_REF;
endmodule
