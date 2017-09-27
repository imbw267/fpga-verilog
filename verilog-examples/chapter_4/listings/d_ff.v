//Listing 4.1
//Author: Pong P. Chu
//Chapter 4
//Page 87
//Copyright 2008

module d_ff
    (
     input wire clk,
     input wire d,
     output reg q
    );
    
    // body 
    always a(posedge clk)
        q <= d;
        
endmodule  // d_ff