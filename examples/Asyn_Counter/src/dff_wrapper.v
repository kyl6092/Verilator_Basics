module dff_wrapper (
    input   clk,
    input   rstn,
    input   d,
    output reg q,
    output  qn
);

assign qn = ~q;
always@(posedge clk or negedge rstn) begin
    if(!rstn) begin
        q <= 1'd0;
    end
    else begin
        q <= d;
    end
end

endmodule
