//Listing 7.2
//Author: Pong P. Chu
//Chapter 7
//Page 177
//Copyright 2008


module and_nonblock
    (
     input wire a, b, c,
     output reg y
    );
    
    always @*
    begin                       // y_entry = y
        y <= a;                 // y_exit = a
        y <= y & b;             // y_exit = y_entry & b
        y <= y & c;             // y_exit = y_entry & c
    end                         // y = y_exit
    
endmodule               // and_nonblock