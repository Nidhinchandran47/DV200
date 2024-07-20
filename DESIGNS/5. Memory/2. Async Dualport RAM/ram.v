module ram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 8
)(
    input clk_w,clk_r,we,re,rst,
    input [(ADDR_WIDTH-1):0] wr_addr, rd_addr,
    input [(DATA_WIDTH-1):0] data_in,
    output reg [(DATA_WIDTH-1):0] data_out
);
    reg [(DATA_WIDTH-1):0] mem [((2**ADDR_WIDTH)-1):0];;
    integer i;

    always @( posedge clk_w)begin
        if (rst) begin
            for (i = 0; i<(2**ADDR_WIDTH); i=i+1)
                mem[i] <= 0;
        end
        else if (we == 1) begin
            mem[wr_addr] <= data_in;
        end
    end

    always @ (posedge clk_r)begin
        if (rst) 
            data_out <= 0;
        else if (re == 1)begin
            data_out <= mem[rd_addr];
        end
    end
    
endmodule