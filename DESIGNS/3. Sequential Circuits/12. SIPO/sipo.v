module sipo (
    input in, rst, clk,
    output reg [3:0] out
);
    
    always @ (posedge clk) begin
        if(rst)
            out <= 0;
        else begin
            out[3] <= out[2];
            out[2]  <= out[1];
            out[1]  <= out[0];
            out[0]  <= in;
        end
    end
    
endmodule