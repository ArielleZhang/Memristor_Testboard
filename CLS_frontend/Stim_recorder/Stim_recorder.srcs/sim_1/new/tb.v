`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2021 12:34:52 AM
// Design Name: 
// Module Name: tb
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


module tb;
reg CLK;
reg DATA_IN;
reg [4:0] ARR_SEL;
wire RST;
wire [6:0]DAC0;
wire [6:0]DAC1;
wire [6:0]DAC2;
wire [6:0]DAC3;
wire [6:0]DAC4;
wire [6:0]DAC5;
wire [6:0]DAC6;
wire [6:0]DAC7;
wire [6:0]DAC8;
wire [6:0]DAC9;
wire [6:0]DAC10;
wire [6:0]DAC11;
wire [6:0]DAC12;
wire [6:0]DAC13;
wire [6:0]DAC14;
wire [6:0]DAC15;
wire [15:0]MUX;
    
    
stim_rec ins0(.CLK(CLK),.DATA_IN(DATA_IN),.ARR_SEL(ARR_SEL),.RST(RST),.DAC0(DAC0),.DAC1(DAC1),.DAC2(DAC2),.DAC3(DAC3),.DAC4(DAC4),.DAC5(DAC5),.DAC6(DAC6),.DAC7(DAC7),.DAC8(DAC8),.DAC9(DAC9),.DAC10(DAC10),.DAC11(DAC11),.DAC12(DAC12),.DAC13(DAC13),.DAC14(DAC14),.DAC15(DAC15),.MUX(MUX));

initial
begin
CLK = 0;
DATA_IN = 0;
ARR_SEL = 5'b01111;
#1//1

DATA_IN = 1;
#1//2

DATA_IN = 1;
#1//3

DATA_IN = 0;
#1//4

DATA_IN = 0;
#1//5

DATA_IN = 0;
#1//6

DATA_IN = 1;
#1//7

DATA_IN = 1;
#1//8

DATA_IN = 1;
#1//9

DATA_IN = 1;
#1//10

DATA_IN = 0;
#1//11

DATA_IN = 0;
#1//12

DATA_IN = 0;
#1//13


DATA_IN = 0;
#1//14

DATA_IN = 1;
#1//15

DATA_IN = 0;
#10//16

$stop;

end

always #0.5 CLK = ~CLK;

endmodule
