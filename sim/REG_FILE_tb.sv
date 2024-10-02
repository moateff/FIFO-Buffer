`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2024 08:08:23 PM
// Design Name: 
// Module Name: REG_FILE_tb
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


module REG_FILE_tb(
);
    
    // Parameters
    parameter ADDR_WIDTH = 3;
    parameter DATA_WIDTH = 8;
  
    // Inputs
    logic                    clk;
    logic                    w_en;
    logic [ADDR_WIDTH - 1:0] r_addr;
    logic [ADDR_WIDTH - 1:0] w_addr;
    logic [DATA_WIDTH - 1:0] w_data;

    // Outputs
    logic [DATA_WIDTH - 1:0] r_data;

    // Instantiate the Unit Under Test (UUT)
    REG_FILE #(ADDR_WIDTH, DATA_WIDTH) uut (
        .clk(clk),
        .w_en(w_en),
        .r_addr(r_addr),
        .w_addr(w_addr),
        .w_data(w_data),
        .r_data(r_data)
     );

    // Clock generation
    always #5 clk = ~clk;  // Clock period of 10 time units
  
    initial 
    begin
        // Initialize inputs
        clk = 0;
        w_en = 0;
        r_addr = 0;
        w_addr = 0;
        w_data = 0;

        // Test 1: Write data to address 0 and read back
        #10;
        w_en = 1;
        w_addr = 3'b000;
        w_data = 8'hAA;  // Write value 0xAA to address 0
        #10;
        w_en = 0;
        r_addr = 3'b000;  // Read from address 0
        #10;
    
        // Test 2: Write data to address 1 and read back
        w_en = 1;
        w_addr = 3'b001;
        w_data = 8'hBB;  // Write value 0xBB to address 1
        #10;
        w_en = 0;
        r_addr = 3'b001;  // Read from address 1
        #10;
    
        // Test 3: Write data to address 2 and read back
        w_en = 1;
        w_addr = 3'b010;
        w_data = 8'hCC;  // Write value 0xCC to address 2
        #10;
        w_en = 0;
        r_addr = 3'b010;  // Read from address 2
        #10;
    
        // Test 4: Check the register contents are retained
        r_addr = 3'b000;  // Read from address 0
        #10;
        r_addr = 3'b001;  // Read from address 1
        #10;
        r_addr = 3'b010;  // Read from address 2
        #10;

        // End of simulation
        $stop;
  end
  
endmodule

