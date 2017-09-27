//Listing 7.4
//Author: Pong P. Chu
//Chapter 7
//Page 178
//Copyright 2008

module eq1_nonblock
    (
     input wire i0, i1,
     output reg eq
    );
    
    // internal registers
    
    reg p0, p1;
    
    always @(i0, i1, p0, p1) // p0, p1 are also in sensitivity list
                     // the order of statements is not important
    begin                   // p0_entry = p0, p1_entry = p1;
        p0 <= ~i0 & ~i1;    // p0_exit = ~i0 & ~i1;
        p1 <= i0 & i1;      // p1_exit = i0 & i1;
        eq <= p0 | p1;      // eq_exit = p0_entry | p1_entry
    end                     // eq = eq_exit; p0 = p0_exit; p1 = p1_exit;
    
endmodule           // eq1_nonblock