//Listing 7.7
//Author: Pong P. Chu
//Chapter 7
//Page 183
//Copyright 2008

module bin_counter_merge
    #(
      parameter N = 8
     )
    (
     input wire clk, reset,
     output wire max_tick,
     output wire [N-1:0] q
    );
    
    // signal declaration
    reg [N-1:0] r_next, r_reg;
    
    // body
    // register and next-state logic
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            r_reg <= 0;
        else
            begin
                // next-state logic
                r_next = r_reg + 1;
                // register
                r_reg <= r_next;
            end
    end
    // output logic
    assign r = r_reg;
    assign max_tick = (r_reg == 2**N - 1) ? 1'b1 : 1'b0;
    
endmodule           // bin_counter_merge