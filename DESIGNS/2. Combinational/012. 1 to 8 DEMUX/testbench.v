module test_demux1to4;
    reg D;
    reg S0;
    reg S1;
    reg S2;
    reg EN;
    wire [7:0] Y;

    demux1to4 uut (
        .D(D),
        .S0(S0),
        .S1(S1),
        .S2(S2)
        .EN(EN),
        .Y(Y)
    );

    initial begin
        $monitor("S2=%b, S1=%b, S0=%b, EN=%b, D=%b, Y=%b",S2, S1, S0, EN, D, Y);

        // Test all possible input combinations
        EN = 1; D = 1;
        S2 = 0; S1 = 0; S0 = 0; #10;
        S2 = 0; S1 = 0; S0 = 1; #10;
        S2 = 0; S1 = 1; S0 = 0; #10;
        S2 = 0; S1 = 1; S0 = 1; #10;
        S2 = 1; S1 = 0; S0 = 0; #10;
        S2 = 1; S1 = 0; S0 = 1; #10;
        S2 = 1; S1 = 1; S0 = 0; #10;
        S2 = 1; S1 = 1; S0 = 1; #10;

        // Disable enable signal
        EN = 0; S2 = 1; S1 = 0; S0 = 0; D = 0; #10;
    end
endmodule