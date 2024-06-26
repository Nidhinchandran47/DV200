module test_demux1to4;
    reg D;
    reg S0;
    reg S1;
    reg EN;
    wire Y0;
    wire Y1;
    wire Y2;
    wire Y3;

    demux1to4 uut (
        .D(D),
        .S0(S0),
        .S1(S1),
        .EN(EN),
        .Y0(Y0),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3)
    );

    initial begin
        $monitor("S1=%b, S0=%b, EN=%b, D=%b, Y3=%b, Y2=%b, Y1=%b, Y0=%b", S1, S0, EN, D, Y3, Y2, Y1, Y0);

        // Test all possible input combinations
        EN = 1; D = 1;
        S1 = 0; S0 = 0; #10;
        S1 = 0; S0 = 1; #10;
        S1 = 1; S0 = 0; #10;
        S1 = 1; S0 = 1; #10;

        // Disable enable signal
        EN = 0; S1 = 0; S0 = 0; D = 0; #10;
    end
endmodule