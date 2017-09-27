//Listing 7.3
//Author: Pong P. Chu
//Chapter 7
//Page 177
//Copyright 2008

module eq1_block
    (
     input wire i0, i1,
     output reg eq
    );
    
    // internal registers
    
    reg p0, p1;
    
    always @(i0, i1) // only i0 and i1 in sensitivity list
                     // the order of statements is important
    begin
        p0 = ~i0 & ~i1;
        p1 = i0 & i1;
        eq = p0 | p1;
    end
    
endmodule               // eq1_block