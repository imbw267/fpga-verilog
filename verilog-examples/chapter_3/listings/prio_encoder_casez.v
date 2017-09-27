//Listing 3.8
//Author: Pong P. Chu
//Chapter 3
//Page 56
//Copyright 2008

module prio_encoder_casez
    (
     input wire [4:1] r,
     output reg [2:0] y
    );
    
    always @*
        casez(r)
            4'b1???:    y = 3'b100;
            4'b01??:    y = 3'b011;
            4'b001?:    y = 3'b010;
            4'b0001:    y = 3'b001;
            4'b0000:    y = 3'b000;     // default case can also be used
        endcase
        
endmodule // prio_encoder_casez