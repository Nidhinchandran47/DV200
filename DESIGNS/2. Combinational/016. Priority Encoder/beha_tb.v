module enc8x3_tb ();
    reg [7:0] in;
    wire [2:0] out;
    wire valid;

    enc8x3 dut (in, out, valid);

    task initialize;
        in = 0;
    endtask

    task inputs(input [7:0] i); begin
            in = i;
            #10;
        end
    endtask

    initial begin
        $monitor("Input-> %b, Output-> %b, Valid-> %b",in,out,valid);
        initialize;
        inputs(8'h00);
        inputs(8'h02);
        inputs(8'h07);
        inputs(8'h0a);
        inputs(8'h01);
        inputs(8'h0e);
        inputs(8'h1f);
        inputs(8'h40);
        inputs(8'h81);
        $finish;

    end

endmodule