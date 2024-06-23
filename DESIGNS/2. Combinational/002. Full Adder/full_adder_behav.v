module full_adder (
    input A,
    input B,
    input Cin,
    output reg Sum,
    output reg Cout
);
    always @(*) begin
        Sum = A ^ B ^ Cin;    // XOR for sum
        Cout = (A & B) | (B & Cin) | (A & Cin);  // Carry logic
    end
endmodule