`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2021 10:38:53 AM
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
reg clock;
reg init;
reg [3:0] type;
wire [31:0] out;

prbs_generator ins0(.clock(clock),.init(init),.type(type),.out(out));


initial
begin
init = 1;
clock = 0;
type = 4'b0000;
#1

init = 0;

end

always #0.5 clock = ~clock;


endmodule