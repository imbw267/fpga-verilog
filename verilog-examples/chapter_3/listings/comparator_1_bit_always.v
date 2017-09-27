//Listing 3.1
//Author: Pong P. Chu
//Chapter 3
//Page 49
//Copyright 2008

module eq1_always
    (
     input wire i0, i1,
     output reg eq      // eq declared as reg
    );
    
    // p0 and p1 declared as reg
    reg p0, p1;
    
   always @(i0, i1)  // i0 and  i1 must be in sensitivity list
    begin
    // the order of statements is important
    
    p0 = ~i0 & ~i1;
    p1 = i0 & i1;
    eq = p0 | p1;
    
    end
    
    endmodule // eq1_always