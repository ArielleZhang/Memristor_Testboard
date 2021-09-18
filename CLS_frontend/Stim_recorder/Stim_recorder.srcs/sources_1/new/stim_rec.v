`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2021 11:05:01 PM
// Design Name: 
// Module Name: stim_rec
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


module stim_rec(
input wire CLK,
input wire DATA_IN,
input wire [4:0] ARR_SEL,
input wire RST,
output reg [6:0]DAC0,
output reg [6:0]DAC1,
output reg [6:0]DAC2,
output reg [6:0]DAC3,
output reg [6:0]DAC4,
output reg [6:0]DAC5,
output reg [6:0]DAC6,
output reg [6:0]DAC7,
output reg [6:0]DAC8,
output reg [6:0]DAC9,
output reg [6:0]DAC10,
output reg [6:0]DAC11,
output reg [6:0]DAC12,
output reg [6:0]DAC13,
output reg [6:0]DAC14,
output reg [6:0]DAC15,
output reg [15:0]MUX
    );
    //where is output??????
    
    reg ARR0 = 0;
    reg ARR1 = 0;
    reg ARR2 = 0;
    reg ARR3 = 0;
    reg ARR4 = 0;
    reg ARR5 = 0;
    reg ARR6 = 0;
    reg ARR7 = 0;
    reg ARR8 = 0;
    reg ARR9 = 0;
    reg ARR10 = 0;
    reg ARR11 = 0;
    reg ARR12 = 0;
    reg ARR13 = 0;
    reg ARR14 = 0;
    reg ARR15 = 0;
    
    always @(*)
    begin
    case(ARR_SEL)
        4'b1111: ARR0 <= 1;
        4'b1101: ARR1 <= 1;
        4'b1110: ARR2 <= 1;
        4'b1100: ARR3 <= 1;
        4'b0111: ARR4 <= 1;
        4'b0101: ARR5 <= 1;
        4'b0110: ARR6 <= 1;
        4'b0100: ARR7 <= 1;
        4'b1011: ARR8 <= 1;
        4'b1001: ARR9 <= 1;
        4'b1010: ARR10 <= 1;
        4'b1000: ARR11 <= 1;
        4'b0011: ARR12 <= 1;
        4'b0001: ARR13 <= 1;
        4'b0010: ARR14 <= 1;
        4'b0000: ARR15 <= 1;
        
    endcase
    end
    
    
    always @(posedge CLK) 
    begin
    
    if(ARR_SEL[4] && ARR0)
    DAC0 <= dac;
    
    if(ARR_SEL[4] && ARR1)
    DAC1 <= dac;
    
    if(ARR_SEL[4] && ARR2)
    DAC2 <= dac;
    
    if(ARR_SEL[4] && ARR3)
    DAC3 <= dac;
    
    if(ARR_SEL[4] && ARR4)
    DAC4 <= dac;
    
    if(ARR_SEL[4] && ARR5)
    DAC5 <= dac;
    
    if(ARR_SEL[4] && ARR6)
    DAC6 <= dac;
    
    if(ARR_SEL[4] && ARR7)
    DAC7 <= dac;
    
    if(ARR_SEL[4] && ARR8)
    DAC8 <= dac;
    
    if(ARR_SEL[4] && ARR9)
    DAC9 <= dac;
    
    if(ARR_SEL[4] && ARR10)
    DAC10 <= dac;
    
    if(ARR_SEL[4] && ARR11)
    DAC11 <= dac;
    
    if(ARR_SEL[4] && ARR12)
    DAC12 <= dac;
    
    if(ARR_SEL[4] && ARR13)
    DAC13 <= dac;
    
    if(ARR_SEL[4] && ARR14)
    DAC14 <= dac;
    
    if(ARR_SEL[4] && ARR15)
    DAC15 <= dac;
    
    if(~ARR_SEL[4])
    MUX <= mux;
    
    end
    
    
    wire [15:0]mux;
    wire [6:0]dac;
    
    sevenbitSPI insdac(.DATA_IN(DATA_IN),.RST(RST),.CLK(CLK),.SHIFTOUT(dac));
    sixteenbitSPI insmux(.DATA_IN(DATA_IN),.RST(RST),.CLK(CLK),.SHIFTOUT(mux));    
   




	endmodule

module sevenbitSPI(
input wire DATA_IN,
input wire RST,
input wire CLK,
output wire [6:0]SHIFTOUT
    );
    
    SPI ins0(.CLK(CLK),.DATA_IN(DATA_IN),.DATA_OUT(SHIFTOUT[0]),.RST(RST));
    SPI ins1(.CLK(CLK),.DATA_IN(SHIFTOUT[0]),.DATA_OUT(SHIFTOUT[1]),.RST(RST));
    SPI ins2(.CLK(CLK),.DATA_IN(SHIFTOUT[1]),.DATA_OUT(SHIFTOUT[2]),.RST(RST));
    SPI ins3(.CLK(CLK),.DATA_IN(SHIFTOUT[2]),.DATA_OUT(SHIFTOUT[3]),.RST(RST));
    SPI ins4(.CLK(CLK),.DATA_IN(SHIFTOUT[3]),.DATA_OUT(SHIFTOUT[4]),.RST(RST));
    SPI ins5(.CLK(CLK),.DATA_IN(SHIFTOUT[4]),.DATA_OUT(SHIFTOUT[5]),.RST(RST));
    SPI ins6(.CLK(CLK),.DATA_IN(SHIFTOUT[5]),.DATA_OUT(SHIFTOUT[6]),.RST(RST));
    
endmodule


module sixteenbitSPI(
input wire DATA_IN,
input wire RST,
input wire CLK,
output wire [15:0]SHIFTOUT
    );
    
    SPI ins0(.CLK(CLK),.DATA_IN(DATA_IN),.DATA_OUT(SHIFTOUT[0]),.RST(RST));
    SPI ins1(.CLK(CLK),.DATA_IN(SHIFTOUT[0]),.DATA_OUT(SHIFTOUT[1]),.RST(RST));
    SPI ins2(.CLK(CLK),.DATA_IN(SHIFTOUT[1]),.DATA_OUT(SHIFTOUT[2]),.RST(RST));
    SPI ins3(.CLK(CLK),.DATA_IN(SHIFTOUT[2]),.DATA_OUT(SHIFTOUT[3]),.RST(RST));
    SPI ins4(.CLK(CLK),.DATA_IN(SHIFTOUT[3]),.DATA_OUT(SHIFTOUT[4]),.RST(RST));
    SPI ins5(.CLK(CLK),.DATA_IN(SHIFTOUT[4]),.DATA_OUT(SHIFTOUT[5]),.RST(RST));
    SPI ins6(.CLK(CLK),.DATA_IN(SHIFTOUT[5]),.DATA_OUT(SHIFTOUT[6]),.RST(RST));
    SPI ins7(.CLK(CLK),.DATA_IN(SHIFTOUT[6]),.DATA_OUT(SHIFTOUT[7]),.RST(RST));
    SPI ins8(.CLK(CLK),.DATA_IN(SHIFTOUT[7]),.DATA_OUT(SHIFTOUT[8]),.RST(RST));
    SPI ins9(.CLK(CLK),.DATA_IN(SHIFTOUT[8]),.DATA_OUT(SHIFTOUT[9]),.RST(RST));
    SPI ins10(.CLK(CLK),.DATA_IN(SHIFTOUT[9]),.DATA_OUT(SHIFTOUT[10]),.RST(RST));
    SPI ins11(.CLK(CLK),.DATA_IN(SHIFTOUT[10]),.DATA_OUT(SHIFTOUT[11]),.RST(RST));
    SPI ins12(.CLK(CLK),.DATA_IN(SHIFTOUT[11]),.DATA_OUT(SHIFTOUT[12]),.RST(RST));
    SPI ins13(.CLK(CLK),.DATA_IN(SHIFTOUT[12]),.DATA_OUT(SHIFTOUT[13]),.RST(RST));
    SPI ins14(.CLK(CLK),.DATA_IN(SHIFTOUT[13]),.DATA_OUT(SHIFTOUT[14]),.RST(RST));
    SPI ins15(.CLK(CLK),.DATA_IN(SHIFTOUT[14]),.DATA_OUT(SHIFTOUT[15]),.RST(RST));
    
endmodule


module SPI(
input wire CLK,
input wire DATA_IN,
output reg DATA_OUT,
input wire RST);

always @(posedge CLK)
begin
    if(~RST)
        DATA_OUT <= 1'b0;
    else
        DATA_OUT <= DATA_IN;
end

endmodule


