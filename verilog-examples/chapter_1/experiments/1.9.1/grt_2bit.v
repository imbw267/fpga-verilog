//Experiment 1.9.1
//Author: Brian X. Wu
//Chapter 1
//Page 14
//Copyright 2017


module grt_2bit
    (
     input [1:0] a, b
     output gt
    );
    
    // internal wires
    wire smallest, middle, largest;
    
    
    assign smallest =  (a[0] & ~b[1] & ~b[0]);
    assign middle = (a[1] & ~b[1]);
    assign largest = (a[1] & a[0] & ~b[0]);
    
    // output
    assign gt = smallest | middle | largest;
    
endmodule       //gt_2bit
    
// Truth table
// return y = 1 when a > b (strict)
//  a[1]    a[0]    b[1]    b[0]    y    
//  0       0       0       0       0
//  0       0       0       1       0
//  0       0       1       0       0
//  0       0       1       1       0
//  0       1       0       0       1    (a[0] & (~b[1] & ~ b[0]))
//  0       1       0       1       0
//  0       1       1       0       0
//  0       1       1       1       0
//  1       0       0       0       1    (a[1] & ~b[1])
//  1       0       0       1       1    (a[1] & ~b[1])
//  1       0       1       0       0
//  1       0       1       1       0
//  1       1       0       0       1    (a[0] & (~b[1] & ~ b[0])), (a[1] & ~b[1]), (a[1] & a[0] & ~b[0])
//  1       1       0       1       1    (a[1] & ~b[1])
//  1       1       1       0       1    (a[1] & a[0] & ~b[0])
//  1       1       1       1       0