module johnson (
    input   clk,
    input   rst,
    output reg [[3:0] count
);
    always @(posedge clk ) begin
        if (rst) begin
            count <= 1;
        end
        else begin
            count <= {count[2:0],~count[3]};
        end
    end
endmodule