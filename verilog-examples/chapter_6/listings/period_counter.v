//Listing 6.7
//Author: Pong P. Chu
//Chapter 6
//Page 164
//Copyright 2008

module period_counter
    (
     input wire clk, reset,
     input wire start, si,          // si -> signal input
     output reg ready, done_tick,
     output wire [9:0] prd          //period
    );
   
    // symbolic state declaration
    localparam [1:0]
        idle    = 2'b00,
        waiting = 2'b01,
        count   = 2'b10,
        done    = 2'b11;
    
    // constant declaration
    localparam CLK_MS_COUNT = 50_000;       // With a 50 MHz clock, corresponds to a 1 ms tick
    
    // signal declaration
    reg [1:0] state_reg, state_next;
    reg [15:0]  t_reg, t_next;          // N is log(50_000)-1
    reg [9:0] p_reg, p_next;            // up to 1 sec
    reg delay_reg;
    wire edg;
    
    // body
    // FSMD state & data registers
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            begin
                state_reg <= idle;
                t_reg <= 0;
                p_reg <= 0;
                delay_reg <= 0;
            end
        else
            begin
                state_reg <= state_next;
                t_reg <= t_next;
                p_reg <= p_next;
                delay_reg <= si;
            end
    end
    
    // rising-edge tick
    assign edg = ~delay_reg & si;
    
    // FSMD next-state logic
    always @*
    begin
        state_next = state_reg;
        ready = 1'b0;
        done_tick = 1'b0;
        p_next = p_reg;
        t_next = t_reg;
        case (state_reg)
            idle:
                begin
                    ready = 1'b1;
                    if (start)
                        state_next = waiting;
                end
            waiting:    // wait for the first edge
                if (edg)
                    begin
                        state_next = count;
                        t_next = 0;
                        p_next = 0;
                    end
            count:
                begin
                    if (edg)        // 2nd edge arrived
                        state_next = done;
                    else
                    begin
                        if (t_reg == CLK_MS_COUNT - 1)  // 1 ms tick
                            begin
                                t_next = 0;
                                p_next = p_reg + 1;
                            end
                        else
                            t_next = t_reg + 1;
                    end
                end         
            done:
                begin
                    done_tick = 1'b1;
                    state_next = idle;
                end
            default:
                state_next = idle;
        endcase
    end
    
    // output
    assign prd = p_reg;
    
endmodule       // period_counter