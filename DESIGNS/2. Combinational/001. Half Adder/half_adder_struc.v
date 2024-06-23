module xor_gate (
    input A,
    input B,
    output Y
);
    assign Y = A ^ B;
endmodule

module and_gate (
    input A,
    input B,
    output Y
);
    assign Y = A & B;
endmodule

module half_adder (
    input A,
    input B,
    output Sum,
    output Carry
);
    xor_gate XOR1 (.A(A), .B(B), .Y(Sum));
    and_gate AND1 (.A(A), .B(B), .Y(Carry));
endmodule