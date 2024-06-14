module mux2to1 (
    input I0,
    input I1,
    input S,
    output Y
);
    assign Y = (I0 & ~S) | (I1 & S);
endmodule
