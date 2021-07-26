`timescale 1ns / 0.001ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2021 06:46:07 PM
// Design Name: 
// Module Name: ADC_CLK
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


module ADC_CLK(
    input wire CLK_REF,
    input wire [19:0] FREQUENCY,
    output wire CLK_SAMPLE,
    output wire CLK
    );
    
//base clock has a period of 1ns
//duty of the output CLK_SAMPLE is 10%
//wait for 5% CLK_SAMPLE period
// CLK starts and flips every 4%of the CLK_SAMPLE period

//convert frequency to period with unit of ns
wire [19:0] period;
reg [15:0] sample_on;//counter used to generate CLK_SAMPLE
reg [15:0] clk_on;//counter used to generte CLK;
reg [15:0] counter80;
reg ena = 1'b0;
reg clk_ena = 1'b0;
reg [5:0]counter4;

reg clk_sample = 0;
reg clk = 0;
assign CLK_SAMPLE = clk_sample;
assign CLK = clk;

assign period = 1000000000/FREQUENCY;
wire sample_max = period* 0.1; 
wire clk_max = period * 0.8;
wire clkon_max = period * 0.15;

always @(posedge CLK_REF)begin

sample_on <= sample_on + 16'd1;
//generated the 90% low part of CLK_SAMPLE
if(sample_on == sample_max)begin
clk_sample <= ~clk_sample;
end

//generates the 10% high part of the CLK_SAMPLE
if(sample_on == period)begin
clk_sample <= ~clk_sample;
sample_on = 16'd0;
end

if(ena)
clk_on <= clk_on + 16'd1;

if(clk_on == clkon_max)
clk_ena <= ~clk_ena;

if(clk_ena)
counter80 = counter80 + 16'd1;

if(counter80 == 0.04 * period)
clk = ~clk;
counter4 <= counter4 + 4'd1;

if(counter4 == 6'd16)
counter80 <= 16'd0;
clk_ena <= 0;


end


endmodule
