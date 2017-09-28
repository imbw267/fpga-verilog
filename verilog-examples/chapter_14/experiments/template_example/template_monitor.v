//Experiment X
//Author: Brian X. Wu
//Chapter X
//Page X
//Copyright 2017


module template_monitor
    #(
        parameter N=3
     )
    (
     input wire clk, reset
    );

    // instantiate log file
    initial
    begin
        // start log file
        log_file = $fopen("test_log.txt")
        if (!log_file)
            $display("file test_log.txt could not be opened");
        console_file = 32'h0000_0001;
        out_file = log_file | console_file;
        

    end
    
    
    // instantiate text monitor
    initial
    begin
        $display("");
        $monitor("%d,", $time);
    end