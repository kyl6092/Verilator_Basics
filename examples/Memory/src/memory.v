module memory #(
	parameter ADDR_WIDTH = 6,
	parameter DATA_WIDTH = 64,
	parameter DATA_WORDS = 64
) (
	input clk,
	input en,
	input we,
	input [ADDR_WIDTH-1:0] addr,
	input [DATA_WIDTH-1:0] datain,
	output reg [DATA_WIDTH-1:0] dataout
);

/*
Description:
    This module instantiates a single-port random access memory (RAM) with defined parameters.
Ports:
    clk:        The clock.
    en:         Memory enable signal.
    we:         Memory write enable.
    addr:       Memory address.
    datain:     Data port for writing.
    dataout:    Data port for reading.
*/

reg [DATA_WIDTH-1:0] mem [0:DATA_WORDS-1];

/* verilator lint_off WIDTHEXPAND */
integer i;
/* verilator lint_off WIDTHEXPAND */

initial begin
    for (i = 0; i < DATA_WORDS; i=i+1) begin
        mem[i] = 0;
    end
end

always@(posedge clk) begin
	if (en) begin
		if (we) begin
			mem[addr] <= datain;
		end
		dataout <= mem[addr];
	end
	else begin
		dataout <= dataout;
	end
end

endmodule
