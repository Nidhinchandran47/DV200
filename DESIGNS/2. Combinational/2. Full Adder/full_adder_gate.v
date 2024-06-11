module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);
    wire Sum1, Carry1, Carry2;

    xor g1 (Sum1, A, B);     // First XOR for intermediate sum
    xor g2 (Sum, Sum1, Cin); // Second XOR for final sum
    and g3 (Carry1, A, B);   // First AND for carry
    and g4 (Carry2, Sum1, Cin); // Second AND for carry

    or g5 (Cout, Carry1, Carry2); // OR gate for final carry
endmodule