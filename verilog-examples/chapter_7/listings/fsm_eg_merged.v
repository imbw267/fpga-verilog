//Listing 7.10
//Author: Pong P. Chu
//Chapter 7
//Page 185
//Copyright 2008

module fsm_eg_merged
    (
     input wire clk, reset,
     input wire a, b,
     output wire y0, y1
    );
    
    // symbolic state declaration
    localparam [1:0] s0 = 2'b00,
                    s1 = 2'b01,
                    s2 = 2'b10;
                    
    // signal declaration
    reg [1:0] state_reg;
    
    // state register and next-state logic
    always @(posedge clk, posedge reset)
    begin
        if (reset)
            state_reg <= s0;
        else
        begin
            case (state_reg)
                s0:  if (a)
                        if(b)
                            state_reg <= s2;
                        else
                            state_reg <= s1;
                     else
                        state_reg = s0;
                s1:  if (a)
                        state_reg <= s0;
                     else
                        state_reg <= s1;
                s2: 
                    state_reg <= s0;
                default:
                    state_reg <= s0;
            endcase
        end
    end
    
    // Moore output logic
    assign y1 = (state_reg == s0) || (state_reg == s1);
    
    // Mealy output logic
    assign y0 = (state_reg == s0) & a & b;
    
endmodule           // fsm_eg_merged