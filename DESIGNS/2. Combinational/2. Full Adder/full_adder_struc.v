module half_adder (
    input A,
    input B,
    output Sum,
    output Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule

module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);
    wire Sum1, Carry1, Carry2;

    half_adder HA1 (.A(A), .B(B), .Sum(Sum1), .Carry(Carry1));
    half_adder HA2 (.A(Sum1), .B(Cin), .Sum(Sum), .Carry(Carry2));

    assign Cout = Carry1 | Carry2;
endmodule