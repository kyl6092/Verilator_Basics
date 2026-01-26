`timescale 1ns/1ps
`define END_CYCLE 1000
`define CYCLE 10
`define RST_CC 2
`define WIDTH 8
module testfixture();

/*
Description:
    This testbench test the `Counter` module for counting from 0 to the 2^n-1, where n is defined by the parameter `width`.

Counter Ports:
    Ports:
    clk:    The clock.
    rst_n:  Asynchronous negative reset.
    en:     Enable signal. When en=1'b0, the module stops counting.
    out:    Output port for counted value.
*/


// Variables
// integer idx;
integer cycles;

// Signal
reg clk, rst_n;
reg en;
/* verilator lint_off UNUSEDSIGNAL */
wire [`WIDTH-1:0] out;
/* verilator lint_off UNUSEDSIGNAL */

// Module Instantiation
Counter #(.width(`WIDTH)) u_cnt (
    .clk    (clk),
    .rst_n  (rst_n),
    .en     (en),
    .out    (out)
);

// Waveform dumping
initial begin
    $dumpfile("waveform.vcd");
    $dumpvars();
end

// Control
initial begin
    clk     = 0;
    rst_n   = 0;
    en      = 0;
    cycles  = 0;
end

initial begin
    #(`CYCLE*2) rst_n = 1;
end

always #(`CYCLE/2) clk <= ~clk;
always@(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        en <= 1;
    end
    else begin
        if (cycles == 63)
            en <= 0;
        else
            en <= 1;
    end
end

always@(posedge clk) begin
    if (cycles == `END_CYCLE)
        $finish;
    else
        cycles <= cycles + 1;
end


endmodule
