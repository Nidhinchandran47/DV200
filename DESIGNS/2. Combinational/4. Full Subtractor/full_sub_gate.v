module full_subtractor (
    input A,
    input B,
    input Bin,
    output Difference,
    output Borrow
);
    wire Diff1, Borrow1, Borrow2;

    xor (Diff1, A, B);          // First XOR for intermediate difference
    xor (Difference, Diff1, Bin); // Second XOR for final difference
    and (Borrow1, ~A, B);       // First AND for borrow
    and (Borrow2, ~Diff1, Bin); // Second AND for borrow

    or (Borrow, Borrow1, Borrow2); // OR gate for final borrow
endmodule