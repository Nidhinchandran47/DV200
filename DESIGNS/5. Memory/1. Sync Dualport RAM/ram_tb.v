module dualport16x8_tb ();
    reg clk,rst,we,re;
    reg [ADDR_WIDTH-1:0] wr_addr, rd_addr;
    reg [DATA_WIDTH-1:0] data_in;
    wire [DATA_WIDTH-1:0] data_out;

    parameter CYCLE = 10;
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 8;
    integer i;

    ram #(DATA_WIDTH, ADDR_WIDTH) dut (clk,rst,we,re,wr_addr, rd_addr,data_in,data_out);

    always begin
	    #(CYCLE/2);
	    clk = 1'b0;
	    #(CYCLE/2);
	    clk=~clk;
    end

    task initialize();
        begin
            @(negedge clk);
            rst = 1'b1;
            @(negedge clk);
            rst = 1'b0; 
        end
    endtask

    task write(input [DATA_WIDTH-1:0] data, input [ADDR_WIDTH-1:0] address);begin
            @(negedge clk);
            we = 1;
            re = 0;
            data_in = data;
            wr_addr = address;
        end
    endtask

    task read(input[ADDR_WIDTH-1:0] address); begin
            @(negedge clk);
            we = 0;
            re = 1;
            rd_addr = address;
        end
    endtask

    initial begin
        initialize;
        for (i = 0; i<(2**ADDR_WIDTH); i=i+1)
            write(i,i);
        for (i = 0; i<(2**ADDR_WIDTH); i=i+1)
            read(i);
        $finish;
    end

endmodule