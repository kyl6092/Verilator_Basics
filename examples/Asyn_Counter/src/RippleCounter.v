module RippleCounter (
    input clk,
    input rstn,
    output reg [31:0] out
);

/*
Description:
    This module counts the number from 0 to the 2^n-1.
Ports:
    clk:    Clock
    rstn:   Asynchronous negative reset.
    out:    Output port for counted value.
*/

genvar i;
wire [31:0] qn;
wire [31:0] q;

assign out = q;
generate
    for (i = 0; i < 32; i=i+1) begin:gen_dff
        if (i==0)
            /* verilator lint_off GENUNNAMED */
            dff_wrapper dff_inst (
                .clk(clk),
                .rstn(rstn),
                .d(qn[i]),
                .q(q[i]),
                .qn(qn[i])
            );
            /* verilator lint_off GENUNNAMED */
        else
            /* verilator lint_off GENUNNAMED */
            dff_wrapper dff_inst (
                .clk(qn[i-1]),
                .rstn(rstn),
                .d(qn[i]),
                .q(q[i]),
                .qn(qn[i])
            );
            /* verilator lint_off GENUNNAMED */
    end
endgenerate

endmodule
