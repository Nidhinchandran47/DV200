### 2-to-1 Multiplexer

A 2-to-1 multiplexer (MUX) is a digital circuit that selects one of the two input signals based on a single control (select) signal and forwards the selected input to the output. It is a fundamental building block in digital systems for routing data.

#### Description
- **Inputs:**
  - `I0`, `I1`: Data inputs.
  - `S`: Select input.
- **Output:**
  - `Y`: Output that reflects the selected input.

#### Working
- When `S` is 0, the output `Y` is equal to `I0`.
- When `S` is 1, the output `Y` is equal to `I1`.

#### Verilog Implementations

**1. Using Dataflow Modeling:**
```verilog
module mux2to1 (
    input I0,
    input I1,
    input S,
    output Y
);
    assign Y = S ? I1 : I0;
endmodule
```
[dataflow.v](dataflow.v)

**2. Using Behavioral Modeling:**
```verilog
module mux2to1 (
    input I0,
    input I1,
    input S,
    output reg Y
);
    always @(*) begin
        if (S)
            Y = I1;
        else
            Y = I0;
    end
endmodule
```
[behav.v](behav.v)
> [!NOTE]
> 1 and 2 can used to used to implement n bit wide or vector type MUXes. 

**3. Using Structural Modeling:**
```verilog
module mux2to1 (
    input I0,
    input I1,
    input S,
    output Y
);
    assign Y = (I0 & ~S) | (I1 & S);
endmodule
```
[struct.v](struct.v)

**4. Using Gate-Level Modeling:**
```verilog
module mux2to1 (
    input I0,
    input I1,
    input S,
    output Y
);
    wire nS, Y0, Y1;

    not (nS, S);
    and (Y0, I0, nS);
    and (Y1, I1, S);
    or (Y, Y0, Y1);
endmodule
```
[gate.v](gate.v)

#### Testbench
```verilog
module test_mux2to1;
    reg I0;
    reg I1;
    reg S;
    wire Y;

    mux2to1 uut (
        .I0(I0),
        .I1(I1),
        .S(S),
        .Y(Y)
    );

    initial begin
        $monitor("I0=%b, I1=%b, S=%b, Y=%b", I0, I1, S, Y);

        // Test case 1: S=0, I0=0, I1=0
        I0 = 0; I1 = 0; S = 0;
        #10;
        
        // Test case 2: S=0, I0=1, I1=0
        I0 = 1; I1 = 0; S = 0;
        #10;

        // Test case 3: S=0, I0=0, I1=1
        I0 = 0; I1 = 1; S = 0;
        #10;

        // Test case 4: S=0, I0=1, I1=1
        I0 = 1; I1 = 1; S = 0;
        #10;

        // Test case 5: S=1, I0=0, I1=0
        I0 = 0; I1 = 0; S = 1;
        #10;

        // Test case 6: S=1, I0=1, I1=0
        I0 = 1; I1 = 0; S = 1;
        #10;

        // Test case 7: S=1, I0=0, I1=1
        I0 = 0; I1 = 1; S = 1;
        #10;

        // Test case 8: S=1, I0=1, I1=1
        I0 = 1; I1 = 1; S = 1;
        #10;
        
        $finish;
    end
endmodule
```
[testbench.v](testbench.v)

### Explanation
- **2-to-1 Multiplexer Module:**
  - `I0`, `I1`: Data inputs.
  - `S`: Select input.
  - `Y`: Output reflecting the selected input.
  
- **Logic:**
  - **Dataflow Modeling:** Uses a ternary operator to choose between `I0` and `I1` based on `S`.
  - **Behavioral Modeling:** Uses an `always` block and an `if-else` statement for selection.
  - **Structural Modeling:** Uses basic gates (AND, OR, NOT) to construct the multiplexer.
  - **Gate-Level Modeling:** Uses logical expressions for direct implementation.

- **Testbench:**
  - Simulates different input combinations to verify the functionality of the 2-to-1 multiplexer.