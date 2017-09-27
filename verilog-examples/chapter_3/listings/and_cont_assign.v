//Listing 3.3
//Author: Pong P. Chu
//Chapter 3
//Page 51
//Copyright 2008

module and_cont_assign          // incorrect code for a reduced and circuit
    (
     input wire a,b,c,
     output reg y
    );
    
    assign y = a;
    assign y = y & b;
    assign y = y & c;
     
endmodule // and_cont_assign    