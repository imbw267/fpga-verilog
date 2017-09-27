//Listing 7.13
//Author: Pong P. Chu
//Chapter 7
//Page 200
//Copyright 2008

// file write example

integer log_file, both_file;
localparam con_file = 32'h000_0001;     // console output

initial
begin
    log_file = $fopen("my_log.log");
    if (log_file == 0)
        $display("Fail to open log file");   // write to console
    both_file =  log_file | con_file;
    
    // write to both console and log file
    $fdisplay(both_file, "Simulation started");
    
    // write to log file only
    $fdisplay(log_file, "Writing to log file only");
    
    // write to bith console and log file
    $fdisplay(both_file, "Simulation ended.");
    $fclose(log_file);
    
end