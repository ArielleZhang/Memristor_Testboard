`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2021 01:30:00 PM
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
reg [15:0] DATA_IN;
reg ARR_SEL;
reg CLK;

stimrec ins0(.DATA_IN(DATA_IN),.ARR_SEL(ARR_SEL),.CLK(CLK));

initial
begin
CLK = 0;
ARR_SEL = 1;
DATA_IN = 16'b1111000011110010;


#20;

ARR_SEL = 0;

#20
$finish;

end
always #1 CLK = ~CLK;



endmodule
