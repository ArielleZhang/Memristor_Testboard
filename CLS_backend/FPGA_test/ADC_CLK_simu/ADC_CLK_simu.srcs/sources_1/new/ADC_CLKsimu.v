`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2021 12:00:53 PM
// Design Name: 
// Module Name: ADC_CLKsimu
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


module ADC_CLKsimu(
input wire REF_CLK,
output reg ADC_CLK,
output reg SYNC,
output reg CLK_SAMPLE
    );
    
wire [15:0] FREQUENCY = 16'd31; //base clk is 400Mhz, use counter = 39 to test the 10Mhz clk

//assign FREQUENCY = slv_reg0[15:0];

reg [15:0] counter = 16'd0;

always @(posedge REF_CLK)
begin

    ADC_CLK <= 0;
    SYNC <= 0;
    
    if (counter >= 16'd20)
    begin
        ADC_CLK <= 0;
        counter <= counter + 16'b1;
        CLK_SAMPLE <= 0;
        
        if (counter == 16'd21)
        begin
            SYNC <= 1;
        end
        
        if (counter == FREQUENCY)
        begin
            counter <= 0;  
        end
        
        if (counter == FREQUENCY -1)
            CLK_SAMPLE <= 1;
        
             
    end
    
    else
    begin
        ADC_CLK <= ~ADC_CLK;
        counter <= counter + 16'b1;
        CLK_SAMPLE <= 0;
    end
    

end
endmodule
