module tff (
    input clk,
    input t,
    input rst,
    output reg q,
    output qb
);
    always @(posedge clk ) begin
        if (rst) begin
            q <= 0;
        end
        else if (t) begin
            q <= ~q;
        end
        else begin
            q <= q;
        end
    end
    assign qb = ~q;
endmodule