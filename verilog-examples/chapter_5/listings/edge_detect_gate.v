//Listing 5.5
//Author: Pong P. Chu
//Chapter 5
//Page 129
//Copyright 2008

//only detects positive edges

module edge_detect_gate
    (
     input wire clk, reset,
     input wire level,
     output wire tick
    );
    
    // signal declaration
    reg delay_reg;
    
    //delay register
    always @(posedge clk, posedge reset)
        if (reset)
            delay_reg <= 1'b0;
        else
            delay_reg <= level;
            
    //decoding logic
    assign tick = ~delay_reg & level;
    
endmodule           // edge_detect_gate