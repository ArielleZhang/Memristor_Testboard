
`timescale 1 ns / 1 ps

	module DAC_PSI_v1_0_S00_AXI #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
		input wire CLK,
		//input wire [11:0] DATA_IN, //A value, active high sel
        input wire LOAD,
        input wire RST,
        output wire DATA_OUT,
//        output wire [3:0] COUNTER,
        output reg DAC_SYNC,
        output reg CLK_DAC,        
        // User ports ends
		// Do not modify the ports beyond this line

		// Global Clock Signal
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  S_AXI_ARESETN,
		// Write address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		// Write channel Protection type. This signal indicates the
    		// privilege and security level of the transaction, and whether
    		// the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_AWPROT,
		// Write address valid. This signal indicates that the master signaling
    		// valid write address and control information.
		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that the slave is ready
    		// to accept an address and associated control signals.
		output wire  S_AXI_AWREADY,
		// Write data (issued by master, acceped by Slave) 
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		// Write strobes. This signal indicates which byte lanes hold
    		// valid data. There is one write strobe bit for each eight
    		// bits of the write data bus.    
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		// Write valid. This signal indicates that valid write
    		// data and strobes are available.
		input wire  S_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    		// can accept the write data.
		output wire  S_AXI_WREADY,
		// Write response. This signal indicates the status
    		// of the write transaction.
		output wire [1 : 0] S_AXI_BRESP,
		// Write response valid. This signal indicates that the channel
    		// is signaling a valid write response.
		output wire  S_AXI_BVALID,
		// Response ready. This signal indicates that the master
    		// can accept a write response.
		input wire  S_AXI_BREADY,
		// Read address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		// Protection type. This signal indicates the privilege
    		// and security level of the transaction, and whether the
    		// transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_ARPROT,
		// Read address valid. This signal indicates that the channel
    		// is signaling valid read address and control information.
		input wire  S_AXI_ARVALID,
		// Read address ready. This signal indicates that the slave is
    		// ready to accept an address and associated control signals.
		output wire  S_AXI_ARREADY,
		// Read data (issued by slave)
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		// Read response. This signal indicates the status of the
    		// read transfer.
		output wire [1 : 0] S_AXI_RRESP,
		// Read valid. This signal indicates that the channel is
    		// signaling the required read data.
		output wire  S_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    		// accept the read data and response information.
		input wire  S_AXI_RREADY
	);

	// AXI4LITE signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rvalid;

	// Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = 1;
	//----------------------------------------------
	//-- Signals for user logic register space example
	//------------------------------------------------
	//-- Number of Slave Registers 4
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg0;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg1;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg2;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg3;
	wire	 slv_reg_rden;
	wire	 slv_reg_wren;
	reg [C_S_AXI_DATA_WIDTH-1:0]	 reg_data_out;
	integer	 byte_index;
	reg	 aw_en;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;
	// Implement axi_awready generation
	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	      aw_en <= 1'b1;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
	        begin
	          // slave is ready to accept write address when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_awready <= 1'b1;
	          aw_en <= 1'b0;
	        end
	        else if (S_AXI_BREADY && axi_bvalid)
	            begin
	              aw_en <= 1'b1;
	              axi_awready <= 1'b0;
	            end
	      else           
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awaddr <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
	        begin
	          // Write Address latching 
	          axi_awaddr <= S_AXI_AWADDR;
	        end
	    end 
	end       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && aw_en )
	        begin
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      slv_reg0 <= 0;
	      slv_reg1 <= 0;
	      slv_reg2 <= 0;
	      slv_reg3 <= 0;
	    end 
	  else begin
	    if (slv_reg_wren)
	      begin
	        case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	          2'h0:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                slv_reg0[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          2'h1:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 1
	                slv_reg1[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          2'h2:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 2
	                slv_reg2[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          2'h3:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 3
	                slv_reg3[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          default : begin
	                      slv_reg0 <= slv_reg0;
	                      slv_reg1 <= slv_reg1;
	                      slv_reg2 <= slv_reg2;
	                      slv_reg3 <= slv_reg3;
	                    end
	        endcase
	      end
	  end
	end    

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
	        begin
	          // indicates a valid write response is available
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	            //check if bready is asserted while bvalid is high) 
	            //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_araddr  <= 32'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID)
	        begin
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
	          axi_araddr  <= S_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
	        begin
	          // Valid read data is available at the read data bus
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	always @(*)
	begin
	      // Address decoding for reading registers
	      case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	        2'h0   : reg_data_out <= slv_reg0;
	        2'h1   : reg_data_out <= slv_reg1;
	        2'h2   : reg_data_out <= slv_reg2;
	        2'h3   : reg_data_out <= slv_reg3;
	        default : reg_data_out <= 0;
	      endcase
	end

	// Output register or memory read data
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rdata  <= 0;
	    end 
	  else
	    begin    
	      // When there is a valid read address (S_AXI_ARVALID) with 
	      // acceptance of read address by the slave (axi_arready), 
	      // output the read dada 
	      if (slv_reg_rden)
	        begin
	          axi_rdata <= reg_data_out;     // register read data
	        end   
	    end
	end    

	// Add user logic here

//input wire CLK,
//input wire [11:0] DATA_IN, //A value, active high sel
//input wire LOAD,
//input wire RST,
//output wire DATA_OUT,
//output wire [3:0] COUNTER,
//output wire SEL_DB,
//output wire SYNC,
//output wire CLK_DAC;    

    //reg clk_dac;
    //assign CLK_DAC = clk_dac;
    
    always @(*)begin
    CLK_DAC = ~CLK;
    end
    
    
    reg [11:0]net_in = 12'd0;
    reg BEGIN;
    
    wire [11:0] DATA_IN;
    
    assign DATA_IN = slv_reg0 [11:0];//slv_reg0[11:0];
    
//    always @(posedge LOAD)begin
//    net_in <= DATA_IN;                 //at the posedge of load, read the input data
//    BEGIN <= 1; //
//    end
    
    
    reg [3:0] counter;
//    assign COUNTER = counter;
    
    //// SYNC output, I put it after I declared counter
    ////b because it uses counter
    
    //reg sync = 0;
    //assign SYNC = sync;
    //reg sync_begin = 0;
    
    
//    always @(posedge CLK)begin

//    end
    
//    always @(posedge CLK)begin
//    if(SYNC)
//    begin
//        SYNC <= 0;
////    sync_begin <= 0;
//    end
//    end
    
    
    
    
    always @(posedge CLK) begin
//       if(counter == 4'd11)
//    //    sync_begin <= 1;
//    //    if(sync_begin == 1)
//            SYNC <= 1;
//        else 
//            SYNC <= 0;
            
             
        if (BEGIN) 
        begin
            if(counter == 4'd11)
            begin
                counter <= 4'd0;
                net_in <= 12'd0;
                DAC_SYNC <= 1; 
                BEGIN <= 0; 
            end
            else if(RST)
            begin
                counter <= 4'd0;
                DAC_SYNC <= 0;
                BEGIN <= 0 ; 
            end
            else 
            begin
                counter <= counter + 4'd1;
                DAC_SYNC <= 0; 
            end
        end
        else if (LOAD) 
        begin
            net_in <= DATA_IN;                 //at the posedge of load, read the input data
            BEGIN <= 1; //
        end 
        else
            counter <= 4'b0;
    end
    
    
    wire [11:0] PREV_OUT; // B value, active low sel
    reg SEL;
    //assign SEL_DB = SEL;
        
    always @(*)begin
//    if(RST)
//    net_in <= 12'd0;
    if (counter == 4'd0)
        SEL <= 0; 
//    if (counter == 4'd11)
//    SEL <= 2'd2;
    else
        SEL <= 1;
    end
    
    PSI_module ins0(.counter(counter), .clk(CLK), .data_in(net_in[0]), .prev_out(1'd0), .rst(RST), .sel(SEL), .data_out(PREV_OUT[0]));
    PSI_module ins1(.counter(counter), .clk(CLK), .data_in(net_in[1]), .prev_out(PREV_OUT[0]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[1])); 
    PSI_module ins2(.counter(counter), .clk(CLK), .data_in(net_in[2]), .prev_out(PREV_OUT[1]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[2])); 
    PSI_module ins3(.counter(counter), .clk(CLK), .data_in(net_in[3]), .prev_out(PREV_OUT[2]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[3])); 
    PSI_module ins4(.counter(counter), .clk(CLK), .data_in(net_in[4]), .prev_out(PREV_OUT[3]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[4])); 
    PSI_module ins5(.counter(counter), .clk(CLK), .data_in(net_in[5]), .prev_out(PREV_OUT[4]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[5])); 
    PSI_module ins6(.counter(counter), .clk(CLK), .data_in(net_in[6]), .prev_out(PREV_OUT[5]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[6])); 
    PSI_module ins7(.counter(counter), .clk(CLK), .data_in(net_in[7]), .prev_out(PREV_OUT[6]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[7])); 
    PSI_module ins8(.counter(counter), .clk(CLK), .data_in(net_in[8]), .prev_out(PREV_OUT[7]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[8])); 
    PSI_module ins9(.counter(counter), .clk(CLK), .data_in(net_in[9]), .prev_out(PREV_OUT[8]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[9])); 
    PSI_module ins10(.counter(counter), .clk(CLK), .data_in(net_in[10]), .prev_out(PREV_OUT[9]), .rst(RST), .sel(SEL), .data_out(PREV_OUT[10])); 
    PSI_module ins11(.counter(counter), .clk(CLK), .data_in(net_in[11]), .prev_out(PREV_OUT[10]), .rst(RST), .sel(SEL), .data_out(DATA_OUT)); 
 // 12 (3ish bits???) counter


	
//	always@(negedge clk) begin
//	if (counter == 1)
//	sel <= 0 ;
//	end
	
//	assign sclk = sel?0:S_AXI_ACLK;
	
//	always @(posedge S_AXI_ACLK) begin
//	       counter <= counter + 1'b1;
//	end
	
//	reg sync =0;
//	assign SYNC = sync;
	
//	always @(posedge S_AXI_ACLK) begin
//	   if(counter == 11)
//	       sync <= 1;
//	   else
//	       sync = 0;
//	end
	
//	reg clk_spi = 0;
//	assign CLK_SPI = clk_spi;
	
//	always @(negedge sclk)begin
//	   clk_spi <= sclk;
//	end
	
	
//	reg [0:11] data_reg, data_next;
//	reg [0:11]data_out;
//	assign DATA_OUT = data_out;

//	//already have counter up till 12
//	always @(posedge S_AXI_ACLK, posedge rst)begin
//	   if(rst)
//	       data_reg <= 0;
//	   else
//	       data_reg <= data_next;
//	 end
	 
//	 always @* begin
//	   data_next <= data_reg;
//	   data_out <= data_reg[counter];
//	 end
	 
//	always @(posedge change_data or rst)begin
//	   if(rst)
//	       data_next <= 1'b0;
//	   else
//	       data_next <= data;
//	end
	 
//	 always @(posedge sclk or rst)begin
//	   if(rst)
//	       PSI_single <= 1'b0;
//	   else if (sel == 0)
//	       PSI_single <= PSI_datain;
//	   else
//	       PSI_single <= B;
//	 end
	  
	
	// 12 (3ish bits???) counter

	//out: PSI_SYNC, DATA_OUT, PSI_CLK
	// User logic ends


	// User logic ends

	endmodule


module PSI_module(
input wire clk,
input wire data_in, //A value, active high sel
input wire prev_out, // B value, active low sel
//input wire load,
input wire rst,
input wire sel,
input wire counter,
output reg data_out
    );
    
//    reg net_out;
//    assign data_out = net_out;
   // always@(posedge load)begin
    // net_in <= data_in;
   // end
    
    always @(posedge clk)begin
    if(rst)
    data_out <= 1'b0;
    if(sel == 1)
    data_out <= prev_out;
    if(sel == 0)
    data_out <= data_in;
//    if(sel == 2'd2)
//    net_out <= 1'b0;
    end
    
 
 endmodule
 