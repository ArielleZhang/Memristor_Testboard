`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/21 13:53:54
// Design Name: 
// Module Name: tb_serializer
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

module tb_PSI;
reg CLK;
reg [11:0] DATA_IN; //A value, active high sel
reg LOAD;
reg RST;
wire DATA_OUT;
wire [3:0]COUNTER;
wire SEL;
wire CLK_DAC;
wire SYNC;
wire [11:0] SHIFTOUT;

PSI PSI_test(.SYNC(SYNC),.CLK_DAC(CLK_DAC), .COUNTER(COUNTER),.CLK(CLK),.DATA_IN(DATA_IN),.LOAD(LOAD), .RST(RST), .DATA_OUT(DATA_OUT),.SEL_DB(SEL));
///// SPI data_in : DATA_OUT
////  SPI rst: RST
////  SPI sync: SYNC
//// clk: CLK
Deserializer_for_test SPI_test(.DATA_IN(DATA_OUT),.RST(RST),.SYNC(SYNC),.CLK(CLK_DAC), .SHIFTOUT(SHIFTOUT));
    
initial
begin
CLK = 0;
LOAD = 0;
RST = 1;
#5

RST = 0;
LOAD = 1;
DATA_IN = 12'b111000111001;

//#10
//RST = 1;
#2


LOAD = 0;
#35

RST = 1;
#5


RST = 0;
LOAD = 1;
DATA_IN = 12'b111111000001;

//#10
//RST = 1;

#2

LOAD = 0;
#35

RST = 0;
LOAD = 1;
DATA_IN = 12'b101010101010;
#2

LOAD = 0;
#35

$finish;
end

always #0.5 CLK = ~CLK;

    
    
    
endmodule

