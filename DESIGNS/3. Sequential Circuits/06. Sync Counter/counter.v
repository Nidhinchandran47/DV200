module counter (
    input   clk,
    input   rst,
    input   ce,
    output reg [3:0] count
);
    always @(posedge clk ) begin
        if (rst) begin
            count <= 0;
        end
        else if (ce) begin
            count <= count + 1;
        end
        else begin
            count <= count;
        end
    end
endmodule