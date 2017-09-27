//Listing 4.2
//Author: Pong P. Chu
//Chapter 4
//Page 87
//Copyright 2008

module d_ff_reset
    (
     input wire clk, reset,
     input wire d,
     output reg q
    );
    
    // body
    always @(posedge clk, posedge reset)
        if(reset)
            q <= 1'b0;
        else
            q <= d;
            
endmodule    // d_ff_reset