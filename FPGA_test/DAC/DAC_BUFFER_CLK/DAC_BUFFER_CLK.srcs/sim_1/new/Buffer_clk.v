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

//N = 10 if 10Mhz
//N = 10 000 if 10kHz;

module Buffer_clk_test;

wire PINGPONG_CLK;
wire [13:0] COUNTER;
reg CLK;
wire [13:0]WIDTH;
wire [13:0] HALF;


Pingpong_buffer_clk ins1 (.PINGPONG_CLK(PINGPONG_CLK),
.COUNTER(COUNTER),.CLK(CLK), .WIDTH(WIDTH),.COUNTER_WIDTH(14'd10), .HALF(HALF));

//defparam ins1.COUNTER_WIDTH = 14'd10;


initial
begin
CLK = 0;

#20
$stop;

end

always #0.5 CLK = ~CLK; //period is 0.1us
endmodule
