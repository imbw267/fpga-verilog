//Listing 13.5
//Author: Pong P. Chu
//Chapter 13
//Page 327
//Copyright 2008

module pong_graph_animate
    (
     input wire clk, reset,
     input wire video_on,
     input wire [1:0] btn,
     input wire [9:0] pix_x, pix_y,
     output reg [2:0] graph_rgb
    );
    
    // constant and signal declaration
    // x,y coordinates (0,0) to (639, 479)
    
    localparam MAX_X = 640;
    localparam MAX_Y = 480;
    wire refr_tick;
    
    //---------------------------------------
    // 
    //---------------------------------------
    
    
    //---------------------------------------
    // Vertical strip as wall
    //---------------------------------------
    // wall left, right boundary
    localparam WALL_X_L = 32;
    localparam WALL_X_R = 35;
    
    
    //---------------------------------------
    // Right vertical bar
    //---------------------------------------
    // bar left, right boundary
    localparam BAR_X_L = 600;
    localparam BAR_X_R = 603;
    // bar top, bottom boundary
    wire [9:0] bar_y_t, bar_y_b;
    localparam BAR_Y_SIZE = 72;
    // register to track top boundary (x-position is fixed)
    reg [9:0] bar_y_reg, bar_y_next;
    
    // bar moving velocity when a button is pressed (per refresh cycle)
    localparam BAR_V = 4;
    
    
    //---------------------------------------
    // square ball
    //---------------------------------------
    localparam BALL_SIZE = 8;
    // ball left, right boundary
    wire [9:0] ball_x_l, ball_x_r;
    // ball top, bottom boundary
    wire [9:0] ball_y_t, ball_y_b;
    
    // reg to track ball left, top position
    reg [9:0] ball_x_reg, ball_y_reg;
    wire [9:0] ball_x_next, ball_y_next;
    
    // reg to track ball speed
    reg [9:0] x_delta_reg, x_delta_next;
    reg [9:0] y_delta_reg, y_delta_next;
    // ball_velocity , can be positive or negative
    localparam BALL_V_P = 2;
    localparam BALL_V_N = -2;
    
    
    //---------------------------------------
    // Round ball
    //---------------------------------------
    wire [2:0] rom_addr, rom_col;
    reg [7:0] rom_data;
    wire rom_bit;
    
    
    //---------------------------------------
    // object output signals
    //---------------------------------------
    wire wall_on, bar_on, sq_ball_on, rd_ball_on;
    wire [2:0] wall_rgb, bar_rgb, ball_rgb;
    
    // body
    
    //---------------------------------------
    // round ball image ROM
    //---------------------------------------
    always @*
        begin
        case (rom_addr)
            3'h0:   rom_data = 8'b00111100; //   ****  
            3'h1:   rom_data = 8'b01111110; //  ******  
            3'h2:   rom_data = 8'b11111111; // ********  
            3'h3:   rom_data = 8'b11111111; // ********
            3'h4:   rom_data = 8'b11111111; // ********
            3'h5:   rom_data = 8'b11111111; // ********
            3'h6:   rom_data = 8'b01111110; //  ****** 
            3'h7:   rom_data = 8'b00111100; //   ****  
        endcase
        end
        
    // registers
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            begin
                bar_y_reg <= 0;
                ball_x_reg <= 0;
                ball_y_reg <= 0;
                x_delta_reg <= 10'h004;
                y_delta_Reg <= 10'h004;
            end
        else
            begin
                bar_y_reg <= bar_y_next;
                ball_x_reg <= ball_x_next;
                ball_y_reg <= ball_y_next;
                x_delta_reg <= x_delta_next;
                y_delta_reg <= y_delta_next;
            end
    end
    
    //  ref_tick: 1-clock tick asseted at the start of v_sync
    //  i.e when the screen is refreshed (~60Hz)
    
    assign refr_tick = (pix_y == 481) && (pix_x==0);
    
    //---------------------------------------
    // (wall vertical strip
    //---------------------------------------
    // pixel within wall
    assign wall_on = (WALL_X_L <= pix_x) && (pix_x <= WALL_X_R);
    // wall rgb output
    assign wall_rgb = 3'b001;       // blue
    
        
    //---------------------------------------
    // right vertical bar
    //---------------------------------------
    // boundary
    assign bar_y_t = bar_y_reg;
    assign bar_y_b = bar_y_reg+BAR_Y_SIZE+1;
    assign bar_on = (BAR_X_L <= pix_x) && (pix_x <= BAR_X_R) && (bar_y_t <= pix_y) && (pix_y <= (bar_y_b);
    // bar rgb output
    assign bar_rgb = 3'b010;        // green
    // new bar_y position
    
    always @*
        begin
            bar_y_next = bar_y_reg;     // default state is no move
            if (refr_tick)
                if (btn[1] & (bar_y_b < (MAX_Y-1-BAR_V)))       // move down
                    bar_y_next = bar_y_reg + BAR_V; 
                else if (btn[0] & (bar_y_b > BAR_V))            // move up
                    bar_y_next = bar_y_reg - BAR_V;
        end
    
        
    //---------------------------------------
    // square ball
    //---------------------------------------
    // boundary
    assign ball_x_l = ball_x_reg;
    assign ball_x_r = ball_x_l + BALL_SIZE - 1;
    assign ball_y_t = ball_y_reg;
    assign ball_y_b = ball_y_t + BALL_SIZE - 1;
    // pixel within ball
    assign sq_ball_on = (ball_x_l <= pix_x) && (pix_x <= ball_x_r) &&
                        (ball_y_t <= pix_y) && (pix_y <= ball_y_b);
    
    // map current pixel location to rom addr
    assign rom_addr = pix_y[2:0] - ball_y_t[2:0];       // get byte
    assign rom_col = pix_x[2:0] - ball_x_l[2:0];        
    assign rom_bit = rom_data[rom_col];                 // get corresponding bit
    
    // pixel within ball
    assign rd_ball_on = sq_ball_on & rom_bit;
    
    // ball_rgb_output
    assign ball_rgb = 3'b100;           // red
    
    // new ball position
    assign ball_x_next = (refr_tick) ?  ball_x_reg + x_delta_reg :  ball_x_reg;
    assign ball_y_next = (refr_tick) ?  ball_y_reg + y_delta_reg :  ball_y_reg;
    
    // get new ball velocity
    always @*
        begin
            x_delta_next = x_delta_reg;
            y_delta_next = y_delta_reg;
            if (ball_y_t < 1) // reached the top, start moving down
                y_delta_next = BALL_V_P;
            else if (ball_y_b > (MAX_Y-1))  // reached the bottom, start moving down
                y_delta_next = BALL_V_N;
            if (ball_x_t <= WALL_X_R)   // reached the left side wall, bounce to the right
                x_delta_next = BALL_V_P;
            else if ( (BAR_X_L <= ball_x_r) && (ball_x_r <= BAR_X_R) && (bar_y_t <= ball_y_b) && (ball_y_t <= bar_y_b)
                x_delta_next = BALL_V_N;    // bounce ball back if hits paddle
        end
    
        
    //---------------------------------------
    // RGB multiplexing circuit
    //---------------------------------------
    always @*
        begin
            if (~video_on)
                graph_rgb = 3'b000;     // blank
            else
                if (wall_on)
                    graph_rgb = wall_rgb;
                else if (bar_on)
                    graph_rgb = bar_rgb;
                else if (rd_ball_on)
                    graph_rgb = ball_rgb;
                else
                    graph_rgb = 3'b110;     // yellow background
        end
        
endmodule