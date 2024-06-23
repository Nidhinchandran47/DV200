module mux2to1 (
    input A,
    input B,
    input S,
    output Y
);
    assign Y = S ? B : A;
endmodule

module mux4to1 (
    input I0,
    input I1,
    input I2,
    input I3,
    input S0,
    input S1,
    output Y
);
    wire Y0, Y1;

    mux2to1 mux0 (.A(I0), .B(I1), .S(S0), .Y(Y0));
    mux2to1 mux1 (.A(I2), .B(I3), .S(S0), .Y(Y1));
    mux2to1 mux2 (.A(Y0), .B(Y1), .S(S1), .Y(Y));
endmodule

module mux8to1 (
    input I0,
    input I1,
    input I2,
    input I3,
    input I4,
    input I5,
    input I6,
    input I7,
    input S0,
    input S1,
    input S2,
    output Y
);
    wire Y0, Y1;

    mux4to1 mux0 (.I0(I0), .I1(I1), .I2(I2), .I3(I3), .S0(S0), .S1(S1), .Y(Y0));
    mux4to1 mux1 (.I0(I4), .I1(I5), .I2(I6), .I3(I7), .S0(S0), .S1(S1), .Y(Y1));
    mux2to1 mux2 (.A(Y0), .B(Y1), .S(S2), .Y(Y));
endmodule