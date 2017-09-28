//Experiment X
//Author: Brian X. Wu
//Chapter X
//Page X
//Copyright 2017

module template_gen
    #(
        parameter N=8, T=20
     )
    (
        output reg clk, reset,
        output reg data
    );
    
    // generate a clock
    // that runs forever
    always 
    begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end
    
    // test procedure
    initial
    begin
        #(10*T);        // do nothing for 10 clk cycles
        
        $display("Test generator started");
        
        $display("Test generator ended");
    end
    
    // Tasks
    task do_something(input integer X);
    begin
        
    end
    
endmodule