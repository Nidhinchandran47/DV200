module half_subtractor (
    input A,
    input B,
    output reg Difference,
    output reg Borrow
);
    always @(*) begin
        Difference = A ^ B;  // XOR for difference
        Borrow = ~A & B;     // AND and NOT for borrow
    end
endmodule