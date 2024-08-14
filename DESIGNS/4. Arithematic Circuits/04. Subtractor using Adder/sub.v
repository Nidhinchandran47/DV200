module sub (
    input [3:0] A, B,
    output [3:0] Difference,
    output Borrow
);
    wire [3:0] B_complement;
    wire Carry;

    // Generate two's complement of B
    assign B_complement = ~B + 4'b0001;

    // Perform A - B by adding A and the two's complement of B
    //
    // Here you can either instantiate riplle carry adder module 
    //
    assign {Carry, Difference} = A + B_complement;

    // Borrow occurs if Carry is not generated (in this case, Carry is 1)
    assign Borrow = ~Carry;

endmodule
