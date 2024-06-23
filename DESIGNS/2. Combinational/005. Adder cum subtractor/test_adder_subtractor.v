module test_adder_subtractor;
    reg A;
    reg B;
    reg Mode;
    wire Result;
    wire CarryBorrow;

    adder_subtractor uut (
        .A(A),
        .B(B),
        .Mode(Mode),
        .Result(Result),
        .CarryBorrow(CarryBorrow)
    );

    initial begin
        // Monitor the inputs and outputs
        $monitor("A=%b, B=%b, Mode=%b, Result=%b, CarryBorrow=%b", A, B, Mode, Result, CarryBorrow);

        // Test Addition: A = 0, B = 0
        A = 0; B = 0; Mode = 0;
        #10;
        
        // Test Addition: A = 0, B = 1
        A = 0; B = 1; Mode = 0;
        #10;

        // Test Addition: A = 1, B = 0
        A = 1; B = 0; Mode = 0;
        #10;

        // Test Addition: A = 1, B = 1
        A = 1; B = 1; Mode = 0;
        #10;

        // Test Subtraction: A = 0, B = 0
        A = 0; B = 0; Mode = 1;
        #10;

        // Test Subtraction: A = 0, B = 1
        A = 0; B = 1; Mode = 1;
        #10;

        // Test Subtraction: A = 1, B = 0
        A = 1; B = 0; Mode = 1;
        #10;

        // Test Subtraction: A = 1, B = 1
        A = 1; B = 1; Mode = 1;
        #10;
        
        $finish;
    end
endmodule
