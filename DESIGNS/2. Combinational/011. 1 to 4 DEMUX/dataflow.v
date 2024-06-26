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
    assign Y0 = EN & D & ~S1 & ~S0;
    assign Y1 = EN & D & ~S1 & S0;
    assign Y2 = EN & D & S1 & ~S0;
    assign Y3 = EN & D & S1 & S0;
endmodule