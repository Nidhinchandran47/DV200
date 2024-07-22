module test_bcd_to_7seg_74ls47;
    reg [3:0] bcd;
    reg RBI;
    wire [6:0] seg;
    wire RBO;

    bcd_to_7seg_74ls47 uut (
        .bcd(bcd),
        .RBI(RBI),
        .seg(seg),
        .RBO(RBO)
    );

    initial begin
        $monitor("BCD: %b, RBI: %b, Segments: %b, RBO: %b", bcd, RBI, seg, RBO);

        // Test BCD values from 0 to F with RBI = 0
        RBI = 0;
        bcd = 4'b0000; #10;
        bcd = 4'b0001; #10;
        bcd = 4'b0010; #10;
        bcd = 4'b0011; #10;
        bcd = 4'b0100; #10;
        bcd = 4'b0101; #10;
        bcd = 4'b0110; #10;
        bcd = 4'b0111; #10;
        bcd = 4'b1000; #10;
        bcd = 4'b1001; #10;
        bcd = 4'b1010; #10;
        bcd = 4'b1011; #10;
        bcd = 4'b1100; #10;
        bcd = 4'b1101; #10;
        bcd = 4'b1110; #10;
        bcd = 4'b1111; #10;

        // Test BCD 0 with RBI = 1
        RBI = 1;
        bcd = 4'b0000; #10;

        $finish;
    end
endmodule
