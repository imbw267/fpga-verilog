//Listing 1.1
//Author: Pong P. Chu
//Chapter 1
//Page 2
//Copyright 2008

module eq1
    //IO ports
    (
        input wire i0, i1,
        output wire eq
    );
     
    //Signal Declarations
    wire p0, p1;
    
    //body
    //sum of two product terms
    assign eq = p0 | p1;
    //product terms
    assign p0 = ~i0 & ~i1;
    assign p1 = i0 & i1;
    
endmodule
    