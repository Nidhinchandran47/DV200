module adder_subtractor (
    input A,
    input B,
    input Mode,
    output Result,
    output CarryBorrow
);
    wire B_xor_Mode;
    wire Sum;
    wire Carry1, Carry2;

    // XOR B with Mode to implement two's complement for subtraction
    assign B_xor_Mode = B ^ Mode;

    // Perform addition
    assign Sum = A ^ B_xor_Mode ^ Mode;
    assign Carry1 = A & B_xor_Mode;
    assign Carry2 = (A ^ B_xor_Mode) & Mode;
    assign Result = Sum;
    assign CarryBorrow = Carry1 | Carry2;
endmodule