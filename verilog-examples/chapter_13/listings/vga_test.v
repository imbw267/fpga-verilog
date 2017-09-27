//Listing 13.2
//Author: Pong P. Chu
//Chapter 13
//Page 318
//Copyright 2008


module vga_test
    (
     input clk, reset,
     input wire [2:0] sw,
     output wire hsync, vsync,
     output wire [2:0] rgb
    );
    
    // signal declaration
    reg [2:0] regb_reg;
    wire video_on;
    
    // instantiate VGA circuit
    vga_sync vga_sync_unit (    .clk(           clk         ),
                                .reset(         reset       ),
                                .hsync(         hsync       ),
                                .vsync(         vsync       ),
                                .video_on(      video_on    ),
                                .p_tick(                    ),
                                .pixel_x(                   ),
                                .pixel_y(                   )
                            );
    
    // rgb buffer
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            rgb_reg <= 0;
        else
            rgb_reg <= sw;
    end
    
    // output
    assign rgb = (video_on) ? rgb_reg : 3'b0;
    
endmodule
                            