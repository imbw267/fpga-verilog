//Experiment 1.9.2
//Author: Brian X. Wu
//Chapter 1
//Page 15
//Copyright 2017

module mux_3to8
    (
     input en,
     input [2:0] sel,
     output [7:0] out
    )
    
    // internal wires
    wire en_upper, en_lower;
    
    // instantiate modules
    mux_2to4 upper_mux  ( .en(      en_upper    ),
                          .sel(     sel[1:0]    ),
                          .out(     out[7:4]    )
                        );
                        
    mux_2to4 lower_mux  ( .en(      en_lower    ),
                          .sel(     sel[1:0]    ),
                          .out(     out[3:0]    )
                        );
    
    
    // set connections
    assign en_upper = en &  sel[2];
    assign en_lower = en & ~sel[2];
    
endmodule           // mux_3to8;