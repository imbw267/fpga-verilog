//Listing 1.6
//Author: Pong P. Chu
//Chapter 1
//Page 11
//Copyright 2008

primitive eq1_udp(eq, i0, i1);
    output eq;
    input i0, i1;
    
    table
    //  i0  i1  :   eq
        0   0   :   1;
        0   1   :   0;
        1   0   :   0;
        1   1   :   1;
    endtable
    
 
endprimitive;  // eq1_udp
