### 1-Bit Adder-Subtractor

A 1-bit adder-subtractor is a combinational circuit that can perform both addition and subtraction on two 1-bit binary numbers. The operation mode (addition or subtraction) is controlled by a mode selector input.

#### Description
- **Inputs:**
  - A, B: 1-bit binary numbers.
  - Mode: Operation mode selector (0 for addition, 1 for subtraction).
- **Outputs:**
  - Result: Sum or difference of A and B.
  - Carry/Borrow: Carry out for addition or borrow for subtraction.

#### Working
- When the Mode is 0, the circuit performs addition using a full adder.
- When the Mode is 1, the circuit performs subtraction by adding A to the two's complement of B.

#### Truth Table

| Mode | A | B | Result | Carry/Borrow |
|:----:|:---:|:---:|:----:|:----------:|
| 0 | 0 | 0 | 0 | 0|
| 0 | 0 | 1 | 1 | 0|
| 0 | 1 | 0 | 1 | 0|
| 0 | 1 | 1 | 0 | 1|
| 1 | 0 | 0 | 0 | 0|
| 1 | 0 | 1 | 1 | 1|
| 1 | 1 | 0 | 1 | 0|
| 1 | 1 | 1 | 0 | 0|



#### Verilog Code
```verilog
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
```
[adder_sutractor.v](adder_sutractor.v)

#### Testbench
```verilog
module test_adder_subtractor;
    reg A;
    reg B;
    reg Mode;
    wire Result;
    wire CarryBorrow;

    adder_subtractor uut (
        .A(A),
        .B(B),
        .Mode(Mode),
        .Result(Result),
        .CarryBorrow(CarryBorrow)
    );

    initial begin
        // Monitor the inputs and outputs
        $monitor("A=%b, B=%b, Mode=%b, Result=%b, CarryBorrow=%b", A, B, Mode, Result, CarryBorrow);

        // Test Addition: A = 0, B = 0
        A = 0; B = 0; Mode = 0;
        #10;
        
        // Test Addition: A = 0, B = 1
        A = 0; B = 1; Mode = 0;
        #10;

        // Test Addition: A = 1, B = 0
        A = 1; B = 0; Mode = 0;
        #10;

        // Test Addition: A = 1, B = 1
        A = 1; B = 1; Mode = 0;
        #10;

        // Test Subtraction: A = 0, B = 0
        A = 0; B = 0; Mode = 1;
        #10;

        // Test Subtraction: A = 0, B = 1
        A = 0; B = 1; Mode = 1;
        #10;

        // Test Subtraction: A = 1, B = 0
        A = 1; B = 0; Mode = 1;
        #10;

        // Test Subtraction: A = 1, B = 1
        A = 1; B = 1; Mode = 1;
        #10;
        
        $finish;
    end
endmodule
```
[test_adder_subtractor.v](test_adder_subtractor.v)

### Explanation
- **Adder-Subtractor Module:**
  - `A`, `B`: Input bits.
  - `Mode`: Determines if the operation is addition (0) or subtraction (1).
  - `Result`: Output bit for sum or difference.
  - `CarryBorrow`: Output bit for carry in addition or borrow in subtraction.

- **Logic:**
  - `B_xor_Mode`: B is XORed with Mode to achieve two's complement for subtraction.
  - The `Sum` is calculated using XOR and the `CarryBorrow` is determined by combining intermediate carries.

- **Testbench:**
  - Simulates different input combinations to verify the functionality of the adder-subtractor for both addition and subtraction modes.
