//Listing 3.2
//Author: Pong P. Chu
//Chapter 3
//Page 50
//Copyright 2008

module and_block_assign
    (
     input wire a,b,c,
     output reg y
    );
    
    always @*
     begin
        y = a;
        y = y & b;
        y = y & c;
     end
     
endmodule // and_block_assign    