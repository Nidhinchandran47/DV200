module decoder2to4 (
    input A0,
    input A1,
    input EN,
    output Y0,
    output Y1,
    output Y2,
    output Y3
);
    assign Y0 = EN & ~A1 & ~A0;
    assign Y1 = EN & ~A1 & A0;
    assign Y2 = EN & A1 & ~A0;
    assign Y3 = EN & A1 & A0;
endmodule