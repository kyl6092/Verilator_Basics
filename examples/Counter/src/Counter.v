module Counter #(parameter width = 8) (
    input clk,
    input rst_n,
    input en,
    output reg [width-1:0] out
);

/*
Description:
    This module counts the number from 0 to the 2^n-1, where n is defined by the parameter `width`.
Ports:
    clk:    Clock
    rst_n:  Asynchronous negative reset.
    en:     Enable signal. When en=1'b0, the module stops counting.
    out:    Output port for counted value.
*/

always@(posedge clk or negedge rst_n) begin: reg_update
    if(!rst_n) begin
        out <= 0;
    end
    else begin
        if (en)
            out <= out + 1;
        else
            out <= out;
    end
end

endmodule
