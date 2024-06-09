module and_gate_primitive (
    input wire a,
    input wire b,
    output wire y
);
    xor (y, a, b);
endmodule
