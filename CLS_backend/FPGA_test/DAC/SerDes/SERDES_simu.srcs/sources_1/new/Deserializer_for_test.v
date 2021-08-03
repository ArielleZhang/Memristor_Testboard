`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/21 14:11:18
// Design Name: 
// Module Name: Deserializer_for_test
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

///// SPI data_in : DATA_OUT
////  SPI rst: RST
////  SPI sync: SYNC
//// clk: CLK

module Deserializer_for_test(
input wire DATA_IN,
input wire RST,
input wire SYNC,
input wire CLK,
output wire [11:0]SHIFTOUT
    );
    
    wire [11:0] shiftout;
    reg [11:0] out;
    assign SHIFTOUT = out;
    SPI ins0(.CLK(CLK),.DATA_IN(DATA_IN),.DATA_OUT(shiftout[0]),.RST(RST));
    SPI ins1(.CLK(CLK),.DATA_IN(shiftout[0]),.DATA_OUT(shiftout[1]),.RST(RST));
    SPI ins2(.CLK(CLK),.DATA_IN(shiftout[1]),.DATA_OUT(shiftout[2]),.RST(RST));
    SPI ins3(.CLK(CLK),.DATA_IN(shiftout[2]),.DATA_OUT(shiftout[3]),.RST(RST));
    SPI ins4(.CLK(CLK),.DATA_IN(shiftout[3]),.DATA_OUT(shiftout[4]),.RST(RST));
    SPI ins5(.CLK(CLK),.DATA_IN(shiftout[4]),.DATA_OUT(shiftout[5]),.RST(RST));
    SPI ins6(.CLK(CLK),.DATA_IN(shiftout[5]),.DATA_OUT(shiftout[6]),.RST(RST));
    SPI ins7(.CLK(CLK),.DATA_IN(shiftout[6]),.DATA_OUT(shiftout[7]),.RST(RST));
    SPI ins8(.CLK(CLK),.DATA_IN(shiftout[7]),.DATA_OUT(shiftout[8]),.RST(RST));
    SPI ins9(.CLK(CLK),.DATA_IN(shiftout[8]),.DATA_OUT(shiftout[9]),.RST(RST));
    SPI ins10(.CLK(CLK),.DATA_IN(shiftout[9]),.DATA_OUT(shiftout[10]),.RST(RST));
    SPI ins11(.CLK(CLK),.DATA_IN(shiftout[10]),.DATA_OUT(shiftout[11]),.RST(RST));
    

    
    always @(negedge SYNC)begin
    out <= shiftout;
    end
    
endmodule


module SPI(
input CLK,
input DATA_IN,
output DATA_OUT,
input RST);


reg data_out;
assign DATA_OUT = data_out;


always @(posedge CLK or RST)begin
if(RST)
data_out <= 1'b0;
else
data_out <= DATA_IN;
end


endmodule
