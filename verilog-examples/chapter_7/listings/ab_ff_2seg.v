//Listing 7.5
//Author: Pong P. Chu
//Chapter 7
//Page 180
//Copyright 2008

module ab_ff_2seg
    (
     input wire clk,
     input wire a, b,
     output reg q
    );
    
    reg q_next;
    
    // D FF
    always @(posedge clk)
        q <= q_next;
    
    // cominational circuit
    always @*
        q_next = a & b;
        
endmodule                   // ab_ff_2seg