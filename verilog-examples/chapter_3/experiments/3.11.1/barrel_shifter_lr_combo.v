//Experiment 3.11.1.1
//Author: Brian X. Wu
//Chapter 3
//Page 80
//Copyright 2008

module barrel_shift_lr_combo
    #(
      parameter N = 8       // 8 bits wide
     )
    (
     input [N-1:0] a,
     input [2:0] amt,
     input lr,              // 1 for rotate left, 0 for rotate right
     output [N-1:0] y 
    );
    
    wire [N-1:0] sr0, sr1, sr2;
    wire [N-1:0] sl0, sl1, sl2;
    
    // body
    // stage 0, shift 1 or 0 bits
    assign sl0 = (amt[0]) ? {a[N-2:0],  a[N-1]}     : a;
    assign sr0 = (amt[0]) ? {a[0],      a[N-1:1]}   : a;
    
    // stage 1, shift 2 or 0 bits
    assign sl1 = (amt[1]) ? {sl0[N-3:0], sl0[N-1:N-2]} : sl0;
    assign sr1 = (amt[1]) ? {sr0[1:0],   sr0[N-1:2]}   : sr0;
    
    // stage 2, shift 4 or 0 bits
    assign sl2 = (amt[2]) ? {sl1[N-5:0], sl1[N-1:N-4]} : sl1;
    assign sr2 = (amt[2]) ? {sr1[3:0],   sr1[N-1:4]}   : sr1;
    
    // stage 3, select output
    assign y = (lr) ? sl2 : sr2;
    
endmodule       // barrel_shift_lr_combo