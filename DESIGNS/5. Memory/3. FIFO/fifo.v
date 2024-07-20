module fifo (
    input clkr,clkw, rst, we, re,
    input [7:0] data_in,
    output empty, full,
    output reg [7:0] data_out
);
    reg [7:0] mem [15:0];
    reg [4:0] w_ptr, r_ptr;
    integer i;

    always @(posedge clkw) begin
        if (rst) begin
            for(i=0; i<16; i=i+1)
                mem[i] <= 0;
            w_ptr <= 0;
            r_ptr <= 0;
        end
        else begin
            if (we && !full) begin
                mem[w_ptr[3:0]] <= data_in;
                w_ptr <= w_ptr + 1;
            end
            else
                w_ptr <= w_ptr;
        end
    end

    always @(posedge clkr) begin
        if (rst) begin
            data_out <= 0;
        end
        else begin
            if (re && !empty) begin
                data_out <= mem[r_ptr[3:0]];
                r_ptr <= r_ptr +1;
            end
            else
                r_ptr <= r_ptr;
        end
        
    end

    assign empty = (w_ptr == r_ptr);
    assign full = ((w_ptr[4] != r_ptr[4])&&(r_ptr[3:0] == w_ptr[3:0]));
endmodule