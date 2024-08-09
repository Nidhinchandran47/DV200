module siso (
    input [3:0] in,
    input rst, clk, ld,
    output reg out
);
    reg t0, t1, t2;

    always @ (posedge clk) begin
        if(rst)
            {t0, t1, t2, out} <= 0;
        else if (ld) begin     // load
            out <= in[3];
            t2  <= in[2];
            t1  <= in[1];
            t0  <= in[0];
        end
        else begin          // shifting
            out <= t2;
            t2  <= t1;
            t1  <= t0;
            t0  <= 0;
        end
    end
    
endmodule