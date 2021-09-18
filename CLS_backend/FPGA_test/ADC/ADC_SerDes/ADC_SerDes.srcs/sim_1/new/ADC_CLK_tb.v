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

//reg CLK_REF;
//wire [19:0]CLK_SAMPLE;
//wire CLK;

reg REF_CLK;
//wire [15:0] FREQUENCY;//base clk is 400Mhz, use counter = 39 to test the 10Mhz clk
//wire CLK;
//wire CLK_SAMPLE;
//wire SYNC;

//adjustable frequency from 100 000Hz (10 000ns period) to 10 000 000 Hz(100ns period)

//ADC_CLK ins1 (.CLK_REF(CLK_REF), .FREQUENCY(20'd100000), .CLK_SAMPLE(CLK_SAMPLE),
//.CLK(CLK));

//ADC_driver ins2 (.REF_CLK(REF_CLK), .FREQUENCY(16'd39), .CLK(CLK), .CLK_SAMPLE(CLK_SAMPLE), .SYNC(SYNC));
wire [9:0] ADC_DATA_OUT;
ADC_DATA ins3(.REF_CLK(REF_CLK),.IN(10'b1100111001),.ADC_DATA_OUT(ADC_DATA_OUT)
);

initial begin
REF_CLK = 0;

#1000

$stop;
end

//300Mhz clk

always #1.25 REF_CLK = ~REF_CLK;
endmodule
