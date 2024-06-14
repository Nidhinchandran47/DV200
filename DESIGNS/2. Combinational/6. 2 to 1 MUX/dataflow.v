module mux2to1 (
    input I0,
    input I1,
    input S,
    output Y
);
    assign Y = S ? I1 : I0;
endmodule
