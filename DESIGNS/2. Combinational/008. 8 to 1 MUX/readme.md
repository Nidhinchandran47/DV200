# 8-to-1 Multiplexer

An 8-to-1 multiplexer (MUX) is a digital circuit that selects one of the eight input signals based on a three-bit select signal and forwards the selected input to the output. This type of multiplexer is essential for routing data in more complex digital systems.

#### Description
- **Inputs:**
  - `I0`, `I1`, `I2`, `I3`, `I4`, `I5`, `I6`, `I7`: Data inputs.
  - `S0`, `S1`, `S2`: Select inputs.
- **Output:**
  - `Y`: Output that reflects the selected input.

#### Working
- The output `Y` is determined by the select lines `S0`, `S1`, and `S2`.
  - When `S2S1S0` is `000`, `Y` is `I0`.
  - When `S2S1S0` is `001`, `Y` is `I1`.
  - When `S2S1S0` is `010`, `Y` is `I2`.
  - When `S2S1S0` is `011`, `Y` is `I3`.
  - When `S2S1S0` is `100`, `Y` is `I4`.
  - When `S2S1S0` is `101`, `Y` is `I5`.
  - When `S2S1S0` is `110`, `Y` is `I6`.
  - When `S2S1S0` is `111`, `Y` is `I7`.

$$
Y = \overline{S_2}\overline{S_1}\overline{S_0}I_0 + \overline{S_2}\overline{S_1}S_0I_1 + \overline{S_2}S_1\overline{S_0}I_2 + \overline{S_2}S_1S_0I_3 + S_2\overline{S_1}\overline{S_0}I_4 + S_2\overline{S_1}S_0I_5 + S_2S_1\overline{S_0}I_6 + S_2S_1S_0I_7
$$

#### Use Cases
- **Data Selection:** Selecting one of the multiple data sources.
- **Signal Routing:** Directing signals to different parts of a circuit.
- **Arithmetic Operations:** Used in arithmetic logic units (ALUs).
- **Memory Addressing:** Selecting memory addresses in memory management.

## Verilog Implementations

**1. Using Dataflow Modeling:**
```verilog
module mux8to1 (
    input I0,
    input I1,
    input I2,
    input I3,
    input I4,
    input I5,
    input I6,
    input I7,
    input S0,
    input S1,
    input S2,
    output Y
);
    assign Y = (S2 ? (S1 ? (S0 ? I7 : I6) : (S0 ? I5 : I4)) : (S1 ? (S0 ? I3 : I2) : (S0 ? I1 : I0)));
endmodule
```
[dataflow.v](dataflow.v)

**2. Using Behavioral Modeling:**
```verilog
module mux8to1 (
    input I0,
    input I1,
    input I2,
    input I3,
    input I4,
    input I5,
    input I6,
    input I7,
    input S0,
    input S1,
    input S2,
    output reg Y
);
    always @(*) begin
        case ({S2, S1, S0})
            3'b000: Y = I0;
            3'b001: Y = I1;
            3'b010: Y = I2;
            3'b011: Y = I3;
            3'b100: Y = I4;
            3'b101: Y = I5;
            3'b110: Y = I6;
            3'b111: Y = I7;
            default: Y = 0;
        endcase
    end
endmodule
```
[behavioral.v](behavioral.v)

**3. Using Structural Modeling with 2:1 Multiplexers:**
```verilog
module mux2to1 (
    input A,
    input B,
    input S,
    output Y
);
    assign Y = S ? B : A;
endmodule

module mux4to1 (
    input I0,
    input I1,
    input I2,
    input I3,
    input S0,
    input S1,
    output Y
);
    wire Y0, Y1;

    mux2to1 mux0 (.A(I0), .B(I1), .S(S0), .Y(Y0));
    mux2to1 mux1 (.A(I2), .B(I3), .S(S0), .Y(Y1));
    mux2to1 mux2 (.A(Y0), .B(Y1), .S(S1), .Y(Y));
endmodule

module mux8to1 (
    input I0,
    input I1,
    input I2,
    input I3,
    input I4,
    input I5,
    input I6,
    input I7,
    input S0,
    input S1,
    input S2,
    output Y
);
    wire Y0, Y1;

    mux4to1 mux0 (.I0(I0), .I1(I1), .I2(I2), .I3(I3), .S0(S0), .S1(S1), .Y(Y0));
    mux4to1 mux1 (.I0(I4), .I1(I5), .I2(I6), .I3(I7), .S0(S0), .S1(S1), .Y(Y1));
    mux2to1 mux2 (.A(Y0), .B(Y1), .S(S2), .Y(Y));
endmodule
```
[Using 2 to 1 MUX](structural2to1.v)

