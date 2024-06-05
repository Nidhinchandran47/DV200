# NOR Gate

#### Brief Description

A NOR gate is a fundamental digital logic gate that implements logical negation of an OR gate. It outputs false or low (0) if one of its inputs or both are true or high (1). If both inputs are false or low (0), the output is true or high. In essence, the NOR gate performs the negated addition operation in binary logic.

**Symbol:**

![alt text](image.png)

**Truth Table:**

| A | B | Y |
|---|---|---|
| 0 | 0 | 1 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 0 |

In Verilog, there are several ways to implement a NOR gate. Here are a few methods:

#### Implementation Methods

1. **Using `assign` Statement:**
   This is the most straightforward way to implement a NOR gate in Verilog using continuous assignment.

   > [nor_gate_assign](nor_gate_assign.v)


2. **Using `always` Block:**
   The `always` block is used for procedural assignments. This method is more illustrative for learning and complex logic, although not typical for simple gates.

   > [nor_gate_always](nor_gate_always.v)

3. **Using Behavioral Modeling:**
   This method leverages behavioral modeling, which is more descriptive and often used in higher-level design.

   > [nor_gate_behavioral](nor_gate_behavioral.v)

4. **Using Gate-Level Primitives:**
   Verilog provides built-in primitives for basic gates. Here’s how you can use the `not` primitive.

   > [nor_gate_primitive](nor_gate_primitive.v)

Each method has its specific use case depending on the complexity of the design and the designer’s preference. For simple gates, the `assign` statement is most commonly used due to its simplicity and clarity. For more complex designs, other methods like `always` blocks or behavioral modeling might be more appropriate.


## Properties of NOR Gate

A NOR gate is a digital logic gate that outputs true or high (1) only when all its inputs are false or low (0). It is the complement of the OR gate. Here are some key properties:

### Idempotent Law
- **Formula:** `A NOR A = NOT(A)`
- **Example:** If `A = 1`, then `1 NOR 1 = 0`.

### Identity Law
- **Formula:** `A NOR 0 = NOT(A)`
- **Example:** If `A = 0`, then `0 NOR 0 = 1`.

### Domination Law
- **Formula:** `A NOR 1 = 0`
- **Example:** Regardless of `A`, the result is always 0.

### Commutative Law
- **Formula:** `A NOR B = B NOR A`
- **Example:** `0 NOR 1 = 1 NOR 0 = 0`.

### Associative Law
- **Formula:** `(A NOR B) NOR C = A NOR (B NOR C)`
- **Example:** `(1 NOR 0) NOR 1 = 1 NOR (0 NOR 1) = 0`.

### Distributive Law
- **Formula:** `A NOR (B AND C) = (A NOR B) AND (A NOR C)`
- **Example:** `1 NOR (0 AND 1) = (1 NOR 0) AND (1 NOR 1) = 0 AND 0 = 0`.

### Absorption Law
- **Formula:** `A NOR (A OR B) = NOT(A)`
- **Example:** `1 NOR (1 OR 0) = NOT(1) = 0`.

### Negation Law
- **Formula:** `A NOR NOT(A) = 0`
- **Example:** If `A = 0`, then `0 NOR NOT(0) = 0 NOR 1 = 0`.

These properties are essential in digital logic design and are used to simplify and analyze complex logic circuits.

## Universal Gate Properties of NAND Gate

The NAND gate is known as a universal gate because any logic circuit can be implemented using only NAND gates. Here are some key properties:

### Inversion (NOT Gate)
- **Formula:** `A NOR A = NOT(A)`
- **Example:** If `A = 1`, then `1 NOR 1 = 0`.

### OR Gate
- **Formula:** `(A NOR B) NAND (A NOR B) = A OR B`
- **Example:** If `A = 1` and `B = 0`, then `(1 NOR 0) NOR (1 NOR 0) = 0 NOR 0 = 1`.

## AND Gate
- **Formula:** `(A NOR A) NOR (B NOR B) = A AND B`
- **Example:** If `A = 0` and `B = 1`, then `(0 NOR 0) NOR (1 NOR 1) = 1 NOR 0 = 0`.

## NAND Gate
- **Formula:** `((A NOR A) NOR (B NOR B)) NOR ((A NOR A) NOR (B NOR B)) = A NAND B`

These properties illustrate the versatility of the NOR gate in constructing any other type of gate, making it a fundamental building block in digital electronics.