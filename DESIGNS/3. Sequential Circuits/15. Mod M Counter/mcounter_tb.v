module counter12_tb #(
    parameter M = 12;     // 
)   ();

    reg clk, rst, load;
    reg [3:0] data;
    wire [3:0] q;

    parameter CYCLE = 10;

    counter12 dut (data, rst, load, clk, q);

    always begin
	    #(CYCLE/2);
	    clk = 1'b0;
	    #(CYCLE/2);
	    clk=~clk;
    end

    task initialize(); 
        begin
            rst     = 1'b0;
            load    = 1'b0;
            data    = 4'h0;
        end
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
            data <= i;
            load <= 1'b1;
            @(negedge clk);
            data <= 0;
            load <= 1'b0;
        end
    endtask 

    task idle(input [4:0] k);
        begin
            repeat(k) 
                #CYCLE;
        end
    endtask 

    initial begin

        $monitor("Count -> %b, reset %b, load %b",q, rst, load);

        initialize();
        idle(1);
        reset();
        idle(5);
        data_load(9);
        idle(15);
        data_load(1);
        idle(20);
        $finish;
    end
    
endmodule