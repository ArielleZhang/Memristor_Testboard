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


//module ADC_CLK(
//    input wire CLK_REF,
//    input wire [19:0] FREQUENCY,
//    output wire CLK_SAMPLE,
//    output wire CLK
//    );
    
////base clock has a period of 10ns does not matter
////duty of the output CLK_SAMPLE is 10% which is 1ns
////wait for 5% CLK_SAMPLE period which is 0.5ns
//// CLK starts and flips every 4%of the CLK_SAMPLE period which is 0.4ns

////convert frequency to period with unit of ns
//wire [19:0] period;
//reg [15:0] sample_on;//counter used to generate CLK_SAMPLE
//reg [15:0] clk_on;//counter used to generte CLK;
//reg [15:0] counter80;
//reg ena = 1'b0;
//reg clk_ena = 1'b0;
//reg [5:0]counter4;

//reg clk_sample = 0;
//reg clk = 0;
//assign CLK_SAMPLE = clk_sample;
//assign CLK = clk;

//assign period = 1000000000/FREQUENCY;
//wire sample_max = period* 0.1; 
//wire clk_max = period * 0.8;
//wire clkon_max = period * 0.15;

//always @(posedge CLK_REF)
//begin
//    sample_on <= sample_on + 16'd1;
//    //generated the 90% low part of CLK_SAMPLE
//    if(sample_on == sample_max)
//    begin
//        clk_sample <= ~clk_sample;
//    end
    
//    else if(sample_on == period)
//    begin
//    //generates the 10% high part of the CLK_SAMPLE
//        clk_sample <= ~clk_sample;
//        sample_on = 16'd0;
//    end
    
//    if(ena)
//        clk_on <= clk_on + 16'd1;
        
//    if(clk_on == clkon_max)
//        clk_ena <= ~clk_ena;
    
//    if(clk_ena)
//        counter80 = counter80 + 16'd1;
    
//    if(counter80 == 0.04 * period)
//    begin
//        clk = ~clk;
//        counter4 <= counter4 + 4'd1;
//    end
    
//    if(counter4 == 6'd16)
//    begin
//        counter80 <= 16'd0;
//        clk_ena <= 0;
//    end


//end


//endmodule



module ADC_driver(
    input wire REF_CLK,
    input wire [15:0] FREQUENCY, //base clk is 400Mhz, use counter = 39 to test the 10Mhz clk
    output reg CLK,
    output reg CLK_SAMPLE,
    output reg SYNC
);

reg [15:0] counter = 16'd0;

always @(posedge REF_CLK)
begin

    CLK <= 0;
    SYNC <= 0;
    
    if (counter >= 16'h14)
    begin
        CLK <= 0;
        counter <= counter + 16'b1;
        CLK_SAMPLE <= 0;
        
        if (counter == 16'h15)
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
        CLK <= ~CLK;
        counter <= counter + 16'b1;
        CLK_SAMPLE <= 0;
    end
end
endmodule


module ADC_DATA(
    input wire REF_CLK,
    input wire [9:0]IN,
    output reg [9:0]ADC_DATA_OUT
);

    wire ADC_CLK;
    wire ADC_SYNC;


ADC_driver ins1(.REF_CLK(REF_CLK), .FREQUENCY(16'd39),//base clk is 400Mhz, use counter = 39 to test the 10Mhz clk
    .CLK(ADC_CLK),.SYNC(ADC_SYNC)
);


	reg [9:0] net_out = 0;
	reg [3:0] counter = 0;
	
	always @(posedge ADC_CLK)
	begin
	   net_out [counter] = IN[counter];
	   counter <= counter + 1;
	
	   if(counter == 4'd10)
	   begin
	       counter <= 0;
	   end
	
	end
	
	always @(posedge ADC_SYNC)
	begin
	   ADC_DATA_OUT <= net_out;
	end

endmodule