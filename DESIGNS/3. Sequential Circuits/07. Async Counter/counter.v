module counter (
    input   clk,
    input   arst,   // asynchronous reset
    input   ce,
    output reg [3:0] count
);
    always @(posedge clk or posedge arst) begin
        if (arst) begin
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