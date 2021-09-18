`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2021 12:05:49 PM
// Design Name: 
// Module Name: ADC_CLKtb
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


module ADC_CLKtb;

reg REF_CLK;
wire ADC_CLK;
wire SYNC;
wire CLK_SAMPLE;


ADC_CLKsimu ins1(.REF_CLK(REF_CLK),.ADC_CLK(ADC_CLK),.SYNC(SYNC),.CLK_SAMPLE(CLK_SAMPLE));

initial 
begin
REF_CLK = 0;

end
always #1.5625 REF_CLK = ~REF_CLK;
    
    
endmodule
