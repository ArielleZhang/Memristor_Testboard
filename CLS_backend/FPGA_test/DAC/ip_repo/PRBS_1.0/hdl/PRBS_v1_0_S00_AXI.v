
`timescale 1 ns / 1 ps

	module PRBS_v1_0_S00_AXI #
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
		input wire wr_clock,
		input wire wr_init,
		output reg out,
		input wire [3:0] type,
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
	localparam  TYPE_PRBS7  = 4'b0000;
    localparam  TYPE_PRBS9  = 4'b0001;
    localparam  TYPE_PRBS10 = 4'b0010;
    localparam  TYPE_PRBS11 = 4'b0011;
    localparam  TYPE_PRBS15 = 4'b0100;
    localparam  TYPE_PRBS20 = 4'b0101;
    localparam  TYPE_PRBS23 = 4'b0110;
    localparam  TYPE_PRBS29 = 4'b0111;
    localparam  TYPE_PRBS31 = 4'b1000;
	wire [31:0] wr_out;
	prbs prbs_ins0(.type(wr_type), .clock(wr_clock), .init(wr_init), .out(wr_out));
    always@(posedge wr_clock)
    begin
//        case(wr_type)
//            TYPE_PRBS7 : out <= wr_out[7];
//            TYPE_PRBS9 : out <= wr_out[8];
//            TYPE_PRBS10 : out <= wr_out[9];
//            TYPE_PRBS11 : out <= wr_out[10];
//            TYPE_PRBS15 : out <= wr_out[14];
//            TYPE_PRBS20 : out <= wr_out[19];
//            TYPE_PRBS23 : out <= wr_out[22];
//            TYPE_PRBS29 : out <= wr_out[28];
//            TYPE_PRBS31 : out <= wr_out[30];
//            default : out <= wr_clock; 
//        endcase
          out <= wr_out[31];
    end 
    

	// User logic ends

endmodule
	
module prbs(
    input [3:0] type,
    input clock,
    input init,
    output reg [31:0] out);

    localparam  TYPE_PRBS7  = 4'b0000;
    localparam  TYPE_PRBS9  = 4'b0001;
    localparam  TYPE_PRBS10 = 4'b0010;
    localparam  TYPE_PRBS11 = 4'b0011;
    localparam  TYPE_PRBS15 = 4'b0100;
    localparam  TYPE_PRBS20 = 4'b0101;
    localparam  TYPE_PRBS23 = 4'b0110;
    localparam  TYPE_PRBS29 = 4'b0111;
    localparam  TYPE_PRBS31 = 4'b1000;
    
    
    /**************************************************/
    function [31:0] prbs7;
      input [31:0] in;
      begin
        prbs7[31] = in[6]^in[5];
        prbs7[30] = in[5]^in[4];
        prbs7[29] = in[4]^in[3];
        prbs7[28] = in[3]^in[2];
        prbs7[27] = in[2]^in[1];
        prbs7[26] = in[1]^in[0];
        prbs7[25] = in[0]^(in[6]^in[5]);
        prbs7[24] = (in[6]^in[5])^(in[5]^in[4]);
        prbs7[23] = (in[5]^in[4])^(in[4]^in[3]);
        prbs7[22] = (in[4]^in[3])^(in[3]^in[2]);
        prbs7[21] = (in[3]^in[2])^(in[2]^in[1]);
        prbs7[20] = (in[2]^in[1])^(in[1]^in[0]);
        prbs7[19] = (in[1]^in[0])^(in[0]^(in[6]^in[5]));
        prbs7[18] = (in[0]^(in[6]^in[5]))^((in[6]^in[5])^(in[5]^in[4]));
        prbs7[17] = ((in[6]^in[5])^(in[5]^in[4]))^((in[5]^in[4])^(in[4]^in[3]));
        prbs7[16] = ((in[5]^in[4])^(in[4]^in[3]))^((in[4]^in[3])^(in[3]^in[2]));
        prbs7[15] = ((in[4]^in[3])^(in[3]^in[2]))^((in[3]^in[2])^(in[2]^in[1]));
        prbs7[14] = ((in[3]^in[2])^(in[2]^in[1]))^((in[2]^in[1])^(in[1]^in[0]));
        prbs7[13] = ((in[2]^in[1])^(in[1]^in[0]))^((in[1]^in[0])^(in[0]^(in[6]^in[5])));
        prbs7[12] = ((in[1]^in[0])^(in[0]^(in[6]^in[5])))^((in[0]^(in[6]^in[5]))^((in[6]^in[5])^(in[5]^in[4])));
        prbs7[11] = ((in[0]^(in[6]^in[5]))^((in[6]^in[5])^(in[5]^in[4])))^(((in[6]^in[5])^(in[5]^in[4]))^((in[5]^in[4])^(in[4]^in[3])));
        prbs7[10] = (((in[6]^in[5])^(in[5]^in[4]))^((in[5]^in[4])^(in[4]^in[3])))^(((in[5]^in[4])^(in[4]^in[3]))^((in[4]^in[3])^(in[3]^in[2])));
        prbs7[9]  = (((in[5]^in[4])^(in[4]^in[3]))^((in[4]^in[3])^(in[3]^in[2])))^(((in[4]^in[3])^(in[3]^in[2]))^((in[3]^in[2])^(in[2]^in[1])));
        prbs7[8]  = (((in[4]^in[3])^(in[3]^in[2]))^((in[3]^in[2])^(in[2]^in[1])))^(((in[3]^in[2])^(in[2]^in[1]))^((in[2]^in[1])^(in[1]^in[0])));
        prbs7[7]  = (((in[3]^in[2])^(in[2]^in[1]))^((in[2]^in[1])^(in[1]^in[0])))^(((in[2]^in[1])^(in[1]^in[0]))^((in[1]^in[0])^(in[0]^(in[6]^in[5]))));
        prbs7[6]  = (((in[2]^in[1])^(in[1]^in[0]))^((in[1]^in[0])^(in[0]^(in[6]^in[5]))))^(((in[1]^in[0])^(in[0]^(in[6]^in[5])))^((in[0]^(in[6]^in[5]))^((in[6]^in[5])^(in[5]^in[4]))));
        prbs7[5]  = (((in[1]^in[0])^(in[0]^(in[6]^in[5])))^((in[0]^(in[6]^in[5]))^((in[6]^in[5])^(in[5]^in[4]))))^(((in[0]^(in[6]^in[5]))^((in[6]^in[5])^(in[5]^in[4])))^(((in[6]^in[5])^(in[5]^in[4]))^((in[5]^in[4])^(in[4]^in[3]))));
        prbs7[4]  = (((in[0]^(in[6]^in[5]))^((in[6]^in[5])^(in[5]^in[4])))^(((in[6]^in[5])^(in[5]^in[4]))^((in[5]^in[4])^(in[4]^in[3]))))^((((in[6]^in[5])^(in[5]^in[4]))^((in[5]^in[4])^(in[4]^in[3])))^(((in[5]^in[4])^(in[4]^in[3]))^((in[4]^in[3])^(in[3]^in[2]))));
        prbs7[3]  = ((((in[6]^in[5])^(in[5]^in[4]))^((in[5]^in[4])^(in[4]^in[3])))^(((in[5]^in[4])^(in[4]^in[3]))^((in[4]^in[3])^(in[3]^in[2]))))^((((in[5]^in[4])^(in[4]^in[3]))^((in[4]^in[3])^(in[3]^in[2])))^(((in[4]^in[3])^(in[3]^in[2]))^((in[3]^in[2])^(in[2]^in[1]))));
        prbs7[2]  = ((((in[5]^in[4])^(in[4]^in[3]))^((in[4]^in[3])^(in[3]^in[2])))^(((in[4]^in[3])^(in[3]^in[2]))^((in[3]^in[2])^(in[2]^in[1]))))^((((in[4]^in[3])^(in[3]^in[2]))^((in[3]^in[2])^(in[2]^in[1])))^(((in[3]^in[2])^(in[2]^in[1]))^((in[2]^in[1])^(in[1]^in[0]))));
        prbs7[1]  = ((((in[4]^in[3])^(in[3]^in[2]))^((in[3]^in[2])^(in[2]^in[1])))^(((in[3]^in[2])^(in[2]^in[1]))^((in[2]^in[1])^(in[1]^in[0]))))^((((in[3]^in[2])^(in[2]^in[1]))^((in[2]^in[1])^(in[1]^in[0])))^(((in[2]^in[1])^(in[1]^in[0]))^((in[1]^in[0])^(in[0]^(in[6]^in[5])))));
        prbs7[0]  = ((((in[3]^in[2])^(in[2]^in[1]))^((in[2]^in[1])^(in[1]^in[0])))^(((in[2]^in[1])^(in[1]^in[0]))^((in[1]^in[0])^(in[0]^(in[6]^in[5])))))^((((in[2]^in[1])^(in[1]^in[0]))^((in[1]^in[0])^(in[0]^(in[6]^in[5]))))^(((in[1]^in[0])^(in[0]^(in[6]^in[5])))^((in[0]^(in[6]^in[5]))^((in[6]^in[5])^(in[5]^in[4])))));
      end
    endfunction
    
    /**************************************************/
    function [31:0] prbs9;
      input [31:0] in;
      begin
        prbs9[31] = in[8]^in[4];
        prbs9[30] = in[7]^in[3];
        prbs9[29] = in[6]^in[2];
        prbs9[28] = in[5]^in[1];
        prbs9[27] = in[4]^in[0];
        prbs9[26] = in[3]^(in[8]^in[4]);
        prbs9[25] = in[2]^(in[7]^in[3]);
        prbs9[24] = in[1]^(in[6]^in[2]);
        prbs9[23] = in[0]^(in[5]^in[1]);
        prbs9[22] = (in[8]^in[4])^(in[4]^in[0]);
        prbs9[21] = (in[7]^in[3])^(in[3]^(in[8]^in[4]));
        prbs9[20] = (in[6]^in[2])^(in[2]^(in[7]^in[3]));
        prbs9[19] = (in[5]^in[1])^(in[1]^(in[6]^in[2]));
        prbs9[18] = (in[4]^in[0])^(in[0]^(in[5]^in[1]));
        prbs9[17] = (in[3]^(in[8]^in[4]))^((in[8]^in[4])^(in[4]^in[0]));
        prbs9[16] = (in[2]^(in[7]^in[3]))^((in[7]^in[3])^(in[3]^(in[8]^in[4])));
        prbs9[15] = (in[1]^(in[6]^in[2]))^((in[6]^in[2])^(in[2]^(in[7]^in[3])));
        prbs9[14] = (in[0]^(in[5]^in[1]))^((in[5]^in[1])^(in[1]^(in[6]^in[2])));
        prbs9[13] = ((in[8]^in[4])^(in[4]^in[0]))^((in[4]^in[0])^(in[0]^(in[5]^in[1])));
        prbs9[12] = ((in[7]^in[3])^(in[3]^(in[8]^in[4])))^((in[3]^(in[8]^in[4]))^((in[8]^in[4])^(in[4]^in[0])));
        prbs9[11] = ((in[6]^in[2])^(in[2]^(in[7]^in[3])))^((in[2]^(in[7]^in[3]))^((in[7]^in[3])^(in[3]^(in[8]^in[4]))));
        prbs9[10] = ((in[5]^in[1])^(in[1]^(in[6]^in[2])))^((in[1]^(in[6]^in[2]))^((in[6]^in[2])^(in[2]^(in[7]^in[3]))));
        prbs9[9] = ((in[4]^in[0])^(in[0]^(in[5]^in[1])))^((in[0]^(in[5]^in[1]))^((in[5]^in[1])^(in[1]^(in[6]^in[2]))));
        prbs9[8] = ((in[3]^(in[8]^in[4]))^((in[8]^in[4])^(in[4]^in[0])))^(((in[8]^in[4])^(in[4]^in[0]))^((in[4]^in[0])^(in[0]^(in[5]^in[1]))));
        prbs9[7] = ((in[2]^(in[7]^in[3]))^((in[7]^in[3])^(in[3]^(in[8]^in[4]))))^(((in[7]^in[3])^(in[3]^(in[8]^in[4])))^((in[3]^(in[8]^in[4]))^((in[8]^in[4])^(in[4]^in[0]))));
        prbs9[6] = ((in[1]^(in[6]^in[2]))^((in[6]^in[2])^(in[2]^(in[7]^in[3]))))^(((in[6]^in[2])^(in[2]^(in[7]^in[3])))^((in[2]^(in[7]^in[3]))^((in[7]^in[3])^(in[3]^(in[8]^in[4])))));
        prbs9[5] = ((in[0]^(in[5]^in[1]))^((in[5]^in[1])^(in[1]^(in[6]^in[2]))))^(((in[5]^in[1])^(in[1]^(in[6]^in[2])))^((in[1]^(in[6]^in[2]))^((in[6]^in[2])^(in[2]^(in[7]^in[3])))));
        prbs9[4] = (((in[8]^in[4])^(in[4]^in[0]))^((in[4]^in[0])^(in[0]^(in[5]^in[1]))))^(((in[4]^in[0])^(in[0]^(in[5]^in[1])))^((in[0]^(in[5]^in[1]))^((in[5]^in[1])^(in[1]^(in[6]^in[2])))));
        prbs9[3] = (((in[7]^in[3])^(in[3]^(in[8]^in[4])))^((in[3]^(in[8]^in[4]))^((in[8]^in[4])^(in[4]^in[0]))))^(((in[3]^(in[8]^in[4]))^((in[8]^in[4])^(in[4]^in[0])))^(((in[8]^in[4])^(in[4]^in[0]))^((in[4]^in[0])^(in[0]^(in[5]^in[1])))));
        prbs9[2] = (((in[6]^in[2])^(in[2]^(in[7]^in[3])))^((in[2]^(in[7]^in[3]))^((in[7]^in[3])^(in[3]^(in[8]^in[4])))))^(((in[2]^(in[7]^in[3]))^((in[7]^in[3])^(in[3]^(in[8]^in[4]))))^(((in[7]^in[3])^(in[3]^(in[8]^in[4])))^((in[3]^(in[8]^in[4]))^((in[8]^in[4])^(in[4]^in[0])))));
        prbs9[1] = (((in[5]^in[1])^(in[1]^(in[6]^in[2])))^((in[1]^(in[6]^in[2]))^((in[6]^in[2])^(in[2]^(in[7]^in[3])))))^(((in[1]^(in[6]^in[2]))^((in[6]^in[2])^(in[2]^(in[7]^in[3]))))^(((in[6]^in[2])^(in[2]^(in[7]^in[3])))^((in[2]^(in[7]^in[3]))^((in[7]^in[3])^(in[3]^(in[8]^in[4]))))));
        prbs9[0] = (((in[4]^in[0])^(in[0]^(in[5]^in[1])))^((in[0]^(in[5]^in[1]))^((in[5]^in[1])^(in[1]^(in[6]^in[2])))))^(((in[0]^(in[5]^in[1]))^((in[5]^in[1])^(in[1]^(in[6]^in[2]))))^(((in[5]^in[1])^(in[1]^(in[6]^in[2])))^((in[1]^(in[6]^in[2]))^((in[6]^in[2])^(in[2]^(in[7]^in[3]))))));
      end
    endfunction
    
    /**************************************************/
    function [31:0] prbs10;
      input [31:0] in;
      begin
        prbs10[31] = in[9]^in[6];
        prbs10[30] = in[8]^in[5];
        prbs10[29] = in[7]^in[4];
        prbs10[28] = in[6]^in[3];
        prbs10[27] = in[5]^in[2];
        prbs10[26] = in[4]^in[1];
        prbs10[25] = in[3]^in[0];
        prbs10[24] = in[2]^(in[9]^in[6]);
        prbs10[23] = in[1]^(in[8]^in[5]);
        prbs10[22] = in[0]^(in[7]^in[4]);
        prbs10[21] = (in[9]^in[6])^(in[6]^in[3]);
        prbs10[20] = (in[8]^in[5])^(in[5]^in[2]);
        prbs10[19] = (in[7]^in[4])^(in[4]^in[1]);
        prbs10[18] = (in[6]^in[3])^(in[3]^in[0]);
        prbs10[17] = (in[5]^in[2])^(in[2]^(in[9]^in[6]));
        prbs10[16] = (in[4]^in[1])^(in[1]^(in[8]^in[5]));
        prbs10[15] = (in[3]^in[0])^(in[0]^(in[7]^in[4]));
        prbs10[14] = (in[2]^(in[9]^in[6]))^((in[9]^in[6])^(in[6]^in[3]));
        prbs10[13] = (in[1]^(in[8]^in[5]))^((in[8]^in[5])^(in[5]^in[2]));
        prbs10[12] = (in[0]^(in[7]^in[4]))^((in[7]^in[4])^(in[4]^in[1]));
        prbs10[11] = ((in[9]^in[6])^(in[6]^in[3]))^((in[6]^in[3])^(in[3]^in[0]));
        prbs10[10] = ((in[8]^in[5])^(in[5]^in[2]))^((in[5]^in[2])^(in[2]^(in[9]^in[6])));
        prbs10[9] = ((in[7]^in[4])^(in[4]^in[1]))^((in[4]^in[1])^(in[1]^(in[8]^in[5])));
        prbs10[8] = ((in[6]^in[3])^(in[3]^in[0]))^((in[3]^in[0])^(in[0]^(in[7]^in[4])));
        prbs10[7] = ((in[5]^in[2])^(in[2]^(in[9]^in[6])))^((in[2]^(in[9]^in[6]))^((in[9]^in[6])^(in[6]^in[3])));
        prbs10[6] = ((in[4]^in[1])^(in[1]^(in[8]^in[5])))^((in[1]^(in[8]^in[5]))^((in[8]^in[5])^(in[5]^in[2])));
        prbs10[5] = ((in[3]^in[0])^(in[0]^(in[7]^in[4])))^((in[0]^(in[7]^in[4]))^((in[7]^in[4])^(in[4]^in[1])));
        prbs10[4] = ((in[2]^(in[9]^in[6]))^((in[9]^in[6])^(in[6]^in[3])))^(((in[9]^in[6])^(in[6]^in[3]))^((in[6]^in[3])^(in[3]^in[0])));
        prbs10[3] = ((in[1]^(in[8]^in[5]))^((in[8]^in[5])^(in[5]^in[2])))^(((in[8]^in[5])^(in[5]^in[2]))^((in[5]^in[2])^(in[2]^(in[9]^in[6]))));
        prbs10[2] = ((in[0]^(in[7]^in[4]))^((in[7]^in[4])^(in[4]^in[1])))^(((in[7]^in[4])^(in[4]^in[1]))^((in[4]^in[1])^(in[1]^(in[8]^in[5]))));
        prbs10[1] = (((in[9]^in[6])^(in[6]^in[3]))^((in[6]^in[3])^(in[3]^in[0])))^(((in[6]^in[3])^(in[3]^in[0]))^((in[3]^in[0])^(in[0]^(in[7]^in[4]))));
        prbs10[0] = (((in[8]^in[5])^(in[5]^in[2]))^((in[5]^in[2])^(in[2]^(in[9]^in[6]))))^(((in[5]^in[2])^(in[2]^(in[9]^in[6])))^((in[2]^(in[9]^in[6]))^((in[9]^in[6])^(in[6]^in[3]))));
      end
    endfunction
    
    /**************************************************/
    function [31:0] prbs11;
      input [31:0] in;
      begin
        prbs11[31] = in[10] ^ in[ 8];
        prbs11[30] = in[ 9] ^ in[ 7];
        prbs11[29] = in[ 8] ^ in[ 6];
        prbs11[28] = in[ 7] ^ in[ 5];
        prbs11[27] = in[ 6] ^ in[ 4];
        prbs11[26] = in[ 5] ^ in[ 3];
        prbs11[25] = in[ 4] ^ in[ 2];
        prbs11[24] = in[ 3] ^ in[ 1];
        prbs11[23] = in[ 2] ^ in[ 0];
        prbs11[22] = in[ 1] ^ (in[10] ^ in[ 8]);
        prbs11[21] = in[ 0] ^ (in[ 9] ^ in[ 7]);
        prbs11[20] = (in[10] ^ in[ 8]) ^ (in[ 8] ^ in[ 6]);
        prbs11[19] = (in[ 9] ^ in[ 7]) ^ (in[ 7] ^ in[ 5]);
        prbs11[18] = (in[ 8] ^ in[ 6]) ^ (in[ 6] ^ in[ 4]);
        prbs11[17] = (in[ 7] ^ in[ 5]) ^ (in[ 5] ^ in[ 3]);
        prbs11[16] = (in[ 6] ^ in[ 4]) ^ (in[ 4] ^ in[ 2]);
        prbs11[15] = (in[ 5] ^ in[ 3]) ^ (in[ 3] ^ in[ 1]);
        prbs11[14] = (in[ 4] ^ in[ 2]) ^ (in[ 2] ^ in[ 0]);
        prbs11[13] = (in[ 3] ^ in[ 1]) ^ (in[ 1] ^ (in[10] ^ in[ 8]));
        prbs11[12] = (in[ 2] ^ in[ 0]) ^ (in[ 0] ^ (in[ 9] ^ in[ 7]));
        prbs11[11] = (in[ 1] ^ (in[10] ^ in[ 8])) ^ ((in[10] ^ in[ 8]) ^ (in[ 8] ^ in[ 6]));
        prbs11[10] = (in[ 0] ^ (in[ 9] ^ in[ 7])) ^ ((in[ 9] ^ in[ 7]) ^ (in[ 7] ^ in[ 5]));
        prbs11[ 9] = ((in[10] ^ in[ 8]) ^ (in[ 8] ^ in[ 6])) ^ ((in[ 8] ^ in[ 6]) ^ (in[ 6] ^ in[ 4]));
        prbs11[ 8] = ((in[ 9] ^ in[ 7]) ^ (in[ 7] ^ in[ 5])) ^ ((in[ 7] ^ in[ 5]) ^ (in[ 5] ^ in[ 3]));
        prbs11[ 7] = ((in[ 8] ^ in[ 6]) ^ (in[ 6] ^ in[ 4])) ^ ((in[ 6] ^ in[ 4]) ^ (in[ 4] ^ in[ 2]));
        prbs11[ 6] = ((in[ 7] ^ in[ 5]) ^ (in[ 5] ^ in[ 3])) ^ ((in[ 5] ^ in[ 3]) ^ (in[ 3] ^ in[ 1]));
        prbs11[ 5] = ((in[ 6] ^ in[ 4]) ^ (in[ 4] ^ in[ 2])) ^ ((in[ 4] ^ in[ 2]) ^ (in[ 2] ^ in[ 0]));
        prbs11[ 4] = ((in[ 5]^in[3])^(in[3]^in[1]))^((in[3]^ in[1])^(in[1]^(in[10]^in[8])));
        prbs11[ 3] = ((in[4]^in[2])^(in[2]^in[0]))^((in[2]^in[0])^(in[0]^(in[9]^in[7])));
        prbs11[ 2] = ((in[3]^in[1])^(in[1]^(in[10]^in[8])))^((in[1]^(in[10]^in[8]))^((in[10]^in[8])^(in[8]^in[6])));
        prbs11[ 1] = ((in[ 2]^in[0])^(in[0]^(in[9]^in[7])))^((in[0]^(in[9]^in[7]))^((in[9]^in[7])^(in[7]^in[5])));
        prbs11[ 0] = ((in[1]^(in[10]^in[8]))^((in[10]^in[8])^(in[8]^in[6])))^(((in[10]^in[8])^(in[8]^in[6]))^((in[8]^in[6])^(in[6]^in[4])));
      end
    endfunction
    
    /**************************************************/
    function [31:0] prbs15;
      input [31:0] in;
      begin
        prbs15[31] = in[14]^in[13];
        prbs15[30] = in[13]^in[12];
        prbs15[29] = in[12]^in[11];
        prbs15[28] = in[11]^in[10];
        prbs15[27] = in[10]^in[ 9];
        prbs15[26] = in[ 9]^in[ 8];
        prbs15[25] = in[ 8]^in[ 7];
        prbs15[24] = in[ 7]^in[ 6];
        prbs15[23] = in[ 6]^in[ 5];
        prbs15[22] = in[ 5]^in[ 4];
        prbs15[21] = in[ 4]^in[ 3];
        prbs15[20] = in[ 3]^in[ 2];
        prbs15[19] = in[ 2]^in[ 1];
        prbs15[18] = in[ 1]^in[ 0];
        prbs15[17] = in[ 0]^(in[14]^in[13]);
        prbs15[16] = (in[14] ^ in[13]) ^ (in[13] ^ in[12]);
        prbs15[15] = (in[13] ^ in[12]) ^ (in[12] ^ in[11]);
        prbs15[14] = (in[12] ^ in[11]) ^ (in[11] ^ in[10]);
        prbs15[13] = (in[11] ^ in[10]) ^ (in[10] ^ in[ 9]);
        prbs15[12] = (in[10] ^ in[ 9]) ^ (in[ 9] ^ in[ 8]);
        prbs15[11] = (in[ 9] ^ in[ 8]) ^ (in[ 8] ^ in[ 7]);
        prbs15[10] = (in[ 8] ^ in[ 7]) ^ (in[ 7] ^ in[ 6]);
        prbs15[ 9] = (in[ 7] ^ in[ 6]) ^ (in[ 6] ^ in[ 5]);
        prbs15[ 8] = (in[ 6] ^ in[ 5]) ^ (in[ 5] ^ in[ 4]);
        prbs15[ 7] = (in[ 5] ^ in[ 4]) ^ (in[ 4] ^ in[ 3]);
        prbs15[ 6] = (in[ 4] ^ in[ 3]) ^ (in[ 3] ^ in[ 2]);
        prbs15[ 5] = (in[ 3] ^ in[ 2]) ^ (in[ 2] ^ in[ 1]);
        prbs15[ 4] = (in[ 2] ^ in[ 1]) ^ (in[ 1] ^ in[ 0]);
        prbs15[ 3] = (in[ 1] ^ in[ 0]) ^ (in[ 0] ^ (in[14] ^ in[13]));
        prbs15[ 2] = (in[ 0] ^ (in[14] ^ in[13])) ^ ((in[14] ^ in[13]) ^ (in[13] ^ in[12]));
        prbs15[ 1] = ((in[14] ^ in[13]) ^ (in[13] ^ in[12])) ^ ((in[13] ^ in[12]) ^ (in[12] ^ in[11]));
        prbs15[ 0] = ((in[13] ^ in[12]) ^ (in[12] ^ in[11])) ^ ((in[12] ^ in[11]) ^ (in[11] ^ in[10]));
      end
    endfunction
    
    /**************************************************/
    function [31:0] prbs20;
      input [31:0] in;
      begin
        prbs20[31] = in[19] ^ in[16];
        prbs20[30] = in[18] ^ in[15];
        prbs20[29] = in[17] ^ in[14];
        prbs20[28] = in[16] ^ in[13];
        prbs20[27] = in[15] ^ in[12];
        prbs20[26] = in[14] ^ in[11];
        prbs20[25] = in[13] ^ in[10];
        prbs20[24] = in[12] ^ in[09];
        prbs20[23] = in[11] ^ in[08];
        prbs20[22] = in[10] ^ in[07];
        prbs20[21] = in[ 9] ^ in[06];
        prbs20[20] = in[ 8] ^ in[05];
        prbs20[19] = in[ 7] ^ in[04];
        prbs20[18] = in[ 6] ^ in[03];
        prbs20[17] = in[ 5] ^ in[02];
        prbs20[16] = in[ 4] ^ in[01];
        prbs20[15] = in[ 3] ^ in[0];
        prbs20[14] = in[ 2] ^ (in[19] ^ in[16]);
        prbs20[13] = in[ 1] ^ (in[18] ^ in[15]);
        prbs20[12] = in[ 0] ^ (in[17] ^ in[14]);
        prbs20[11] = (in[19] ^ in[16]) ^ (in[16] ^ in[13]);
        prbs20[10] = (in[18] ^ in[15]) ^ (in[15] ^ in[12]);
        prbs20[ 9] = (in[17] ^ in[14]) ^ (in[14] ^ in[11]);
        prbs20[ 8] = (in[16] ^ in[13]) ^ (in[13] ^ in[10]);
        prbs20[ 7] = (in[15] ^ in[12]) ^ (in[12] ^ in[09]);
        prbs20[ 6] = (in[14] ^ in[11]) ^ (in[11] ^ in[08]);
        prbs20[ 5] = (in[13] ^ in[10]) ^ (in[10] ^ in[07]);
        prbs20[ 4] = (in[12] ^ in[ 9]) ^ (in[ 9] ^ in[06]);
        prbs20[ 3] = (in[11] ^ in[ 8]) ^ (in[ 8] ^ in[05]);
        prbs20[ 2] = (in[10] ^ in[ 7]) ^ (in[ 7] ^ in[04]);
        prbs20[ 1] = (in[ 9] ^ in[ 6]) ^ (in[ 6] ^ in[03]);
        prbs20[ 0] = (in[ 8] ^ in[ 5]) ^ (in[ 5] ^ in[02]);
      end
    endfunction
    
    /**************************************************/
    function [31:0] prbs23;
      input [31:0] in;
      begin
        prbs23[31] = in[22] ^ in[17];
        prbs23[30] = in[21] ^ in[16];
        prbs23[29] = in[20] ^ in[15];
        prbs23[28] = in[19] ^ in[14];
        prbs23[27] = in[18] ^ in[13];
        prbs23[26] = in[17] ^ in[12];
        prbs23[25] = in[16] ^ in[11];
        prbs23[24] = in[15] ^ in[10];
        prbs23[23] = in[14] ^ in[ 9];
        prbs23[22] = in[13] ^ in[ 8];
        prbs23[21] = in[12] ^ in[ 7];
        prbs23[20] = in[11] ^ in[ 6];
        prbs23[19] = in[10] ^ in[ 5];
        prbs23[18] = in[ 9] ^ in[ 4];
        prbs23[17] = in[ 8] ^ in[ 3];
        prbs23[16] = in[ 7] ^ in[ 2];
        prbs23[15] = in[ 6] ^ in[ 1];
        prbs23[14] = in[ 5] ^ in[ 0];
        prbs23[13] = in[ 4] ^ (in[22] ^ in[17]);
        prbs23[12] = in[ 3] ^ (in[21] ^ in[16]);
        prbs23[11] = in[ 2] ^ (in[20] ^ in[15]);
        prbs23[10] = in[ 1] ^ (in[19] ^ in[14]);
        prbs23[ 9] = in[ 0] ^ (in[18] ^ in[13]);
        prbs23[ 8] = (in[22] ^ in[17]) ^ (in[17] ^ in[12]);
        prbs23[ 7] = (in[21] ^ in[16]) ^ (in[16] ^ in[11]);
        prbs23[ 6] = (in[20] ^ in[15])^ (in[15] ^ in[10]);
        prbs23[ 5] = (in[19] ^ in[14]) ^ (in[14] ^ in[ 9]);
        prbs23[ 4] = (in[18] ^ in[13]) ^ (in[13] ^ in[ 8]);
        prbs23[ 3] = (in[17] ^ in[12]) ^ (in[12] ^ in[ 7]);
        prbs23[ 2] = (in[16] ^ in[11]) ^ (in[11] ^ in[ 6]);
        prbs23[ 1] = (in[15] ^ in[10])^ (in[10] ^ in[ 5]);
        prbs23[ 0] = (in[14] ^ in[ 9])^ (in[ 9] ^ in[ 4]);
      end
    endfunction
    
    /**************************************************/
    function [31:0] prbs29;
      input [31:0] in;
      begin
        prbs29[31] = in[28] ^ in[26];
        prbs29[30] = in[27] ^ in[25];
        prbs29[29] = in[26] ^ in[24];
        prbs29[28] = in[25] ^ in[23];
        prbs29[27] = in[24] ^ in[22];
        prbs29[26] = in[23] ^ in[21];
        prbs29[25] = in[22] ^ in[20];
        prbs29[24] = in[21] ^ in[19];
        prbs29[23] = in[20] ^ in[18];
        prbs29[22] = in[19] ^ in[17];
        prbs29[21] = in[18] ^ in[16];
        prbs29[20] = in[17] ^ in[15];
        prbs29[19] = in[16] ^ in[14];
        prbs29[18] = in[15] ^ in[13];
        prbs29[17] = in[14] ^ in[12];
        prbs29[16] = in[13] ^ in[11];
        prbs29[15] = in[12] ^ in[10];
        prbs29[14] = in[11] ^ in[09];
        prbs29[13] = in[10] ^ in[08];
        prbs29[12] = in[09] ^ in[07];
        prbs29[11] = in[08] ^ in[06];
        prbs29[10] = in[07] ^ in[05];
        prbs29[ 9] = in[06] ^ in[04];
        prbs29[ 8] = in[05] ^ in[03];
        prbs29[ 7] = in[04] ^ in[02];
        prbs29[ 6] = in[03] ^ in[01];
        prbs29[ 5] = in[02] ^ in[00];
        prbs29[ 4] = in[01] ^ (in[28] ^ in[26]);
        prbs29[ 3] = in[00] ^ (in[27] ^ in[25]);
        prbs29[ 2] = (in[28] ^ in[26]) ^ (in[26] ^ in[24]);
        prbs29[ 1] = (in[27] ^ in[25]) ^ (in[25] ^ in[23]);
        prbs29[ 0] = (in[26] ^ in[24]) ^ (in[24] ^ in[22]);
      end
    endfunction
    
    /**************************************************/
    function [31:0] prbs31;
      input [31:0] in;
      begin
        prbs31[31] = in[30] ^ in[27];
        prbs31[30] = in[29] ^ in[26];
        prbs31[29] = in[28] ^ in[25];
        prbs31[28] = in[27] ^ in[24];
        prbs31[27] = in[26] ^ in[23];
        prbs31[26] = in[25] ^ in[22];
        prbs31[25] = in[24] ^ in[21];
        prbs31[24] = in[23] ^ in[20];
        prbs31[23] = in[22] ^ in[19];
        prbs31[22] = in[21] ^ in[18];
        prbs31[21] = in[20] ^ in[17];
        prbs31[20] = in[19] ^ in[16];
        prbs31[19] = in[18] ^ in[15];
        prbs31[18] = in[17] ^ in[14];
        prbs31[17] = in[16] ^ in[13];
        prbs31[16] = in[15] ^ in[12];
        prbs31[15] = in[14] ^ in[11];
        prbs31[14] = in[13] ^ in[10];
        prbs31[13] = in[12] ^ in[ 9];
        prbs31[12] = in[11] ^ in[ 8];
        prbs31[11] = in[10] ^ in[ 7];
        prbs31[10] = in[ 9] ^ in[ 6];
        prbs31[ 9] = in[ 8] ^ in[ 5];
        prbs31[ 8] = in[ 7] ^ in[ 4];
        prbs31[ 7] = in[ 6] ^ in[ 3];
        prbs31[ 6] = in[ 5] ^ in[ 2];
        prbs31[ 5] = in[ 4] ^ in[ 1];
        prbs31[ 4] = in[ 3] ^ in[ 0];
        prbs31[ 3] = in[ 2] ^ (in[30] ^ in[27]);
        prbs31[ 2] = in[ 1] ^ (in[29] ^ in[26]);
        prbs31[ 1] = in[ 0] ^ (in[28] ^ in[25]);
        prbs31[ 0] = (in[30] ^ in[27]) ^ (in[27] ^ in[24]);
      end
    endfunction
    
    //===================================================
    always @(posedge clock)begin
      if (init)begin
        case (type)
        TYPE_PRBS7 : out <= 32'hfe041851;
        TYPE_PRBS9 : out <= 32'hff83df17;
        TYPE_PRBS10: out <= 32'hffc070fd;
        TYPE_PRBS11: out <= 32'hffe00c07;
        TYPE_PRBS15: out <= 32'hfffe0004;
        TYPE_PRBS20: out <= 32'hfffff000;
        TYPE_PRBS23: out <= 32'hfffffe00;
        TYPE_PRBS29: out <= 32'hfffffff8;
        TYPE_PRBS31: out <= 32'hfffffffe;
        endcase
      end else begin
        case (type)
        TYPE_PRBS7 : out <= prbs7(out);
        TYPE_PRBS9 : out <= prbs9(out);
        TYPE_PRBS10: out <= prbs10(out);
        TYPE_PRBS11: out <= prbs11(out);
        TYPE_PRBS15: out <= prbs15(out);
        TYPE_PRBS20: out <= prbs20(out);
        TYPE_PRBS23: out <= prbs23(out);
        TYPE_PRBS29: out <= prbs29(out);
        TYPE_PRBS31: out <= prbs31(out);
        endcase
      end
    end
endmodule 



