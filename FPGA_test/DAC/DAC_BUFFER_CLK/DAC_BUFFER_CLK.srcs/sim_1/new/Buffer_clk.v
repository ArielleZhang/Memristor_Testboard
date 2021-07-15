`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/28 13:41:08
// Design Name: 
// Module Name: Buffer_clk
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
//1 us = 0.0000001s

//N = 10 - 1 if 10Mhz, period = 10us

//the base clock is o.5 us, o.5us

// input frequency in Hz

// Period = 1/frequency * 1000000
// N = period - 1

//N = 10 000 - 1 if 10kHz period = 10 ms

//inout frequency:
//COUNTER WIDTH = 1/f * 100000000 - 1

module Buffer_clk_test;

wire [25:0] FREQUENCY;
wire PINGPONG_CLK;
wire [16:0] COUNTER;
reg CLK;
wire [16:0] WIDTH;
wire [16:0] HALF;


Pingpong_buffer_clk ins1 (.PINGPONG_CLK(PINGPONG_CLK),
.COUNTER(COUNTER),.CLK(CLK), .WIDTH(WIDTH),.FREQUENCY(17'd10000000), .HALF(HALF));

//defparam ins1.COUNTER_WIDTH = 14'd10;


initial
begin
CLK = 1;

#100

$stop;

end

always #5 CLK = ~CLK; //period is 1us base clock
endmodule
