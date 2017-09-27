//Listing 5.4
//Author: Pong P. Chu
//Chapter 5
//Page 127
//Copyright 2008


// only detects positive edges
module edge_detect_mealy
    (
     input wire clk, reset,
     input wire level,
     output reg tick
    );
    
    // symbolic state declaration
    localparam zero = 1'b0, 
               one  = 1'b1;
    
    // signal declaration
    reg state_reg, state_next;
    
    // state register
    always @(posedge clk, posedge reset)
        if (reset)
            state_reg <= zero;
        else
            state_reg <= state_next;
    
    // next-state logic and output logic
    always @*    
        begin
            state_next = state_reg;         // default state : the same
            tick = 1'b0;                    // default output : 0
            case (state_reg)
                zero:
                    if (level)
                        begin
                            tick=1'b1;
                            state_next = one;
                        end
                one:
                    if (~level)
                        begin
                            state_next = zero;
                        end
                default:
                    state_next = zero;
            endcase
        end
        
endmodule           // edge_detect_mealy