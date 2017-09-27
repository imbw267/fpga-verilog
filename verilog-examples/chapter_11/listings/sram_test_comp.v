//Listing 11.3
//Author: Pong P. Chu
//Chapter 11
//Page 283
//Copyright 2008

module sram_test_comp
    (
     input wire clk, reset,
     input wire [7:0] sw,
     input wire [2:0] btn,
     output wire [3:0] an.
     output wire [7:0] led, sseg,
     output wire [17:0] ad,
     output wire we_n, oe_n,
     inout wire [15:0] dio_a,
     output wire ce_a_n. ub_a_n, lb_a_n
    );
    
    