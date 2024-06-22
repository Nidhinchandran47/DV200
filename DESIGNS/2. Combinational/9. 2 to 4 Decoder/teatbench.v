module test_decoder2to4;
    reg A0;
    reg A1;
    reg EN;
    wire Y0;
    wire Y1;
    wire Y2;
    wire Y3;

    decoder2to4 uut (
        .A0(A0),
        .A1(A1),
        .EN(EN),
        .Y0(Y0),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3)
    );

    initial begin
        $monitor("A1=%b, A0=%b, EN=%b, Y3=%b, Y2=%b, Y1=%b, Y0=%b", A1, A0, EN, Y3, Y2, Y1, Y0);

        // Test all possible input combinations
        EN = 1;
        A1 = 0; A0 = 0; #10;
        A1 = 0; A0 = 1; #10;
        A1 = 1; A0 = 0; #10;
        A1 = 1; A0 = 1; #10;

        // Disable enable signal
        EN = 0; A1 = 0; A0 = 0; #10;
    end
endmodule