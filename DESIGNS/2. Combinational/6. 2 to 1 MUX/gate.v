module mux2to1 (
    input I0,
    input I1,
    input S,
    output Y
);
    wire nS, Y0, Y1;

    not (nS, S);
    and (Y0, I0, nS);
    and (Y1, I1, S);
    or (Y, Y0, Y1);
endmodule
