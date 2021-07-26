`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/28 13:39:51
// Design Name: 
// Module Name: BUFFERCLK
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

//base clk is 400Mhz
//period = 1/400 000 000 = 1/4 * 10^-8 0.25 * 10^-8 = 2.5 ns;

//period = 2500 000 000/freq  convert period to 2.5ns 

//the base clock is o.5 ns, o.5ns
// input frequency in Hz

//N = 10 - 1 if 10Mhz, period = 10us


// Period = 1/frequency * 1000 000 000 (convert period to ns)
// N = period - 1

//example: N = 100 000 - 1 for 10kHz because period = 100 000ns


module Pingpong_buffer_clk
//#(parameter COUNTER_WIDTH = 14'd10)
(
input wire [23:0] FREQUENCY, //100MHz
output wire PINGPONG_CLK,
input wire CLK //1Ghz 100Mhz
//output wire [18:0] WIDTH,
//output wire [18:0] HALF);

);


//wire [18:0]width;
wire [18:0] WIDTH;
wire [18:0] HALF;
reg [18:0]COUNTER = 0 ;


//COUNTER WITDH has a maximum of 1/10000 * 1 000 000 000 - 1 = 9999;
//2^17 > 99 999

assign WIDTH = (40000000/FREQUENCY) - 1;
    
//assign WIDTH = counter_width;
  
reg clk_out = 1;
assign PINGPONG_CLK = clk_out;
  
assign HALF  = (WIDTH)/2;
  
always @(posedge CLK)begin
//  if (INIT)begin 
//    INIT <= 0 ; 
//    COUNTER <= 0;
//  end 
  if(COUNTER == HALF )
  begin
      COUNTER <= 19'd0;
      clk_out <= ~clk_out;
  end
  else
    COUNTER <= COUNTER + 19'd1;
end
  
//always @(posedge CLK)begin
//  if(COUNTER >= HALF & COUNTER != counter_width)
//  clk_out <= 0;
//  else
//  clk_out <= 1;
//  else
//  counter <= 14'd0;

//end
    
    
endmodule

