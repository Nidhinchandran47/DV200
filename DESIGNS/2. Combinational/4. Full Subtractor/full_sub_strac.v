module half_subtractor (
    input A,
    input B,
    output Difference,
    output Borrow
);
    assign Difference = A ^ B;  // XOR for difference
    assign Borrow = ~A & B;     // AND and NOT for borrow
endmodule

module full_subtractor (
    input A,
    input B,
    input Bin,
    output Difference,
    output Borrow
);
    wire Diff1, Borrow1, Borrow2;

    half_subtractor HS1 (.A(A), .B(B), .Difference(Diff1), .Borrow(Borrow1));
    half_subtractor HS2 (.A(Diff1), .B(Bin), .Difference(Difference), .Borrow(Borrow2));

    assign Borrow = Borrow1 | Borrow2; // OR gate for final borrow
endmodule