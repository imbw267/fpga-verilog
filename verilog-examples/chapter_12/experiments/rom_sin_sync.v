//Listing 12.6.4
//Author: Brian X. Wu
//Chapter 12
//Page 308
//Copyright 2017

module rom_sin_sync
    (
     input wire clk,
     input wire [9:0] addr,
     output wire [7:0] dout         
    );
    
    // signal declaration
    reg [7:0] addr_reg;
    wire [1:0] quadrant;
    always @(posedge clk)
    begin
        if( quadrant[0] == 0)
            addr_reg <= addr[7:0]
        else
            addr_reg <= ~(addr[7:0]);
        
        if( quadrant[1] == 1)
            dout = ~(data) + 1;
        else
            dout = data;
    end
    
    always @*
    begin
        case(addr_reg)
            4'h00: data = 8'b00000000;
            4'h01: data = 8'b00000000;
            4'h02: data = 8'b00000001;
            4'h03: data = 8'b00000010;
            4'h04: data = 8'b00000011;
            4'h05: data = 8'b00000011;
            4'h06: data = 8'b00000100;
            4'h07: data = 8'b00000101;
            4'h08: data = 8'b00000110;
            4'h09: data = 8'b00000111;
            4'h0a: data = 8'b00000111;
            4'h0b: data = 8'b00001000;
            4'h0c: data = 8'b00001001;
            4'h0d: data = 8'b00001010;
            4'h0e: data = 8'b00001010;
            4'h0f: data = 8'b00001011;
            4'h10: data = 8'b00001100;
            4'h11: data = 8'b00001101;
            4'h12: data = 8'b00001110;
            4'h13: data = 8'b00001110;
            4'h14: data = 8'b00001111;
            4'h15: data = 8'b00010000;
            4'h16: data = 8'b00010001;
            4'h17: data = 8'b00010010;
            4'h18: data = 8'b00010010;
            4'h19: data = 8'b00010011;
            4'h1a: data = 8'b00010100;
            4'h1b: data = 8'b00010101;
            4'h1c: data = 8'b00010101;
            4'h1d: data = 8'b00010110;
            4'h1e: data = 8'b00010111;
            4'h1f: data = 8'b00011000;
            4'h20: data = 8'b00011000;
            4'h21: data = 8'b00011001;
            4'h22: data = 8'b00011010;
            4'h23: data = 8'b00011011;
            4'h24: data = 8'b00011100;
            4'h25: data = 8'b00011100;
            4'h26: data = 8'b00011101;
            4'h27: data = 8'b00011110;
            4'h28: data = 8'b00011111;
            4'h29: data = 8'b00011111;
            4'h2a: data = 8'b00100000;
            4'h2b: data = 8'b00100001;
            4'h2c: data = 8'b00100010;
            4'h2d: data = 8'b00100010;
            4'h2e: data = 8'b00100011;
            4'h2f: data = 8'b00100100;
            4'h30: data = 8'b00100101;
            4'h31: data = 8'b00100101;
            4'h32: data = 8'b00100110;
            4'h33: data = 8'b00100111;
            4'h34: data = 8'b00101000;
            4'h35: data = 8'b00101000;
            4'h36: data = 8'b00101001;
            4'h37: data = 8'b00101010;
            4'h38: data = 8'b00101011;
            4'h39: data = 8'b00101011;
            4'h3a: data = 8'b00101100;
            4'h3b: data = 8'b00101101;
            4'h3c: data = 8'b00101110;
            4'h3d: data = 8'b00101110;
            4'h3e: data = 8'b00101111;
            4'h3f: data = 8'b00110000;
            4'h40: data = 8'b00110000;
            4'h41: data = 8'b00110001;
            4'h42: data = 8'b00110010;
            4'h43: data = 8'b00110011;
            4'h44: data = 8'b00110011;
            4'h45: data = 8'b00110100;
            4'h46: data = 8'b00110101;
            4'h47: data = 8'b00110110;
            4'h48: data = 8'b00110110;
            4'h49: data = 8'b00110111;
            4'h4a: data = 8'b00111000;
            4'h4b: data = 8'b00111000;
            4'h4c: data = 8'b00111001;
            4'h4d: data = 8'b00111010;
            4'h4e: data = 8'b00111010;
            4'h4f: data = 8'b00111011;
            4'h50: data = 8'b00111100;
            4'h51: data = 8'b00111101;
            4'h52: data = 8'b00111101;
            4'h53: data = 8'b00111110;
            4'h54: data = 8'b00111111;
            4'h55: data = 8'b00111111;
            4'h56: data = 8'b01000000;
            4'h57: data = 8'b01000001;
            4'h58: data = 8'b01000001;
            4'h59: data = 8'b01000010;
            4'h5a: data = 8'b01000011;
            4'h5b: data = 8'b01000011;
            4'h5c: data = 8'b01000100;
            4'h5d: data = 8'b01000101;
            4'h5e: data = 8'b01000101;
            4'h5f: data = 8'b01000110;
            4'h60: data = 8'b01000111;
            4'h61: data = 8'b01000111;
            4'h62: data = 8'b01001000;
            4'h63: data = 8'b01001001;
            4'h64: data = 8'b01001001;
            4'h65: data = 8'b01001010;
            4'h66: data = 8'b01001010;
            4'h67: data = 8'b01001011;
            4'h68: data = 8'b01001100;
            4'h69: data = 8'b01001100;
            4'h6a: data = 8'b01001101;
            4'h6b: data = 8'b01001110;
            4'h6c: data = 8'b01001110;
            4'h6d: data = 8'b01001111;
            4'h6e: data = 8'b01001111;
            4'h6f: data = 8'b01010000;
            4'h70: data = 8'b01010001;
            4'h71: data = 8'b01010001;
            4'h72: data = 8'b01010010;
            4'h73: data = 8'b01010011;
            4'h74: data = 8'b01010011;
            4'h75: data = 8'b01010100;
            4'h76: data = 8'b01010100;
            4'h77: data = 8'b01010101;
            4'h78: data = 8'b01010101;
            4'h79: data = 8'b01010110;
            4'h7a: data = 8'b01010111;
            4'h7b: data = 8'b01010111;
            4'h7c: data = 8'b01011000;
            4'h7d: data = 8'b01011000;
            4'h7e: data = 8'b01011001;
            4'h7f: data = 8'b01011001;
            4'h80: data = 8'b01011010;
            4'h81: data = 8'b01011011;
            4'h82: data = 8'b01011011;
            4'h83: data = 8'b01011100;
            4'h84: data = 8'b01011100;
            4'h85: data = 8'b01011101;
            4'h86: data = 8'b01011101;
            4'h87: data = 8'b01011110;
            4'h88: data = 8'b01011110;
            4'h89: data = 8'b01011111;
            4'h8a: data = 8'b01011111;
            4'h8b: data = 8'b01100000;
            4'h8c: data = 8'b01100000;
            4'h8d: data = 8'b01100001;
            4'h8e: data = 8'b01100001;
            4'h8f: data = 8'b01100010;
            4'h90: data = 8'b01100010;
            4'h91: data = 8'b01100011;
            4'h92: data = 8'b01100011;
            4'h93: data = 8'b01100100;
            4'h94: data = 8'b01100100;
            4'h95: data = 8'b01100101;
            4'h96: data = 8'b01100101;
            4'h97: data = 8'b01100110;
            4'h98: data = 8'b01100110;
            4'h99: data = 8'b01100111;
            4'h9a: data = 8'b01100111;
            4'h9b: data = 8'b01101000;
            4'h9c: data = 8'b01101000;
            4'h9d: data = 8'b01101001;
            4'h9e: data = 8'b01101001;
            4'h9f: data = 8'b01101001;
            4'ha0: data = 8'b01101010;
            4'ha1: data = 8'b01101010;
            4'ha2: data = 8'b01101011;
            4'ha3: data = 8'b01101011;
            4'ha4: data = 8'b01101100;
            4'ha5: data = 8'b01101100;
            4'ha6: data = 8'b01101100;
            4'ha7: data = 8'b01101101;
            4'ha8: data = 8'b01101101;
            4'ha9: data = 8'b01101110;
            4'haa: data = 8'b01101110;
            4'hab: data = 8'b01101110;
            4'hac: data = 8'b01101111;
            4'had: data = 8'b01101111;
            4'hae: data = 8'b01110000;
            4'haf: data = 8'b01110000;
            4'hb0: data = 8'b01110000;
            4'hb1: data = 8'b01110001;
            4'hb2: data = 8'b01110001;
            4'hb3: data = 8'b01110001;
            4'hb4: data = 8'b01110010;
            4'hb5: data = 8'b01110010;
            4'hb6: data = 8'b01110011;
            4'hb7: data = 8'b01110011;
            4'hb8: data = 8'b01110011;
            4'hb9: data = 8'b01110100;
            4'hba: data = 8'b01110100;
            4'hbb: data = 8'b01110100;
            4'hbc: data = 8'b01110101;
            4'hbd: data = 8'b01110101;
            4'hbe: data = 8'b01110101;
            4'hbf: data = 8'b01110101;
            4'hc0: data = 8'b01110110;
            4'hc1: data = 8'b01110110;
            4'hc2: data = 8'b01110110;
            4'hc3: data = 8'b01110111;
            4'hc4: data = 8'b01110111;
            4'hc5: data = 8'b01110111;
            4'hc6: data = 8'b01110111;
            4'hc7: data = 8'b01111000;
            4'hc8: data = 8'b01111000;
            4'hc9: data = 8'b01111000;
            4'hca: data = 8'b01111001;
            4'hcb: data = 8'b01111001;
            4'hcc: data = 8'b01111001;
            4'hcd: data = 8'b01111001;
            4'hce: data = 8'b01111010;
            4'hcf: data = 8'b01111010;
            4'hd0: data = 8'b01111010;
            4'hd1: data = 8'b01111010;
            4'hd2: data = 8'b01111010;
            4'hd3: data = 8'b01111011;
            4'hd4: data = 8'b01111011;
            4'hd5: data = 8'b01111011;
            4'hd6: data = 8'b01111011;
            4'hd7: data = 8'b01111011;
            4'hd8: data = 8'b01111100;
            4'hd9: data = 8'b01111100;
            4'hda: data = 8'b01111100;
            4'hdb: data = 8'b01111100;
            4'hdc: data = 8'b01111100;
            4'hdd: data = 8'b01111101;
            4'hde: data = 8'b01111101;
            4'hdf: data = 8'b01111101;
            4'he0: data = 8'b01111101;
            4'he1: data = 8'b01111101;
            4'he2: data = 8'b01111101;
            4'he3: data = 8'b01111101;
            4'he4: data = 8'b01111110;
            4'he5: data = 8'b01111110;
            4'he6: data = 8'b01111110;
            4'he7: data = 8'b01111110;
            4'he8: data = 8'b01111110;
            4'he9: data = 8'b01111110;
            4'hea: data = 8'b01111110;
            4'heb: data = 8'b01111110;
            4'hec: data = 8'b01111111;
            4'hed: data = 8'b01111111;
            4'hee: data = 8'b01111111;
            4'hef: data = 8'b01111111;
            4'hf0: data = 8'b01111111;
            4'hf1: data = 8'b01111111;
            4'hf2: data = 8'b01111111;
            4'hf3: data = 8'b01111111;
            4'hf4: data = 8'b01111111;
            4'hf5: data = 8'b01111111;
            4'hf6: data = 8'b01111111;
            4'hf7: data = 8'b01111111;
            4'hf8: data = 8'b01111111;
            4'hf9: data = 8'b01111111;
            4'hfa: data = 8'b01111111;
            4'hfb: data = 8'b01111111;
            4'hfc: data = 8'b01111111;
            4'hfd: data = 8'b01111111;
            4'hfe: data = 8'b01111111;
            4'hff: data = 8'b01111111;
        endcase
    end
    
    assign quadrant = addr[9:8];
    
endmodule