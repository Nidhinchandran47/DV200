module full_subtractor (
    input A,
    input B,
    input Bin,
    output reg Difference,
    output reg Borrow
);
    always @(*) begin
        Difference = A ^ B ^ Bin;                    // XOR for difference
        Borrow = (~A & (B | Bin)) | (B & Bin);       // Borrow logic
    end
endmodule