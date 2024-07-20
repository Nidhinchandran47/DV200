module fifo_tb();
    reg clkr,clkw, rst, we, re;
    reg [7:0] data_in;
    wire empty, full;
    wire [7:0] data_out;
    parameter PHASE = 2;
    parameter CYCLE =10;
    integer i;
    fifo dut (clkr, clkw, rst, we, re,data_in, empty, full, data_out);

    always begin
        clkr = 1'b0;
        #(CYCLE/2);
        forever begin
            clkr = ~clkr;
            #(CYCLE/2);
        end
    end

    always begin
        #PHASE;
        clkw = 1'b0;
        #(CYCLE/2);
        forever begin
            clkw = ~clkw;
            #(CYCLE/2);
        end
    end

    task initialize(); begin
            @(negedge clkw);
            rst = 1'b1;
            @(negedge clkw);
            rst = 1'b0;
        end
    endtask

    task write(input[7:0]i); begin
        @(negedge clkw);
        we = 1;
        data_in = i;
        
    end
    endtask

    task read(); begin
        @(negedge clkr);
        re = 1;
        we = 0;
        @(negedge clkr);
        re = 0;
    end
    endtask

    initial begin
        initialize;
        write(8'h44);
        write(8'ha0);
        write(8'hde);
        write(8'had);
        read;
        write(8'h00);
        write(8'h10);
        write(8'ha0);
        read;
        read;
        read;
        read;
        write(8'hfe);
        write(8'he1);
        write(8'h44);
        read;
        read;
        read;
        read;
        write(8'hbe);
        write(8'h9f);
        write(8'h00);
        read;
        read;
        read;
        read;
        $finish;
        
    end

endmodule  