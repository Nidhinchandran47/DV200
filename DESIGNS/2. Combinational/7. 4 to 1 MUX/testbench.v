module test_mux4to1;
    reg I0;
    reg I1;
    reg I2;
    reg I3;
    reg S0;
    reg S1;
    wire Y;

    mux4to1 uut (
        .I0(I0),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .S0(S0),
        .S1(S1),
        .Y(Y)
    );

    initial begin
        $monitor("I0=%b, I1=%b, I2=%b, I3=%b, S1=%b, S0=%b, Y=%b", I0, I1, I2, I3, S1, S0, Y);

        // Test case 1: S1S0=00, I0=0, I1=0, I2=0, I3=0
        I0 = 0; I1 = 0; I2 = 0; I3 = 0; S1 = 0; S0 = 0;
        #10;

        // Test case 2: S1S0=00, I0=1, I1=0, I2=0, I3=0
        I0 = 1; I1 = 0; I2 = 0; I3 = 0; S1 = 0; S0 = 0;
        #10;

        // Test case 3: S1S0=01, I0=0, I1=1, I2=0, I3=0
        I0 = 0; I1 = 1; I2 = 0; I3 = 0; S1 = 0; S0 = 1;
        #10;

        // Test case 4: S1S0=10, I0=0, I1=0, I2=1, I3=0
        I0 = 0; I1 = 0; I2 = 1; I3 = 0; S1 = 1; S0 = 0;
        #10;

        // Test case 5: S1S0=11, I0=0, I1=0, I2=0, I3=1
        I0 = 0; I1 = 0; I2 = 0; I3 = 1; S1 = 1; S0 = 1;
        #10;

        $finish;
    end
endmodule