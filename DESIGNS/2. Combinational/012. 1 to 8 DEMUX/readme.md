# 1-to-8 Demultiplexer

A 1-to-8 demultiplexer is a combinational circuit that takes a single input and distributes it to one of eight outputs based on 3 select inputs. It essentially routes the input data to one of the outputs.

#### Description
- **Inputs:**
  - `D`: Data input.
  - `S0`, `S1`, `S2`: Select inputs.
  - `EN`: Enable input.
- **Outputs:**
  - `Y0`, `Y1`, `Y2`, `Y3`, `Y4`, `Y5`, `Y6`, `Y7`: Outputs, where only one will carry the input data based on the select inputs.

#### Working
- The demultiplexer routes the data input `D` to one of the four outputs `Y` based on the combination of the select inputs `S0`, `S1` and `S2`.
  - When `EN` is `1`:
    - `S2 S1 S0` = `000` routes `D` to `Y0`
    - `S2 S1 S0` = `001` routes `D` to `Y1`
    - `S2 S1 S0` = `010` routes `D` to `Y2`
    - `S2 S1 S0` = `011` routes `D` to `Y3`
    - `S2 S1 S0` = `100` routes `D` to `Y4`
    - `S2 S1 S0` = `101` routes `D` to `Y5`
    - `S2 S1 S0` = `110` routes `D` to `Y6`
    - `S2 S1 S0` = `111` routes `D` to `Y7`
- If `EN` is `0`, all outputs are `0`.

#### Use Cases
- **Data Routing:** Routing data from a single source to multiple destinations.
- **Control Units:** Used in control units to manage data flow.
- **Communication Systems:** Directing signals to different paths.

#### Verilog Implementations

**1. Using Dataflow Modeling:**
```verilog
module demux1to8 (
    input D,
    input S0,
    input S1,
    input S2,
    input EN,
    output [7:0] Y
);
    assign Y[0] = EN & D & ~S2 & ~S1 & ~S0;
    assign Y[1] = EN & D & ~S2 & ~S1 & S0;
    assign Y[2] = EN & D & ~S2 & S1 & ~S0;
    assign Y[3] = EN & D & ~S2 & S1 & S0;
    assign Y[4] = EN & D & S2 & ~S1 & ~S0;
    assign Y[5] = EN & D & S2 & ~S1 & S0;
    assign Y[6] = EN & D & S2 & S1 & ~S0;
    assign Y[7] = EN & D & S2 & S1 & S0;
endmodule
```
[file here](dataflow.v) 👈🏼

**2. Using Behavioral Modeling:**
```verilog
module demux1to4 (
    input D,
    input S0,
    input S1,
    input S2,
    input EN,
    output [7:0] reg Y
);
    always @(*) begin
        if (EN) begin
            case ({S2, S1, S0})
                3'b000: Y = {8'h00, D};
                3'b001: Y = {8'h00, D} << 1;
                3'b010: Y = {8'h00, D} << 2;
                3'b011: Y = {8'h00, D} << 3;
                3'b100: Y = {8'h00, D} << 4;
                3'b101: Y = {8'h00, D} << 5;
                3'b110: Y = {8'h00, D} << 6;
                3'b111: Y = {8'h00, D} << 7;
                default: Y = 8'h00;
            endcase
        end else begin
            Y = 8'h00;
        end
    end
endmodule
```
[file here](behavioral.v) 👈🏼

**3. Using Structural Modeling:**
```verilog
module demux1to4 (
    input D,
    input S0,
    input S1,
    input S2,
    input EN,
    output [7:0] Y
);
    wire nS0, nS1, nS2;

    not (nS0, S0);
    not (nS1, S1);
    not (nS2, S2);
    and (Y[0], EN, D, nS2, nS1, nS0);
    and (Y[1], EN, D, nS2, nS1, S0);
    and (Y[2], EN, D, nS2, S1, nS0);
    and (Y[3], EN, D, nS2, S1, S0);
    and (Y[4], EN, D, S2, nS1, nS0);
    and (Y[5], EN, D, S2, nS1, S0);
    and (Y[6], EN, D, S2, S1, nS0);
    and (Y[7], EN, D, S2, S1, S0);
endmodule
```
[file here](structural.v) 👈🏼

#### Testbench
```verilog
module test_demux1to4;
    reg D;
    reg S0;
    reg S1;
    reg S2;
    reg EN;
    wire [7:0] Y;

    demux1to4 uut (
        .D(D),
        .S0(S0),
        .S1(S1),
        .S2(S2)
        .EN(EN),
        .Y(Y)
    );

    initial begin
        $monitor("S2=%b, S1=%b, S0=%b, EN=%b, D=%b, Y=%b",S2, S1, S0, EN, D, Y);

        // Test all possible input combinations
        EN = 1; D = 1;
        S2 = 0; S1 = 0; S0 = 0; #10;
        S2 = 0; S1 = 0; S0 = 1; #10;
        S2 = 0; S1 = 1; S0 = 0; #10;
        S2 = 0; S1 = 1; S0 = 1; #10;
        S2 = 1; S1 = 0; S0 = 0; #10;
        S2 = 1; S1 = 0; S0 = 1; #10;
        S2 = 1; S1 = 1; S0 = 0; #10;
        S2 = 1; S1 = 1; S0 = 1; #10;

        // Disable enable signal
        EN = 0; S2 = 1; S1 = 0; S0 = 0; D = 0; #10;
    end
endmodule
```
[Testbench file here](testbench.v) 👈🏼
