module siso (
    input in, rst, clk,
    output reg out
);
    reg t0, t1, t2;

    always @ (posedge clk) begin
        if(rst)
            {t0, t1, t2, out} <= 0;
        else begin
            out <= t2;
            t2  <= t1;
            t1  <= t0;
            t0  <= in;
        end
    end
    
endmodule