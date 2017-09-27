//Listing 7.16
//Author: Pong P. Chu
//Chapter 7
//Page 203
//Copyright 2008

module eq2_function
    (
     input wire [1:0] a, b,
     output reg aeqb
    );
    
    reg e0, e1;
    
    always @*
        begin
            #2 e0 = equ_fnc(a[0], b[0]);
            #2 e1 = equ_fnc(a[1], b[1]);
            aeqb = e0 & e1;
        end
        
    // function declaration
    function equ_fnc(input i0, i1);
        begin
            equ_fnc = (~i0 & ~i1) | (i0 & i1);
        end
    endfunction
    
endmodule           // eq2_function
    