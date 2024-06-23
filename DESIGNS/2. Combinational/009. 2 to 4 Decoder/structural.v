module decoder2to4 (
    input A0,
    input A1,
    input EN,
    output Y0,
    output Y1,
    output Y2,
    output Y3
);
    wire nA0, nA1;

    not (nA0, A0);
    not (nA1, A1);

    and (Y0, EN, nA1, nA0);
    and (Y1, EN, nA1, A0);
    and (Y2, EN, A1, nA0);
    and (Y3, EN, A1, A0);
endmodule