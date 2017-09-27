//Listing 5.2
//Author: Pong P. Chu
//Chapter 5
//Page 124
//Copyright 2008

module fsm_eg_2_seg
    (
     input wire clk, reset,
     input wire a, b,
     output reg y0, y1
    );
    
    // symbolic state declaration
    localparam [1:0] s0 = 2'b00,
                     s1 = 2'b01,
                     s2 = 2'b10;
    // signal declataion
    reg [1:0] state_reg, state_next;
    
    // state register
    always @(posedge clk, posedge reset)
        begin
            if (reset)
                state_reg <= 0;
            else
                state_reg <= state_next;
        end
    
    // next-state logic and output logic
    always @*
        begin
            state_next = state_reg;     // default next state : current state
            y1 = 1'b0;                  // default y1 output : 0
            y0 = 1'b0;                  // default y0 output : 0
            case (state_reg)
                s0: begin
                    y1 = 1'b1;
                    if (a)
                        if(b)
                            begin
                                state_next = s2;
                                y0 = 1'b1;
                            end
                        else
                            state_next = s1;
                    end
                s1: begin
                    y1 = 1'b1;
                    if (a)
                        state_next = s0;
                    end
                s2: state_next = s0;
                default: state_next = s0;
            endcase
        end
        
endmodule           //fsm_eg_2_seg