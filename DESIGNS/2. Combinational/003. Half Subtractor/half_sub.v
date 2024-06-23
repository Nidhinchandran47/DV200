module half_subtractor (
    input A,
    input B,
    output Difference,
    output Borrow
);
    assign Difference = A ^ B;  // XOR for difference
    assign Borrow = ~A & B;     // AND and NOT for borrow
endmodule