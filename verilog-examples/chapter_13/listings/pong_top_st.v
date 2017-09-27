//Listing 13.4
//Author: Pong P. Chu
//Chapter 13
//Page 324
//Copyright 2008

module pong_top_st
    (
     input wire clk, reset,
     output wire hsync, vsync,
     output wire [2:0] rgb
    );
    
    // signal declaration
    wire [9:0] pixel_x, pixel_y;
    wire video_on, pixel_tick;
    reg [2:0] rgb_reg;
    wire [2:0] rgb_next;
    
    // body
    // instantiate vga_sync circuit
    vga_sync vga_sync_unit  (   .clk(           clk         ),
                                .reset(         reset       ),
                                .hsync(         hsync       ),
                                .vsync(         vsync       ),
                                .video_on(      video_on    ),
                                .p_tick(        pixel_tick  ),
                                .pixel_x(       pixel_x     ),
                                .pixel_y(       pixel_y     ),
                            );
    
    pong_graph_st pong_gph_unit(    .video_on(      video_on    ),
                                    .pix_x(         pixel_x     ),
                                    .pix_y(         pixel_y     ),
                                    .graph_rgb(     rgb_next    )
                                );
    
    // rgb buffer
    always @(posedge clk)
    begin
        if (pixel_tick)
            rgb_reg <= rgb_next;
        
    end
    
    // output
    assign rgb = rgb_reg;
    
endmodule