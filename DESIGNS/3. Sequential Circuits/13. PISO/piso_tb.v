module piso_tb();
    reg [3:0] in;
    reg clk, rst, ld;
    wire out;

    parameter CYCLE = 10;

    piso dut (in, rst, clk, ld, out);

    always begin
        #(CYCLE/2);
        clk = 1'b0;
        #(CYCLE/2);
        clk = 1'b1;
    end

    task initialize;
        {in, rst} = 5'b0;
    endtask

    task reset();
        begin
            @(negedge clk);
            rst = 1'b1;
            @(negedge clk);
            rst = 1'b0; 
        end
    endtask

    task data_load(input [3:0] i);
        begin
            @(negedge clk);
            ld = 1;
            in = i; 
            @(negedge clk);
            ld = 0;
        end
    endtask

    initial begin
        initialize;
        reset;
        data_load(c);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        data_load(f);
        @(negedge clk);
        data_load(0);
        data_load(5);
        repeat(4)
            @(negedge clk);
        data_load(1);
        repeat(4)
            @(negedge clk);
        data_load(7);
        
        #40;
        $finish;    
    end

endmodule