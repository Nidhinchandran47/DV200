module demux1to4 (
    input D,
    input S0,
    input S1,
    input EN,
    output Y0,
    output Y1,
    output Y2,
    output Y3
);
    wire nS0, nS1;

    not (nS0, S0);
    not (nS1, S1);

    and (Y0, EN, D, nS1, nS0);
    and (Y1, EN, D, nS1, S0);
    and (Y2, EN, D, S1, nS0);
    and (Y3, EN, D, S1, S0);
endmodule