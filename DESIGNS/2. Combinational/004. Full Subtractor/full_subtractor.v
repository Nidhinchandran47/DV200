module full_subtractor (
    input A,
    input B,
    input Bin,
    output Difference,
    output Borrow
);
    assign Difference = A ^ B ^ Bin;                   // XOR for difference
    assign Borrow = (~A & (B | Bin)) | (B & Bin);      // Borrow logic
endmodule