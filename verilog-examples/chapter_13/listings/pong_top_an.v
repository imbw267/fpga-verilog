//Listing 13.6
//Author: Pong P. Chu
//Chapter 13
//Page 331
//Copyright 2008

module pong_top_an
    (
     input wire clk, reset,
     input wire [1:0] btn,
     output wire hsync, vsync,
     output wire [2:0] rgb
    );
    
    // signal declaration
    wire [9:0] pixel_x, pixel_y;
    wire video_on, pixel_tick;
    reg [2:0] rgb_reg;
    wire [2:0] rgb_next;
    
    // body
    // instantiate vga sync circuit
    vga_sync vga_sync_unit (    .clk(           clk         ),
                                .reset(         reset       ),
                                .hsync(         hsync       ),
                                .vsync(         vsync       ),
                                .video_on(      video_on    ),
                                .p_tick(        pixel_tick  ),
                                .pixel_x(       pixel_x     ),
                                .pixel_y(       pixel_y     )
                           );
    
    // instantiate graphics generator
    pong_graph_animate pong_ga_unit (   .clk(           clk         ),
                                        .reset(         reset       ),
                                        .btn(           btn         ),
                                        .video_on(      video_on    ),
                                        .pix_x(         pixel_x     ),
                                        .pix_y(         pixel_y     ),
                                        .graph_rgb(     rgb_next    )
                                    );
                                    
    // rgb buffer SM
    always @(posedge clk, posedge reset)
        begin
            if(reset)
                rgb_reg <= 0'b000;      // blank
            else if (pixel_tick)
                rgb_reg <= rgb_next;
        end
        
    // output
    assign rgb = rgb_reg;
    
endmodule
              