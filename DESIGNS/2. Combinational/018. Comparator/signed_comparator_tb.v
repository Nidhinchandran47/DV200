module test_signed_comparator;
    reg signed [3:0] A;
    reg signed [3:0] B;
    wire A_greater_B;
    wire A_equal_B;
    wire A_less_B;

    signed_comparator uut (
        .A(A),
        .B(B),
        .A_greater_B(A_greater_B),
        .A_equal_B(A_equal_B),
        .A_less_B(A_less_B)
    );

    initial begin
        $monitor("A = %d, B = %d, A > B = %b, A == B = %b, A < B = %b", A, B, A_greater_B, A_equal_B, A_less_B);
        
        // Test cases
        A = 4'd5; B = 4'd3; #10; // A > B
        A = 4'd2; B = 4'd2; #10; // A == B
        A = -4'd1; B = 4'd1; #10; // A < B
        A = -4'd4; B = -4'd3; #10; // A < B
        A = -4'd7; B = -4'd7; #10; // A == B
        A = 4'd0; B = 4'd0; #10; // A == B
        A = 4'd7; B = -4'd1; #10; // A > B

        $finish;
    end
endmodule