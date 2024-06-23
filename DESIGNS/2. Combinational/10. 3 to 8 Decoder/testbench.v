module test_decoder3to8;
    reg A0;
    reg A1;
    reg A2;
    reg EN;
    wire Y0;
    wire Y1;
    wire Y2;
    wire Y3;
    wire Y4;
    wire Y5;
    wire Y6;
    wire Y7;

    decoder3to8 uut (
        .A0(A0),
        .A1(A1),
        .A2(A2),
        .EN(EN),
        .Y0(Y0),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3),
        .Y4(Y4),
        .Y5(Y5),
        .Y6(Y6),
        .Y7(Y7)
    );

    initial begin
        $monitor("A2=%b, A1=%b, A0=%b, EN=%b, Y7=%b, Y6=%b, Y5=%b, Y4=%b, Y3=%b, Y2=%b, Y1=%b, Y0=%b", A2, A1, A0, EN, Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0);

        // Test all possible input combinations
        EN = 1;
        A2 = 0; A1 = 0; A0 = 0; #10;
        A2 = 0; A1 = 0; A0 = 1; #10;
        A2 = 0; A1 = 1; A0 = 0; #10;
        A2 = 0; A1 = 1; A0 = 1; #10;
        A2 = 1; A1 = 0; A0 = 0; #10;
        A2 = 1; A1 = 0; A0 = 1; #10;
        A2 = 1; A1 = 1; A0 = 0; #10;
        A2 = 1; A1 = 1; A0 = 1; #10;

        // Disable enable signal
        EN = 0; A2 = 0; A1 = 0; A0 = 0; #10;
    end
endmodule