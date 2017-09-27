//Listing 8.4
//Author: Pong P. Chu
//Chapter 8
//Page 237
//Copyright 2008

module uart
    #(          //Default settings
                // 19,200 baud, 8 data bits, 1 stop bit, 2^2 FIFO
      parameter DBIT = 8,       // 8 data bits
                SS_TICK = 16,   // # of ticks for stop bits (16 ticks per bit)
                                // 16 / 24 / 32 for 1 / 1.5 / 2 bits respectively
                DVSR = 163,     // Baud rate divisor
                                // DVSR = 50M / (16*baudrate)
                                // Baud rate: DVSR
                                // 2400     : 1302
                                // 4800     : 651
                                // 9600     : 325
                                // 19200    : 163
                                // 38400    : 81
                                // 54600    : 54
                DVSR_BIT = 8,   // 8 bits of DVSR, will have to be larger for slower baudrates
                FIFO_W = 2      // # of addr bits of FIFO
                                // # of words, or length of FIFO = 2^FIFO_W
     )
    (
     input wire clk, reset,
     input wire rd_uart, wr_uart, rx,
     input wire [7:0] w_data,
     output wire tx_full, rx_empty, tx,
     output wire [7:0] r_data
    );
    
    // signal declaration
    wire tick, rx_done_tick, tx_done_tick;
    wire tx_empty, tx_fifo_not_empty;
    wire [7:0] tx_fifo_out, rx_data_out;
    
    // body
    // baud tick generator (16 ticks per baud)
    mod_m_counter #(.M(DVSR), .N(DVSR_BIT)) baud_gen_unit (.clk(clk), .reset(reset), .q(), .max_tick(tick));
    
    // uart_rx
    uart_rx #(.DBIT(DBIT), .SB_TICK(SB_TICK)) uart_rx_unit (.clk(clk), .reset(reset), .rx(rx), .s_tick(tick), .rx_done_tick(rx_done_tick), .dout(rx_data_out));
    
    // rx FIFO
    fifo #(.B(DBIT), .W(FIFO_W)) fifo_rx_unit (.clk(clk), .reset(reset), .rd(rd_uart), .wr(rx_done_tick), .w_data(rx_data_out), .empty(rx_empty), .full(), .r_data(r_data));
    
    // tx FIFO
    fifo #(.B(DBIT), .W(FIFO_W)) fifo_tx_unit (.clk(clk), .reset(reset), .rd(tx_done_tick), .wr(wr_uart), .w_data(w_data), .empty(tx_empty), .full(tx_full), .r_data(tx_fifo_out));
    
    // uart_tx
    uart_tx #(.DBIT(DBIT), .SB_TICK(SB_TICK)) uart_tx_unit (.clk(clk), .reset(reset), .tx_start(tx_fifo_not_empty), .s_tick(tick), .din(tx_fifo_out), .tx_donw_tick(tx_done_tick), .tx(tx));
    
    assign tx_fifo_not_empty = ~tx_empty;
    
endmodule           // uart