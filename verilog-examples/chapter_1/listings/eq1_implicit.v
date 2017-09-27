//Listing 1.2
//Author: Pong P. Chu
//Chapter 1
//Page 8
//Copyright 2008

module eq1_implicit
    (
     input i0, i1,
     output eq
     );
     
     // no internal signal declaration
     
     // product terms must be placed in front
     assign p0 = ~i0 & ~i1;
     assign p1 = i0 & i1;
     // sum of two product terms
     assign eq = p0 | p1;
     
endmodule;  // eq1_implicit
     