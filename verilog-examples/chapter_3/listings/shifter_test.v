//Listing 3.20
//Author: Pong P. Chu
//Chapter 3
//Page 75
//Copyright 2008

module shifter_test
    (
     input wire [2:0] btn,
     input wire [7:0] sw,
     output wire [7:0] led
    );
    
    // instantiate shifter
    barrel_shifter_stage shift_unit (.a(sw), .amt(btn), .y(led));
    
endmodule // shifter_test