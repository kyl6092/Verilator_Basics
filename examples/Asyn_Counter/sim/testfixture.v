`timescale 1ns/1ps
`define END_CYCLE 1000
`define CYCLE 10
`define RST_CC 2
module testfixture();

/*
Description:
    This testbench test the `RippleCounter` module for counting from 0 to the 2^n-1

    Counter Ports:
    clk:    The clock.
    rstn:   Asynchronous negative reset.
    out:    Output port for counted value.
*/


// Variables
// integer idx;
integer cycles;

// Signal
reg clk, rstn;
/* verilator lint_off UNUSEDSIGNAL */
wire [31:0] out;
/* verilator lint_off UNUSEDSIGNAL */

// Module Instantiation
RippleCounter u_cnt (
    .clk    (clk),
    .rstn   (rstn),
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
    rstn    = 0;
    cycles  = 0;
end

initial begin
    #(`CYCLE*2) rstn = 1;
end

always #(`CYCLE/2) clk <= ~clk;


always@(posedge clk) begin
    if (cycles == `END_CYCLE)
        $finish;
    else
        cycles <= cycles + 1;
end


endmodule
