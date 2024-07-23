# Comparator

### Verilog Code for a Signed Bit Comparator

A signed bit comparator compares two signed numbers and determines their relationship (greater than, less than, or equal). Here’s a Verilog module for a signed bit comparator, followed by its testbench.

### Verilog Code
```verilog
module signed_comparator (
    input signed [3:0] A, // 4-bit signed input A
    input signed [3:0] B, // 4-bit signed input B
    output reg A_greater_B, // A > B
    output reg A_equal_B,   // A == B
    output reg A_less_B     // A < B
);

    always @(A or B) begin
        if (A > B) begin
            A_greater_B = 1;
            A_equal_B = 0;
            A_less_B = 0;
        end else if (A == B) begin
            A_greater_B = 0;
            A_equal_B = 1;
            A_less_B = 0;
        end else begin
            A_greater_B = 0;
            A_equal_B = 0;
            A_less_B = 1;
        end
    end

endmodule
```

### Testbench
```verilog
module test_signed_comparator;
    reg signed [3:0] A;
    reg signed [3:0] B;
    wire A_greater_B;
    wire A_equal_B;
    wire A_less_B;

    signed_comparator uut (
        .A(A),
        .B(B),
        .A_greater_B(A_greater_B),
        .A_equal_B(A_equal_B),
        .A_less_B(A_less_B)
    );

    initial begin
        $monitor("A = %d, B = %d, A > B = %b, A == B = %b, A < B = %b", A, B, A_greater_B, A_equal_B, A_less_B);
        
        // Test cases
        A = 4'd5; B = 4'd3; #10; // A > B
        A = 4'd2; B = 4'd2; #10; // A == B
        A = -4'd1; B = 4'd1; #10; // A < B
        A = -4'd4; B = -4'd3; #10; // A < B
        A = -4'd7; B = -4'd7; #10; // A == B
        A = 4'd0; B = 4'd0; #10; // A == B
        A = 4'd7; B = -4'd1; #10; // A > B

        $finish;
    end
endmodule
```

### Explanation
- **Signed Inputs:** The inputs `A` and `B` are defined as signed 4-bit values to allow for negative number comparison.
- **Outputs:** Three output signals indicate whether `A` is greater than, equal to, or less than `B`.
- **Comparison Logic:** Uses `if-else` statements within an always block to compare the signed inputs and set the appropriate output signals.
- **Testbench:** Tests various combinations of signed inputs to verify the comparator's functionality.

This module and testbench can be extended to accommodate larger bit-widths by adjusting the bit-widths of the inputs and outputs accordingly.