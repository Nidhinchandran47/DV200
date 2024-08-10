module pipo (
    input [3:0] in,
    input rst, clk, ld,
    output reg [3:0] out
);

    always @ (posedge clk) begin
        if(rst)
            out <= 0;
        else if (ld) begin     // load
            out[3]  <= in[3];
            out[2]  <= in[2];
            out[1]  <= in[1];
            out[0]  <= in[0];
        end
        else begin          // shifting
            out[3]  <= out[2];
            out[2]  <= out[1];
            out[1]  <= out[0];
            out[0]  <= 0;
        end
    end
    
endmodule