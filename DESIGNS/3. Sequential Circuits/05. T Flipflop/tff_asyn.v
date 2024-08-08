module tff_asyn (
    input clk,
    input t,
    input arst,
    output reg q,
    output qb
);
    always @(posedge clk or posedge arst) begin
        if (arst) begin
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