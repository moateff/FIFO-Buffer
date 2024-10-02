`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2024 01:19:21 AM
// Design Name: 
// Module Name: FIFO_tb
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


module FWFT_FIFO_tb(
);

    // Parameters
    localparam ADDR_WIDTH = 4;
    localparam DATA_WIDTH = 8;

    // Clock and reset
    logic clk;
    logic reset;

    // Signals for FIFO operations
    logic rd, wr;
    logic [DATA_WIDTH-1:0] w_data;  // Data to be written
    logic [DATA_WIDTH-1:0] r_data;  // Data read from FIFO
    logic empty, full;              // FIFO status signals
    
    // Instantiate the FIFO module
    Standard_FIFO #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) uut (
        .clk(clk),
        .reset(reset),
        .rd(rd),
        .wr(wr),
        .w_data(w_data),
        .r_data(r_data),
        .empty(empty),
        .full(full)
    );
    /*
    fifo_generator_0 your_instance_name (
      .clk(clk),      // input wire clk
      .srst(reset),    // input wire srst
      .din(w_data),      // input wire [7 : 0] din
      .wr_en(wr),       // input wire wr_en
      .rd_en(rd),       // input wire rd_en
      .dout(r_data),    // output wire [7 : 0] dout
      .full(full),    // output wire full
      .empty(empty)  // output wire empty
    );
    */
    // Clock generation
    always #5 clk = ~clk;

    // Test procedure
    initial 
    begin
        // Initialize signals
        clk = 0;
        reset = 1;
        rd = 0;
        wr = 0;
        w_data = 8'b0;

        // Reset the FIFO
        #10 reset = 0;

        // Write some data into FIFO
        #10 wr = 1; w_data = 8'h1; // Write 0xAA
        #10 wr = 0;

        #10 wr = 1; w_data = 8'h2; // Write 0xBB
        #10 wr = 0;

        #10 wr = 1; w_data = 8'h3; // Write 0xCC
        #10 wr = 0;

        #10 wr = 1; w_data = 8'h4; // Write 0xDD
        #10 wr = 0;
        
        #10 wr = 1; w_data = 8'h5; // Write 0xFF
        #10 wr = 0;

        #10 wr = 1; w_data = 8'h6; // Write 0x1
        #10 wr = 0;

        #10 wr = 1; w_data = 8'h7; // Write 0x2
        #10 wr = 0;

        #10 wr = 1; w_data = 8'h8; // Write 0x3
        #10 wr = 0;
        
        #10 wr = 1; w_data = 8'h9;  // Write 0x4
        #10 wr = 0;
        
        #10 wr = 1; w_data = 8'h10; // Write 0xCC
        #10 wr = 0;

        #10 wr = 1; w_data = 8'h11; // Write 0xDD
        #10 wr = 0;
        
        #10 wr = 1; w_data = 8'h12; // Write 0xFF
        #10 wr = 0;

        #10 wr = 1; w_data = 8'h13; // Write 0x1
        #10 wr = 0;

        #10 wr = 1; w_data = 8'h14; // Write 0x2
        #10 wr = 0;

        #10 wr = 1; w_data = 8'h15; // Write 0x3
        #10 wr = 0;
        
        #10 wr = 1; w_data = 8'h16;  // Write 0x4
        #10 wr = 0;
        /*        
        // Read the data back from FIFO
        #10 rd = 1;
        #10 rd = 0;
        
        #10 wr = 1; w_data = 8'h4;  // Write 0x4
        #10 wr = 0;
        */      
        #10 rd = 1;
        #10 rd = 0;

        #10 rd = 1;
        #10 rd = 0;

        #10 rd = 1;
        #10 rd = 0;
        
        #10 rd = 1;
        #10 rd = 0;

        #10 rd = 1;
        #10 rd = 0;

        #10 rd = 1;
        #10 rd = 0;
        
        #10 rd = 1;
        #10 rd = 0;
        
        #10 rd = 1;
        #10 rd = 0;
        
        #10 rd = 1;
        #10 rd = 0;
        
        #10 rd = 1;
        #10 rd = 0;
        
        #10 rd = 1;
        #10 rd = 0;

        #10 rd = 1;
        #10 rd = 0;

        #10 rd = 1;
        #10 rd = 0;
        
        #10 rd = 1;
        #10 rd = 0;
        
        #10 rd = 1;
        #10 rd = 0;
        
        #10 rd = 1;
        #10 rd = 0;
        
        #10 rd = 1;
        #10 rd = 0;
                
        // Write some data into FIFO
        #10 wr = 1; w_data = 8'h17; // Write 0x5
        #10 wr = 0;

        #10 wr = 1; w_data = 8'h18; // Write 0x6
        #10 wr = 0;
        
        #10 rd = 1;
        #10 rd = 0;
        
        #10 rd = 1;
        #10 rd = 0;
        
        #10 rd = 1;
        #10 rd = 0;
        
        // Write some data into FIFO
        #10 wr = 1; rd = 1; w_data = 8'h19; // Write 0x7 and read
        #10 wr = 0; rd = 0;
        
        #10 rd = 1;
        #10 rd = 0;
                               
        // Check FIFO status (should be empty now)
        #10 if (empty) $display("FIFO is empty as expected.");
        
        // End of simulation
        $stop;
    end

    // Monitor values
    initial 
    begin
        $monitor("Time=%0t | wr=%b | rd=%b | w_data=0x%h | r_data=0x%h | empty=%b | full=%b", 
                 $time, wr, rd, w_data, r_data, empty, full);
    end

endmodule