**4. Using Structural Modeling with 4:1 Multiplexers:**
```verilog
module mux4to1 (
    input I0,
    input I1,
    input I2,
    input I3,
    input S0,
    input S1,
    output Y
);
    assign Y = (S1 ? (S0 ? I3 : I2) : (S0 ? I1 : I0));
endmodule

module mux8to1 (
    input I0,
    input I1,
    input I2,
    input I3,
    input I4,
    input I5,
    input I6,
    input I7,
    input S0,
    input S1,
    input S2,
    output Y
);
    wire Y0, Y1;

    mux4to1 mux0 (.I0(I0), .I1(I1), .I2(I2), .I3(I3), .S0(S0), .S1(S1), .Y(Y0));
    mux4to1 mux1 (.I0(I4), .I1(I5), .I2(I6), .I3(I7), .S0(S0), .S1(S1), .Y(Y1));
    mux2to1 mux2 (.A(Y0), .B(Y1), .S(S2), .Y(Y));
endmodule
```
[Using 4 to 1 Mux](structral4to1.v)

#### Testbench
```verilog
module test_mux8to1;
    reg I0;
    reg I1;
    reg I2;
    reg I3;
    reg I4;
    reg I5;
    reg I6;
    reg I7;
    reg S0;
    reg S1;
    reg S2;
    wire Y;

    mux8to1 uut (
        .I0(I0),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .I5(I5),
        .I6(I6),
        .I7(I7),
        .S0(S0),
        .S1(S1),
        .S2(S2),
        .Y(Y)
    );

    initial begin
        $monitor("I0=%b, I1=%b, I2=%b, I3=%b, I4=%b, I5=%b, I6=%b, I7=%b, S2=%b, S1=%b, S0=%b, Y=%b", I0, I1, I2, I3, I4, I5, I6, I7, S2, S1, S0, Y);

        // Test all possible select line combinations
        // Test case 1: S2S1S0=000, I0=1
        I0 = 1; I1 = 0; I2 = 0; I3 = 0; I4 = 0; I5 = 0; I6 = 0; I7 = 0; S2 = 0; S1 = 0; S0 = 0;
        #10;

        // Test case 2: S2S1S0=001, I1=1
        I0 = 0; I1 = 1; I2 = 0; I3 = 0; I4 = 0; I5 = 0; I6 = 0; I7 = 0; S2 = 0; S1 = 0; S0 = 1;
        #10;

        // Test case 3: S2S1S0=010, I2=1
        I0 = 0; I1 = 0; I2 = 1; I3 = 0; I4 = 0; I5 = 0; I6 = 0; I7 = 0; S2 = 0; S1 = 1; S0 = 0;
        #10;

        // Test case 4: S2S1S0=011, I3=1
        I0 = 0; I1 = 0; I2 = 0; I3 = 1; I4 = 0; I5 = 0; I6 = 0; I7 = 0; S2 = 0; S1 = 1; S0 = 1;
        #10;

        // Test case 5: S2S1S0=100, I4=1
        I0 = 0; I1 = 0; I2 = 0; I3 = 0; I4 = 1; I5 = 0; I6 = 0; I7 = 0; S2 = 1; S1 = 0; S0 = 0;
        #10;

        // Test case 6: S2S1S0=101, I5=1
        I0 = 0; I1 = 0; I2 = 0; I3 = 0; I4 = 0; I5 = 1; I6 = 0; I7 = 0; S2 = 1; S1 = 0; S0 = 1;
        #10;


        $finish;
    end
endmodule
```
[testbench.v](testbench.v)
