//Experiment 1.9.2
//Author: Brian X. Wu
//Chapter 1
//Page 15
//Copyright 2017

module mux_4to16
    (
     input en,
     input [3:0] sel,
     output [15:0] out
    );
    
    // internal signals
    wire [3:0] en_mux;
    
    // instantiate modules
    mux_2to4 sel_mux( .en(      en          ),
                      .sel(     sel[3:2]    ),
                      .out(     en_mux      )
                    );
    
    mux_2to4 mux3   ( .en(      en_mux[3]   ),
                      .sel(     sel[1:0]    ),
                      .out(     out[15:12]  )
                    );
                    
    mux_2to4 mux2   ( .en(      en_mux[2]   ),
                      .sel(     sel[1:0]    ),
                      .out(     out[11:8]  )
                    );
                    
    mux_2to4 mux1   ( .en(      en_mux[1]   ),
                      .sel(     sel[1:0]    ),
                      .out(     out[7:4]  )
                    );
                    
    mux_2to4 mux0   ( .en(      en_mux[0]   ),
                      .sel(     sel[1:0]    ),
                      .out(     out[3:0]  )
                    );                    
    
endmodule       // mux_4to16
    