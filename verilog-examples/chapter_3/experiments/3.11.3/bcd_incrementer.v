//Experiment 3.11.3.1
//Author: Brian X. Wu
//Chapter 3
//Page 81
//Copyright 2008

module bcd_incrementer
    (
     input wire [11:0] bcd_in,
     output reg [11:0] bcd_out,
     output reg overflow
    )
    
    // internal wires
    reg carry2, carry1, carry0;
    wire [3:0] bcd2, bcd1, bcd0;
    reg [3:0] bcdn2, bcdn1, bcdn0;
    
    always @*
    begin
        bcdn0 = (bcd0 == 4'b1001)               ? 0      : bcd0 + 1;
        carry0 = (bcd0 == 4'b1001)              ? 1'b1   : 1'b0;
        
        bcdn1 = ((bcd1 == 4'b1001) & (carry0))  ?   1'b0 :
                 (carry0)                       ?   bcd1 + 1 :
                                                    bcd1;
                                                    
        carry1 = ((bcd1 == 4'b1001) & (carry0)) ?   1'b1 : 1'b0;
        
        bcdn2 =  ((bcd2 == 4'b1001) & (carry1)) ?   1'b0 :
                 (carry1)                       ?   bcd2 + 1 :
                                                    bcd2;
        carry2 = ((bcd2 == 4'b1001) & (carry1)) ?   1'b1 : 1'b0;
        
        
        bcd_out = {bcdn2, bcdn1, bcdn0};
        overflow = carry2;
    end
        
    // assignments
    assign bcd2 = bcd_in[11:8];
    assign bcd1 = bcd_in[7:4];
    assign bcd0 = bcd_in[3:0];
    
endmodule           // bcd_incrementer