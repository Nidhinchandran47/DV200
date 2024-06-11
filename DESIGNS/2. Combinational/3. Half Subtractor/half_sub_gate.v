module half_subtractor (
    input A,
    input B,
    output Difference,
    output Borrow
);
    wire NotA;

    xor (Difference, A, B);  // XOR gate for difference
    not (NotA, A);           // NOT gate for A
    and (Borrow, NotA, B);   // AND gate for borrow
endmodule