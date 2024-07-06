module demux1to8 (
    input D,
    input S0,
    input S1,
    input S2,
    input EN,
    output [7:0] Y
);
    assign Y[0] = EN & D & ~S2 & ~S1 & ~S0;
    assign Y[1] = EN & D & ~S2 & ~S1 & S0;
    assign Y[2] = EN & D & ~S2 & S1 & ~S0;
    assign Y[3] = EN & D & ~S2 & S1 & S0;
    assign Y[4] = EN & D & S2 & ~S1 & ~S0;
    assign Y[5] = EN & D & S2 & ~S1 & S0;
    assign Y[6] = EN & D & S2 & S1 & ~S0;
    assign Y[7] = EN & D & S2 & S1 & S0;
endmodule