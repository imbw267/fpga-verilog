//Listing 12.4
//Author: Pong P. Chu
//Chapter 12
//Page 305
//Copyright 2008

module rom_template
    (
     input wire [3:0] addr,
     output wire [6:0] data         // edited from 7
    );
    
    // body
    always @*
    begin
        case(addr)                      // 0 enables the led
            4'h0: data = 7'b000_0000;
            4'h1: data = 7'b100_1111;
            4'h2: data = 7'b001_0010;
            4'h3: data = 7'b000_0110;
            4'h4: data = 7'b100_1100;
            4'h5: data = 7'b010_0100;
            4'h6: data = 7'b010_0000;
            4'h7: data = 7'b000_1111;
            4'h8: data = 7'b000_0000;
            4'h9: data = 7'b000_0100;
            4'ha: data = 7'b000_1000;
            4'hb: data = 7'b110_0000;
            4'hc: data = 7'b011_0001;
            4'hd: data = 7'b100_0010;
            4'he: data = 7'b011_0000;
            4'hf: data = 7'b011_1000;
        endcase
    end
    
endmodule