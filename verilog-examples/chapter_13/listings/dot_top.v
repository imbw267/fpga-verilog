//Listing 13.8
//Author: Pong P. Chu
//Chapter 13
//Page 336
//Copyright 2008

module dot_top
    (
     input wire clk, reset,
     input wire [1:0] btn,
     input wire [2:0] sw,
     output wire hsync, vsync,
     output wire [2:0] rgb
    );
    
    // signal declaration
    wire [9:0] pixel_x, pixel_y;
    wire video_on, pixel_tick;
    reg [2:0] rgb_reg;
    wire [2:0] rgb_next;
    
    // body
    // instantiate VGA sync circuit
    vga_sync vsync_unit (   .clk(           clk         ),
                            .reset(         reset       ),
                            .hsync(         hsync       ),
                            .vsync(         vsync       ),
                            .video_on(      video_on    ),
                            .p_tick(        pixel_tick  ),
                            .pixel_x(       pixel_x     ),
                            .pixel_y(       pixel_y     )
                        );
                        
    // instantiate bitmap graphic generator
    bitmap_gen bmp_unit (   .clk(           clk         ),
                            .reset(         reset       ),
                            .video_on(      video_on    ),
                            .btn(           btn         ),
                            .sw(            sw          ),
                            .pix_x(         pixel_x     ),
                            .pix_y(         pixel_y     ),
                            .bit_rgb(       rgb_next    )    
                        );
                        
    // rgb_buffer
    
    always @(posedge clk, posedge reset)
        begin
            if(reset)
                rgb_reg <= 3'b000;      // blank
            else
                if(pixel_tick)
                    rgb_reg <= rgb_next;
        end

    // output 
    assign rgb = rgb_reg;
    
endmodule