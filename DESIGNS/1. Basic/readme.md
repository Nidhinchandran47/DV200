### Hey there!

Hope you go through these basics:
- [AND](<1. AND Gate>)
- [OR](<2. OR Gate>)
- [NOT](<3. NOT Gate>)
- [NAND](<4. NAND Gate>)
- [NOR](<5. NOR Gate>)
- [XOR](<6. XOR Gate>)
- [XNOR](<7. XNOR Gate>)
- [Tri-State Buffer](<8. TRI-STATE Buffer>)

Then, Try out there questions:

## Verilog Basics Quiz 🧠💻

Test your Verilog knowledge with these 10 questions! Click on each question to reveal the answer.

<details>
<summary>1. What keyword is used to define a module in Verilog?
</summary>

**Answer:** `module`

The `module` keyword is used to define the beginning of a module in Verilog. For example:
```verilog
module my_module(
    input a,
    output b
);
    // Module contents go here
endmodule
```
</details>
.

<details>
   <summary>2. Which of the following is NOT a valid data type in Verilog?

   A.  `Real`    B.  `float` C. `reg` D. `wire`</summary>
**Answer**: `float`

Verilog does not have a built-in floating-point data type. The main data types in Verilog are:

- wire
- reg
- integer
- real (for simulation only)
- time

</details>
.

<details>

<summary>3. What is the difference between wire and reg in Verilog?</summary>

**Answer**: A `wire` represents a physical connection between components and cannot store a value, while a `reg` can store a value and is typically used in procedural blocks like always or initial.
</details>
.
<details>
<summary>4. Which keyword is used to create an instance of a module?</summary>

**Answer**: There is no specific keyword. To instantiate a module, you simply use the module name followed by an instance name and port connections. For example:
```verilog
my_module instance1 (
    .port1(wire1),
    .port2(wire2)
);
```
</details>
.
<details>
<summary>5. What is the purpose of the always block in Verilog?</summary>

**Answer**: The `always` block is used to describe sequential logic or combinational logic that should be evaluated whenever specified events occur. It's commonly used for describing flip-flops, latches, and combinational logic.
</details>
.
<details>
<summary>6. Which operator is used for bitwise AND in Verilog?</summary>

**Answer**: `&`

The **&** operator performs a bitwise AND operation. For example:
```verilog
wire [3:0] a = 4'b1010;
wire [3:0] b = 4'b1100;
wire [3:0] result = a & b; // result will be 4'b1000
```
</details>
.
<details>
<summary>7. What does the `@` symbol mean in an `always` block?</summary>

**Answer**: The @ symbol is used to specify the sensitivity list for an always block. It indicates when the block should be evaluated. For example:
```verilog
always @(posedge clk) // Triggered on the rising edge of clk
always @(*) // Triggered whenever any input changes (combinational logic)
```
</details>
.
<details>
<summary>8. How do you declare a 4-bit wide bus named `data` in Verilog?</summary>

**Answer**: `wire` [3:0] data; or `reg` [3:0] data;

The [3:0] specifies a 4-bit width, where bit 3 is the most significant bit and bit 0 is the least significant bit.
</details>
.
<details>
<summary>9. What is the purpose of the `initial` block in Verilog?</summary>

**Answer**: The initial block is used for simulation initialization. It executes only once at the beginning of the simulation and is not synthesizable for hardware. It's commonly used to set initial values for variables or to control simulation behavior.

Used for writing Testbenches

</details>
.
<details>
<summary>10. Which of the following is a valid way to create a 2-to-1 multiplexer in Verilog?</summary>

> [!NOTE]
> **DONT WORRY! IF YOU DONT KNOW THE ANSWER**
>
> **FOLLOW OUR NEXT MODULE** [**COMBINATIONAL**](<../2. Combinational>)
</details>
.

> [!IMPORTANT]
> **Remember**, practice makes perfect in Verilog programming. Keep coding and exploring!🎉

[🏄🏼‍♀️ NEXT](<../2. Combinational>)

[🏠 HOME](../../README.md)