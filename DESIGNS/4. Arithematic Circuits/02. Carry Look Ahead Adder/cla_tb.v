module cla_tb;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    cla uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $monitor("Time=%0d: A=%b, B=%b, Cin=%b, Sum=%b, Cout=%b", $time, A, B, Cin, Sum, Cout);

        // Test cases
        A = 4'b0000; B = 4'b0000; Cin = 0; #10;
        A = 4'b0001; B = 4'b0010; Cin = 0; #10;
        A = 4'b0011; B = 4'b0110; Cin = 1; #10;
        A = 4'b1111; B = 4'b0001; Cin = 1; #10;
        A = 4'b1010; B = 4'b0101; Cin = 0; #10;

        $finish;
    end
endmodule
