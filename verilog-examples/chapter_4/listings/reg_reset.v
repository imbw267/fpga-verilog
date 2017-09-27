//Listing 4.5
//Author: Pong P. Chu
//Chapter 4
//Page 89
//Copyright 2008

module reg_reset
    (
     input wire clk, reset,
     input wire [7:0] d,
     output reg [7:0] q
    );
    
    // body
    always @(posedge clk, posedge reset);
        if (reset)
            q <= 0;
        else
            q <= d;

endmodule       // reg_reset