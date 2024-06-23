module test_mux2to1;
    reg I0;
    reg I1;
    reg S;
    wire Y;

    mux2to1 uut (
        .I0(I0),
        .I1(I1),
        .S(S),
        .Y(Y)
    );

    initial begin
        $monitor("I0=%b, I1=%b, S=%b, Y=%b", I0, I1, S, Y);

        // Test case 1: S=0, I0=0, I1=0
        I0 = 0; I1 = 0; S = 0;
        #10;
        
        // Test case 2: S=0, I0=1, I1=0
        I0 = 1; I1 = 0; S = 0;
        #10;

        // Test case 3: S=0, I0=0, I1=1
        I0 = 0; I1 = 1; S = 0;
        #10;

        // Test case 4: S=0, I0=1, I1=1
        I0 = 1; I1 = 1; S = 0;
        #10;

        // Test case 5: S=1, I0=0, I1=0
        I0 = 0; I1 = 0; S = 1;
        #10;

        // Test case 6: S=1, I0=1, I1=0
        I0 = 1; I1 = 0; S = 1;
        #10;

        // Test case 7: S=1, I0=0, I1=1
        I0 = 0; I1 = 1; S = 1;
        #10;

        // Test case 8: S=1, I0=1, I1=1
        I0 = 1; I1 = 1; S = 1;
        #10;
        
        $finish;
    end
endmodule
