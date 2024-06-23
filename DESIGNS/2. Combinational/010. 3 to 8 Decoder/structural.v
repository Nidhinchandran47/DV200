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
    wire nA0, nA1, nA2;

    not (nA0, A0);
    not (nA1, A1);
    not (nA2, A2);

    and (Y0, EN, nA2, nA1, nA0);
    and (Y1, EN, nA2, nA1, A0);
    and (Y2, EN, nA2, A1, nA0);
    and (Y3, EN, nA2, A1, A0);
    and (Y4, EN, A2, nA1, nA0);
    and (Y5, EN, A2, nA1, A0);
    and (Y6, EN, A2, A1, nA0);
    and (Y7, EN, A2, A1, A0);
endmodule