//Experiment 1.9.2
//Author: Brian X. Wu
//Chapter 1
//Page 14
//Copyright 2017

module mux_2to4
    (
     input en,
     input [1:0] sel,
     output [3:0] out
    );
    
    // outputs
    assign out[3] = en & ( sel[1] &  sel[0]);
    assign out[2] = en & ( sel[1] & ~sel[0]);
    assign out[1] = en & (~sel[1] &  sel[0]);
    assign out[0] = en & (~sel[1] & ~sel[0]);
    
endmodule           // mux_2to4
// Logic table
//  sel[1]  sel[0]      en  out[3]  out[2]  out[1]  out[0]
//
//      x       x       0   0       0       0       0
//      0       0       1   0       0       0       1
//      0       1       1   0       0       1       0
//      1       0       1   0       1       0       0
//      1       1       1   1       0       0       0
    