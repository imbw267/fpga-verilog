//Experiment 1.9.1
//Author: Brian X. Wu
//Chapter 1
//Page 14
//Copyright 2017

module gt_4bit
    (
     input wire [3:0] a, b,
     output gt
    );
    
    // internal wires
    wire gt1, gt0;      // corresponding if a[3:2] > b[3:2] and a[1:0] > b[1:0] respectively
    wire eq1;      // corresponding if a[3:2] == b[3:2] 
    
    // instantiate units
    grt_2bit gt_upper_unit  ( .a(   a[3:2]  ), 
                              .b(   b[3:2]  ), 
                              .gt(  gt1     )
                            ); 
    
    grt_2bit gt_lower_unit  ( .a(   a[1:0]  ), 
                              .b(   b[1:0]  ), 
                              .gt(  gt0     )
                            );
                            
    eq2 eq_upper_unit       ( .a(   a[3:2]  ),
                              .b(   b[3:2]  ),
                              .aeqb(eq1     )
                            );
                            

                            
    assign gt = ( gt1 )         ?   1'b1 :
                ( eq1 & gt0 )   ?   1'b1 :
                                    0'b0 ;
endmodule           // gt_4bit
                
// Logic table
// gt1      gt0     eq1     eq0     y
//  0       0       0       0       0
//  0       0       0       1       0
//  0       0       1       0       0
//  0       0       1       1       0
//  0       1       0       0       0
//  0       1       0       1       0
//  0       1       1       0       1
//  0       1       1       1       1 // impossible state
//  1       0       0       0       1
//  1       0       0       1       1
//  1       0       1       0       1 // impossible state
//  1       0       1       1       1 // impossible state
//  1       1       0       0       1
//  1       1       0       1       1 // impossible state
//  1       1       1       0       1 // impossible state
//  1       1       1       1       1 // impossible state