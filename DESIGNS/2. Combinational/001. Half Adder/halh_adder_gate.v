module half_adder (
    input A,
    input B,
    output Sum,
    output Carry
);
    xor (Sum, A, B);   // XOR gate for sum
    and (Carry, A, B); // AND gate for carry
endmodule
