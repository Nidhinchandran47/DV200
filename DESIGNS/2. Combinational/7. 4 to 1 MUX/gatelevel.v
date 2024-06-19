module mux4to1 (
    input I0,
    input I1,
    input I2,
    input I3,
    input S0,
    input S1,
    output Y
);
    wire nS0, nS1;
    wire Y0, Y1, Y2, Y3;

    not (nS0, S0);
    not (nS1, S1);

    and (Y0, I0, nS1, nS0);
    and (Y1, I1, nS1, S0);
    and (Y2, I2, S1, nS0);
    and (Y3, I3, S1, S0);

    or (Y, Y0, Y1, Y2, Y3);
endmodule
