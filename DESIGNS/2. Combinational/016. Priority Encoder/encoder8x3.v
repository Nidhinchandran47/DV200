module encoder8x3 (
    input [7:0] I,
    output [2:0] Y,
    output V
);
    wire [2:0] Y0, Y1;
    wire V0, V1;

    encoder4x2 M0 (
        .I(I[3:0]),
        .Y(Y0),
        .V(V0));

    encoder4x2 M1 (
        .I(I[7:4]),
        .Y(Y1),
        .V(V1));

    assign Y[1:0] = V1 ? Y1 : Y0;
    assign Y[2] = V1;
    assign V = V0 | V1;
endmodule