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

module not_gate (
    input A,
    output Y
);
    assign Y = ~A;
endmodule

module half_subtractor (
    input A,
    input B,
    output Difference,
    output Borrow
);
    wire NotA, Borrow_intermediate;

    xor_gate XOR1 (.A(A), .B(B), .Y(Difference));
    not_gate NOT1 (.A(A), .Y(NotA));
    and_gate AND1 (.A(NotA), .B(B), .Y(Borrow_intermediate));
    assign Borrow = Borrow_intermediate;
endmodule