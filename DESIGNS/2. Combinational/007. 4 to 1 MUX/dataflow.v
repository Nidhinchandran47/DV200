module mux4to1 (
    input I0,
    input I1,
    input I2,
    input I3,
    input S0,
    input S1,
    output Y
);
    assign Y = (S1 ? (S0 ? I3 : I2) : (S0 ? I1 : I0));
endmodule