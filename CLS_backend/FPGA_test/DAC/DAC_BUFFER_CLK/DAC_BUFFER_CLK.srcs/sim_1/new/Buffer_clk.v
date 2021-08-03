`timescale 1ns / 1ns
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
//1 ns = 0.000000001s
//the base clock is o.5 ns, o.5ns
// input frequency in Hz

//N = 10 - 1 if 10Mhz, period = 10us


// Period = 1/frequency * 1000 000 00 (convert period to 10ns)
// N = period - 1

//example: N = 10 000 - 1 for 10kHz because period = 10 000 (10ns) 9 999
//N = 10 - 1 for 10MHz because period = 10 (10ns) 9

module Buffer_clk_test;

//wire [23:0] FREQUENCY; //2^24 = 16 777 216 > 10 000 000Hz (1MhZ) 
wire PINGPONG_CLK;
//reg [18:0] COUNTER; //
reg CLK;
//reg [18:0] WIDTH;
//reg [18:0] HALF;


Pingpong_buffer_clk ins1 (.PINGPONG_CLK(PINGPONG_CLK)
,.CLK(CLK),.FREQUENCY(32'd5));

//defparam ins1.COUNTER_WIDTH = 14'd10;


initial
begin
CLK = 0;

#100000

$stop;

end

always #5 CLK = ~CLK; //period is 10 ns base clock
endmodule
