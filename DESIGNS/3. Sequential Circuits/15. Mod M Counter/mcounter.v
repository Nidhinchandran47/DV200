module mcounter (
    input [3:0] data,
    input rst, load, clk,
    output reg [3:0] q
);
    parameter   M = 12;
    always @ (posedge clk) begin
        if (rst)
            q <= 4'b0000;
        else if (load)
            q <= data;
        else if (q >= M)
            q <= 0;
        else
            q <= q + 1;
    end
endmodule