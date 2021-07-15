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


module Pingpong_buffer_clk
//#(parameter COUNTER_WIDTH = 14'd10)
(
input wire [25:0] FREQUENCY,
output wire PINGPONG_CLK,
output wire [16:0] COUNTER,
input wire CLK,
output wire [16:0] WIDTH,
output wire [16:0] HALF);

wire [16:0]COUNTER_WIDTH;

assign COUNTER_WIDTH = 1/FREQUENCY * 10000000 - 1;
    
assign WIDTH = COUNTER_WIDTH;
  
reg clk_out = 1;
assign PINGPONG_CLK = clk_out;
  
assign HALF  = (COUNTER_WIDTH)/2;

reg [16:0] counter = 17'd0;
  assign COUNTER = counter;
  
  always @(posedge CLK)begin
  if(counter == COUNTER_WIDTH)
  counter <= 17'd0;
  if(counter < COUNTER_WIDTH)
  counter <= counter + 17'd1;
//  else
//  counter <= 14'd0;
  
  end
  
  always @(posedge CLK)begin
  if(counter > HALF || counter == HALF)
  clk_out <= 0;
  else
  clk_out <= 1;
//  else
//  counter <= 14'd0;

  end
    
    
endmodule

