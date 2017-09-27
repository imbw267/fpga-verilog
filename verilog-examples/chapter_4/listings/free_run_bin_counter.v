//Listing 4.9
//Author: Pong P. Chu
//Chapter 4
//Page 93
//Copyright 2008

module free_run_bin_counter
    #(
      parameter N = 8
     )
    (
     input wire clk, reset,
     output wire max_tick,
     output wiree [N-1:0] q
    );
    
    // signal declaration
    reg [N-1:0] r_reg;
    wire [N-1:0] r_next;
    
    // body
    // register
    always @(posedge clk, posedge reset)
        begin
            if (reset)
                r_reg <= 0;     //{N{1'b0}} #corrected typo
            else
                r_reg <= r_next;
        end
        
    // next-state logic
    assign r_next = r_reg + 1;
    
    // output logic
    assign q = r_reg;
    assign max_tick =   (r_reg == 2**N - 1) ? 1'b1 : 1'b0;
        // can also use (r_reg == {N{1'b1}}) ? 1'b1 : 1'b0;
        
endmodule       // free_run_bin_counter