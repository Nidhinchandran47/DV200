module decoder3to8 (
    input A0,
    input A1,
    input A2,
    input EN,
    output Y0,
    output Y1,
    output Y2,
    output Y3,
    output Y4,
    output Y5,
    output Y6,
    output Y7
);
    assign Y0 = EN & ~A2 & ~A1 & ~A0;
    assign Y1 = EN & ~A2 & ~A1 & A0;
    assign Y2 = EN & ~A2 & A1 & ~A0;
    assign Y3 = EN & ~A2 & A1 & A0;
    assign Y4 = EN & A2 & ~A1 & ~A0;
    assign Y5 = EN & A2 & ~A1 & A0;
    assign Y6 = EN & A2 & A1 & ~A0;
    assign Y7 = EN & A2 & A1 & A0;
endmodule