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
    assign Y = (S2 ? (S1 ? (S0 ? I7 : I6) : (S0 ? I5 : I4)) : (S1 ? (S0 ? I3 : I2) : (S0 ? I1 : I0)));
endmodule