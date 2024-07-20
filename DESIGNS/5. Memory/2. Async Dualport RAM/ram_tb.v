module ram_tb();
    reg clk_w,clk_r,we,re,rst;
    reg [(ADDR_WIDTH-1):0] wr_addr, rd_addr;
    reg [(DATA_WIDTH-1):0] data_in;
    wire [(DATA_WIDTH-1):0] data_out;

    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 8;
    parameter CYCLE = 10;
    parameter PHASE = 2;
    integer i;

    asyncram #(DATA_WIDTH, ADDR_WIDTH) dutv(clk_w,clk_r,we,re,rst,wr_addr, rd_addr,data_in,data_out);

    always begin
        clk_w = 1'b0;
        #(CYCLE/2);
        forever begin
            clk_w = ~clk_w;
            #(CYCLE/2);
        end
    end

    always begin
        clk_r = 1'b0;
        #PHASE;
        #(CYCLE/2);
        forever begin
            clk_r = ~clk_r;
            #(CYCLE/2);
        end
    end

    task initialize(); begin
            @(negedge clk_w);
            rst = 1'b1;
            @(negedge clk_w);
            rst = 1'b0;
        end
    endtask

    task write(input [(DATA_WIDTH-1):0] data, input [(ADDR_WIDTH-1):0] address);begin
            @(negedge clk_w);
            we = 1;
            re = 0;
            data_in = data;
            wr_addr = address;
        end
    endtask

    task read(input[(ADDR_WIDTH-1):0] address); begin
            @(negedge clk_r);
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