//Experiment 3.11.1.4
//Author: Brian X. Wu
//Chapter 3
//Page 80
//Copyright 2008

module barrel_shifter_lr_rev
    #(
      parameter N = 8       // number of bits
     )
    (
     input wire [N-1:0] a,
     input wire [2:0] amt,
     input wire lr,         // 1 for left, 0 for right
     output wire [N-1:0] y
    );
    
    // internal states
    wire [N-1] s0, s1, s2, s3;
    
    // body
    
    // reverse the bit order if right shifting
    assign s0 = (lr) ? a : {a[0],a[1], a[2], a[3], a[4], a[5], a[6], a[7]};
    
    // shift 1 or 0 bits
    assign s1 = (amt[0]) ? {a[N-2:0], a[N-1]}  : a;
    
    // shift 2 or 0 bits
    assign s2 = (amt[1]) ? {s1[N-3:0], s1[N-1:N-2]} : s1;
    
    // shift 4 or 0 bits
    assign s3 = (amt[2]) ? {s2[N-5:0], s2[N-1:N-4]} : s2;
    
    // output
    // reverse the bit order if right shifted
    assign y = (lr) ? s3 : {s3[0], s3[1], s3[2], s3[3], s3[4], s3[5], s3[6], s3[7]};
    
endmodule       // barrel_shifter_lr_rev