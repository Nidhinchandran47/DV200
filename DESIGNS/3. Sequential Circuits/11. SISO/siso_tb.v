module siso_tb();
    reg in, clk, rst;
    wire out;

    parameter CYCLE = 10;

    siso dut (in, rst, clk, out);

    always begin
        #(CYCLE/2);
        clk = 1'b0;
        #(CYCLE/2);
        clk = 1'b1;
    end

    task initialize;
        {in, rst} = 2'b0;
    endtask

    task reset();
        begin
            @(negedge clk);
            rst = 1'b1;
            @(negedge clk);
            rst = 1'b0; 
        end
    endtask

    task data_load(input i);
        begin
            @(negedge clk);
            in = i; 
        end
    endtask

    initial begin
        initialize;
        reset;
        data_load(1);
        data_load(0);
        data_load(0);
        data_load(1);
        data_load(1);
        data_load(1);
        //reset;
        data_load(0);
        data_load(0);
        data_load(0);
        data_load(1);
        data_load(0);
        data_load(1);
        data_load(0);
        #40;
        $finish;    
    end

endmodule