//Listing 7.6
//Author: Pong P. Chu
//Chapter 7
//Page 181
//Copyright 2008

module ab_ff_all
    (
     input wire clk,
     input wire a, b, 
     output reg q0, q1, q2, q3, q4, q5
    );
    
    reg ab0, ab1, ab2, ab3, ab4, ab5;
    
    // attempt 0
    always @(posedge clk)
    begin
        ab0 = a & b;
        q0 <= ab0;
    end                         // Desired circuit
    
    // attempt 1
    always @(posedge clk)
    begin                       // ab1_entry = ab; q1_entry = q1;
        ab1 <= a & b;           // ab1_exit = a & b;
        q1 <= ab1;              // q1_exit = ab1_entry
    end                         // ab1 = ab1_exit;  q1 = q1_exit
                                // Delay of one cycle
    
    // attempt 2
    always @(posedge clk)
    begin
        ab2 = a & b;
        q2 = ab2;
    end                         // not recommended, the blocking 
                                // assignment may create a race condition
    
    // attempt 3  (switch the order of attempt 0)
    always @(posedge clk)
    begin
        q3 <= ab3;
        ab3 = a & b;
    end                         // additional register created, delay of one cycle
    
    // attempt 4  (switch the order of attempt 1)
    always @(posedge clk)
    begin                       // ab4_entry = ab; q4_entry = q4;    
        q4 <= ab4;              // q4_exit = ab4_entry
        ab4 <= a & b;           // ab4_exit = a & b;
    end                         // ab4 = ab4_exit; q4 = q4_exit;
                                // Same as attempt 1, delay of 1 cycle
    
    // attempt 5 (switch the order of attempt 2)
    always @(posedge clk)
    begin
        q2 = ab2;
        ab2 = a & b;
    end                         // register inferred, will create delay of one cycle
    
endmodule           // ab_ff_all