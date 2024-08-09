module updown (
    input   clk,
    input   rst,
    input   m,  // mode  0 - up  1 - down
    output reg [3:0] count
);
    always @(posedge clk ) begin
        if (rst) begin
            count   <= 0;
        end
        else if (m) begin
            count <= count - 1;
        end
        else begin
            count <= count + 1;
        end
    end
endmodule