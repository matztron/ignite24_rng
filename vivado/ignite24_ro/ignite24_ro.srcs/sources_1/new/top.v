`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2024 22:12:23
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk,
    input res,
    input RsRx,
    output RsTx,
    input en_uart_sw,
    input [7:0] uart_data

    );
    
    clock_divider #(
        .DIV(2)
    )(
        .clk_in(clk),
        .rst(rst),
        .clk_out(clk_50MHz)
    );
    
    wire [7:0] data;
    wire clk_50MHz;
    
    // <<< Our design >>>
    ro_top #(
        .SIZE(8)
    ) ro_top_I (
        .clk(clk_50MHz),
        .en(en_uart_sw),
        .d_out(data)
    );
    //---
    
    // UART
    Uart8  #(
    .CLOCK_RATE(100000000), // board internal clock
    .BAUD_RATE(9600)
)(
    .clk(clk),
    // rx interface
    /*.rx(),
    .rxEn(),
    .out(),
    .rxDone(),
    .rxBusy(),
    .rxErr(),*/
    // tx interface
    .tx(RsTx),
    .txEn(1'b1),
    .txStart(en_uart_sw),
    .in(/*uart_data*/ data),
    .txDone(),
    .txBusy()
);
endmodule
