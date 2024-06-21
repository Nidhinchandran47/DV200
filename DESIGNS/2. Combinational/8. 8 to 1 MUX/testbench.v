module test_mux8to1;
    reg I0;
    reg I1;
    reg I2;
    reg I3;
    reg I4;
    reg I5;
    reg I6;
    reg I7;
    reg S0;
    reg S1;
    reg S2;
    wire Y;

    mux8to1 uut (
        .I0(I0),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .I5(I5),
        .I6(I6),
        .I7(I7),
        .S0(S0),
        .S1(S1),
        .S2(S2),
        .Y(Y)
    );

    initial begin
        $monitor("I0=%b, I1=%b, I2=%b, I3=%b, I4=%b, I5=%b, I6=%b, I7=%b, S2=%b, S1=%b, S0=%b, Y=%b", I0, I1, I2, I3, I4, I5, I6, I7, S2, S1, S0, Y);

        // Test all possible select line combinations
        // Test case 1: S2S1S0=000, I0=1
        I0 = 1; I1 = 0; I2 = 0; I3 = 0; I4 = 0; I5 = 0; I6 = 0; I7 = 0; S2 = 0; S1 = 0; S0 = 0;
        #10;

        // Test case 2: S2S1S0=001, I1=1
        I0 = 0; I1 = 1; I2 = 0; I3 = 0; I4 = 0; I5 = 0; I6 = 0; I7 = 0; S2 = 0; S1 = 0; S0 = 1;
        #10;

        // Test case 3: S2S1S0=010, I2=1
        I0 = 0; I1 = 0; I2 = 1; I3 = 0; I4 = 0; I5 = 0; I6 = 0; I7 = 0; S2 = 0; S1 = 1; S0 = 0;
        #10;

        // Test case 4: S2S1S0=011, I3=1
        I0 = 0; I1 = 0; I2 = 0; I3 = 1; I4 = 0; I5 = 0; I6 = 0; I7 = 0; S2 = 0; S1 = 1; S0 = 1;
        #10;

        // Test case 5: S2S1S0=100, I4=1
        I0 = 0; I1 = 0; I2 = 0; I3 = 0; I4 = 1; I5 = 0; I6 = 0; I7 = 0; S2 = 1; S1 = 0; S0 = 0;
        #10;

        // Test case 6: S2S1S0=101, I5=1
        I0 = 0; I1 = 0; I2 = 0; I3 = 0; I4 = 0; I5 = 1; I6 = 0; I7 = 0; S2 = 1; S1 = 0; S0 = 1;
        #10;


        $finish;
    end
endmodule