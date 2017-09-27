//Listing 10.5
//Author: Pong P. Chu
//Chapter 10
//Page 265
//Copyright 2008

module mouse_led
    (
     input wire clk, reset,
     inout wire ps2d, ps2c,
     output reg [7:0] led
    );
    
    // signal declaration
    reg [9:0] p_reg;
    wire [9:0] p_next;
    wire [8:0] xm;
    wire [2:0] btnm;
    wire m_done_tick;
    
    // body
    // instantiate a mouse interface
    mouse mouse_unit    ( .clk(             clk             ),
                          .reset(           reset           ),
                          .ps2d(            ps2d            ),
                          .ps2c(            ps2c            ),
                          .xm(              xm              ),
                          .ym(                              ),
                          .btnm(            btnm            ),
                          .m_done_tick(     m_done_tick     )
                        );
    
    // counter
    always @ (posedge clk, posedge reset)
    begin
        if (reset)
            p_reg <= 0;
        else
            p_reg <= p_next;
    end
    
    assign p_next = (~m_done_tick)  ?   p_reg   :       // no activity
                    (btnm[0])       ?   10'b0   :       // left button resets it to zero
                    (btnm[1])       ?   10'b3ff :       // right button minimizes it
                    p_reg + {xm[8], xm};                // x_movement
                    
    always @*
    begin
        case(p_reg[9:7])
            3'b000: led = 8'b1000_0000;
            3'b001: led = 8'b0100_0000;
            3'b010: led = 8'b0010_0000;
            3'b011: led = 8'b0001_0000;
            3'b100: led = 8'b0000_1000;
            3'b101: led = 8'b0000_0100;
            3'b110: led = 8'b0000_0010;
            default: led = 8'b0000_0001;
        endcase
    end
    
endmodule               // mouse_led