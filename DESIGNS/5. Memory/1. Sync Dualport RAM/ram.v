module ram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 8
)(
    input clk,rst,we,re,
    input [(ADDR_WIDTH-1):0] wr_addr, rd_addr,
    input [(DATA_WIDTH-1):0] data_in,
    output reg [(DATA_WIDTH-1):0] data_out
);
    integer i;
    reg [(DATA_WIDTH-1):0] mem [((2**ADDR_WIDTH)-1):0];
    always @(posedge clk ) begin
        if (rst) begin
            data_out <= 0;
            for (i = 0; i<(2**ADDR_WIDTH); i=i+1) begin
                mem[i] <= 0;
            end
        end
        else begin
            if (we == 1 && re == 0)
                mem[wr_addr] <= data_in;
            if (we == 0 && re == 1)
                data_out <= mem[rd_addr];
        end
    end
endmodule