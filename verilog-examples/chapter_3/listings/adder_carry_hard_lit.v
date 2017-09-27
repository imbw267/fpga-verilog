//Listing 3.9
//Author: Pong P. Chu
//Chapter 3
//Page 64
//Copyright 2008

module adder_carry_hard_lit
    (
     input wire [3:0] a, b,
     output wire [3:0] sum,
     output wire cout       // carry-out
    );
    
    // signal declaration
    wire [4:0] sum_ext;
    
    // body
    assign sum_ext = {1'b0, a} + {1'b0, b};
    assign sum = sum_ext[3:0];
    assign cout = sum_ext[4];
    
endmodule  // adder_carry_hard_lit