//Experiment 3.11.2.1
//Author: Brian X. Wu
//Chapter 3
//Page 80
//Copyright 2008

module priority_encoder_12bit
    (
     input en,
     input [11:0] req,
     output reg [3:0] first, second
    );
    
    // internal wires
    wire [11:0] req2;
    
    assign req2 = (first == 3'b0000) ?  12'b0 : req ^ (12'b1 << (first - 1));
        
    // find highest
    always @*
    begin
        casez(req)
            12'b1???????????:   first = 3'b1100;
            12'b01??????????:   first = 3'b1011;
            12'b001?????????:   first = 3'b1010;
            12'b0001????????:   first = 3'b1001;
            12'b00001???????:   first = 3'b1000;
            12'b000001??????:   first = 3'b0111;
            12'b0000001?????:   first = 3'b0110;
            12'b00000001????:   first = 3'b0101;
            12'b000000001???:   first = 3'b0100;
            12'b0000000001??:   first = 3'b0011;
            12'b00000000001?:   first = 3'b0010;
            12'b000000000001:   first = 3'b0001;
            default:   first = 3'b0000;
        endcase
        
        casez(req2)
            12'b1???????????:   second = 3'b1100;
            12'b01??????????:   second = 3'b1011;
            12'b001?????????:   second = 3'b1010;
            12'b0001????????:   second = 3'b1001;
            12'b00001???????:   second = 3'b1000;
            12'b000001??????:   second = 3'b0111;
            12'b0000001?????:   second = 3'b0110;
            12'b00000001????:   second = 3'b0101;
            12'b000000001???:   second = 3'b0100;
            12'b0000000001??:   second = 3'b0011;
            12'b00000000001?:   second = 3'b0010;
            12'b000000000001:   second = 3'b0001;
            default:   second = 3'b0000;
        endcase
    end
    
endmodule           // priority_encoder_12_bit