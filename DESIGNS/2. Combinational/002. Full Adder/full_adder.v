module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);
    assign Sum = A ^ B ^ Cin;    // XOR for sum
    assign Cout = (A & B) | (B & Cin) | (A & Cin);  // Carry logic
endmodule