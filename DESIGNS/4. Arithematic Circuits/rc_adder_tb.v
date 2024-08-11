module rc_adder_tb ();
    reg [3:0] a,b;
    reg c_in;
    wire [3:0] sum;
    wire c_out;

    rc_adder dut(
        .a(a),
        .b(b),
        .sum(sum),
        .c_in(c_in),
        .c_out(c_out)
    );

    initial begin
        a = 4'b0000;
        b = 4'b0000;
        c_in = 1'b0;
        #10;
        a = 4'b0110;
        b = 4'b1000;
        c_in = 1'b1;
        #10;
        a = 4'b1000;
        b = 4'b0010;
        c_in = 1'b1;
        #10;
        a = 4'b1100;
        b = 4'b1100;
        c_in = 1'b1;
        #10;
        a = 4'b1111;
        b = 4'b0011;
        c_in = 1'b1;
        #10;
        $finish;
    end

    initial 
        $monitor("A(%b)+B(%b)+Carry(%b)= Sum(%b),Carry(%b)",a,b,c_in,sum,c_out);
endmodule