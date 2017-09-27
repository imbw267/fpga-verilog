//Listing 4.11
//Author: Pong P. Chu
//Chapter 4
//Page 95
//Copyright 2008

module mod_m_counter
    #(
      parameter N=4,        // number of bits in counter, recommend using a function to determine
      parameter M=10,       // mod-M
     )
    (
     input wire clk, reset,
     output wire max_tick,
     output wire [N-1:0] q
    )
    
    // signal declaration
    reg [N-1:0] r_reg;
    wire [N-1:0] r_next;
    
    // body
    // register
    always @(posedge clk, posedge reset)
        begin
            if(reset)
                r_reg <= 0;
            else
                r_reg <= r_next;
        end
    
    // next-state logic
    assign r_next = (r_reg == (M - 1)) ? 0 : r_reg + 1;
    
    // output logic
    assign q = r_reg;
    assign max_tick = (r_reg == (M - 1)) ? 1'b1 : 1'b0;
    
endmodule   // mod_m_counter