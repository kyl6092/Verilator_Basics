`timescale 1ns/1ps
`define END_CYCLE 1000
`define CYCLE 10
`define RST_CC 2
`define ADDR_WIDTH 6
`define DATA_WIDTH 64
`define DATA_WORDS 64
module testfixture();

/*
Description:
    This testbench test the `Memory` module by repeated performing read/write operations.

Memory Ports:
    clk:        The clock.
    en:         Memory enable signal.
    we:         Memory write enable.
    addr:       Memory address.
    datain:     Data port for writing.
    dataout:    Data port for reading.
*/


// Variables
// integer idx;
integer cycles;

// Signal
reg clk;
reg en, we;
/* verilator lint_off UNUSEDSIGNAL */
reg [`ADDR_WIDTH-1:0] addr, tmp_addr;
reg [`DATA_WIDTH-1:0] datain, tmp_datain;
wire [`DATA_WIDTH-1:0] dataout;
/* verilator lint_off UNUSEDSIGNAL */

// Module Instantiation
memory #(
    .ADDR_WIDTH(`ADDR_WIDTH),
    .DATA_WIDTH(`DATA_WIDTH),
    .DATA_WORDS(`DATA_WORDS)
) u_mem (
    .clk    (clk),
    .en     (en),
    .we     (we),
    .addr   (addr),
    .datain (datain),
    .dataout(dataout)
);

// Waveform dumping
initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, u_mem);
end

// Control
initial begin
    clk     = 0;
    en      = 0;
    cycles  = 0;
    datain  = 0;
    tmp_datain  = 0;
    tmp_addr    = 0;
    addr    = 0;
end

always #(`CYCLE/2) clk <= ~clk;

always@(posedge clk) begin
    if (cycles == 2) begin
        en <= 1;
        we <= 1;
    end
    if (cycles >= 2 && cycles <= 65) begin
        datain  <= datain + 1;
        if (cycles == 65) begin
            addr <= 0;
            we <= 0;
        end
        else
            addr <= addr + 1;
    end
    else if (cycles >= 66) begin
        addr <= addr + 1;
    end
end

always@(posedge clk) begin
    if (cycles == `END_CYCLE)
        $finish;
    else
        cycles <= cycles + 1;
end


endmodule
