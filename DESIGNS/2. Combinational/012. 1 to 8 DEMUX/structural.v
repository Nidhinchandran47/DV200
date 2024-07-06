module demux1to4 (
    input D,
    input S0,
    input S1,
    input S2,
    input EN,
    output [7:0] Y
);
    wire nS0, nS1, nS2;

    not (nS0, S0);
    not (nS1, S1);
    not (nS2, S2);
    and (Y[0], EN, D, nS2, nS1, nS0);
    and (Y[1], EN, D, nS2, nS1, S0);
    and (Y[2], EN, D, nS2, S1, nS0);
    and (Y[3], EN, D, nS2, S1, S0);
    and (Y[4], EN, D, S2, nS1, nS0);
    and (Y[5], EN, D, S2, nS1, S0);
    and (Y[6], EN, D, S2, S1, nS0);
    and (Y[7], EN, D, S2, S1, S0);
endmodule