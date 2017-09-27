//Listing 7.1
//Author: Pong P. Chu
//Chapter 7
//Page 176
//Copyright 2008


module and_block
    (
     input wire a, b, c,
     output reg y
    );
    
    always @*
    begin 
        y = a;              // y = a
        y = y & b;          // y = a & b
        y = y & c;          // y = a & b & c
    end                     // y = a & b & c
    
endmodule                   // and_block