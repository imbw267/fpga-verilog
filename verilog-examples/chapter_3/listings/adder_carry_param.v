//Listing 3.11
//Author: Pong P. Chu
//Chapter 3
//Page 65
//Copyright 2008

module adder_carry_param
    #( parameter N=4 )
    (
     input wire [N-1:0] a, b,
     output wire [N-1:0] sum,
     output wire cout       // carry-out
    );
    
    // constant declaration
    local param N1 = N-1;
    
    // signal declaration
    
    wire [N:0] sum_ext;
    
    // body
    assign sum_ext = {1'b0, a} + {1'b0, b};
    assign sum  = sum_ext[N1:0];
    assign cout = sum_ext[N];
    
endmodule // adder_carry_param