//Listing 12.2
//Author: Pong P. Chu
//Chapter 12
//Page 301
//Copyright 2008

// Single-port RAM with synchronous read
// Modified from XST 8.1 v_rams_07

module xilinx_one_port_ram_sync
    #(
      parameter ADDR_WIDTH = 12,
                DATA_WIDTH = 8
     )
    (
     input wire clk,
     input wire we,
     input wire [ADDR_WIDTH-1:0] addr,
     input wire [DATA_WIDTH-1:0] din,
     output wire [DATA_WIDTH-1:0] dout
    );
    
    // signal declaration
    reg [DATA_WIDTH-1:0] ram [2**ADDR_WIDTH-1:0]
    reg [ADDR_WIDTH-1:0] addr_reg;
    
    // body
    always @(posedge clk)
        begin
            if(we)      // write operation
                ram[addr] <= din;
        addr_reg <= addr;
    end
    
    // read operation
    assign dout = ram[addr_reg];
    
endmodule

/*
    to test HDL RAM inference, sythesize this
    
   xilinx_one_port_ram_sync #(.ADDR_WIDTH(12), .DATA_WIDTH(8)) ram_unit_4k_by_8 (.clk(      clk     ),
                                                                                 .we(       we      ),
                                                                                 .addr(     addr    ),
                                                                                 .din(      din     ),
                                                                                 .dout(     dout    )
                                                                                );
    

*/