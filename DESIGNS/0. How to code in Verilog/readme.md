# 👣 How to code in Verilog ✍🏼

**Verilog is a hardware description language (HDL)** that was standardized as IEEE Std 1364-1995 and first revised as IEEE Std 1364-2001

 ### INDEX 📂

- [👣 How to code in Verilog ✍🏼](#-how-to-code-in-verilog-)
    - [INDEX 📂](#index-)
  - [Lexical Conventions 🔢](#lexical-conventions-)
  - [Data Type 🧩](#data-type-)
  - [Expression 🎲](#expression-)
  - [Assignments 🪄](#assignments-)
  - [Gate and Switch Level Modeling 🧱](#gate-and-switch-level-modeling-)
  - [User-Defined Primitives (UDP) 🎓](#user-defined-primitives-udp-)
  - [Behavioral Modeling 🎭](#behavioral-modeling-)
  - [Tasks and Functions 🧗🏼‍♀️](#tasks-and-functions-️)
  - [Hierarchical Structures🌲](#hierarchical-structures)
  - [Timing Checks ⌛](#timing-checks-)
  - [System Tasks and Functions 🔮](#system-tasks-and-functions-)
  - [Compiler Directives 🧜🏼‍♂️](#compiler-directives-️)

---
---


## Lexical Conventions 🔢 

Verilog HDL source text files shall be a stream of lexical tokens. A lexical token shall consist of one or more
characters. The layout of tokens in a source file shall be free format; that is, spaces and newlines shall not be
syntactically significant other than being token separators, except for escaped identifiers

|   Tokens    |
| :---------: |
| White space |
|  Comments   |
|  Operator   |
|   Numbers   |
|   String    |
| Identifier  |
|   Keyword   |

Here is more about [Lexical Tokens](Lexical%20Token.md)

---
---


## Data Type 🧩

The set of Verilog HDL data types is designed to represent the data storage and transmission elements found in digital hardware.

**The Verilog HDL value set consists of four basic values:**
> [!NOTE]
> **0** - represents a logic zero, or a false condition.
> 
> **1** - represents a logic one, or a true condition.
> 
> **x** - represents an unknown logic value.
> 
> **z** - represents a high-impedance state.

**There are two main groups of data types:**

> [!NOTE]
> **Variable** data types and the **Net** data types.

Here you can see more about [Data Type](Data%20type.md)

---
---

## Expression 🎲

An expression is a construct that combines operands with operators to produce a result that is a function of the values of the operands and the semantic meaning of the operator.

**An operand can be one of the following:**

-  Constant number (including real) or string
-  Parameter (including local and specify parameters)
- Parameter (not real) bit-select or part-select (including local and specify parameters)
- Net
- Net bit-select or part-select
- reg, integer, or time variable
- reg, integer, or time variable bit-select or part-select
- real or realtime variable
- Array element
- Array element (not real) bit-select or part-select
- A call to a user-defined function or system-defined function that returns any of the above

Here you can see more about [Operators](operators.md)

---
---

## Assignments 🪄

The assignment is the basic mechanism for placing values into nets and variables. There are two basic forms
of assignments:
- The continuous assignment, which assigns values to nets
- The procedural assignment, which assigns values to variables

> There are two additional forms of assignments, **assign/deassign** and **force/release**, which are called procedural continuous assignments.

An assignment consists of two parts, a left-hand side and a right-hand side, separated by the equals `( = )` character, execute in the order they are written and must complete before the next statement begins; or, in the case of nonblocking procedural assignment, the less-than-equals `( <= )` character pair, allow the next statement to execute without waiting for the current one to complete. The right-hand side can be any expression that evaluates to a value. The left-hand side indicates the variable to which the right-hand side value is to be assigned.

You can know more about [Assignments](assignment.md) here.

---
---

## Gate and Switch Level Modeling 🧱

There are build in primitives and switch which can be used to model hardware in verilog. 
There are 14 logic gates and 12 switches

| N input gates | N output gates | tri-state gates | pull gates | MOS switches | Bidirectional switches |
| ------------- | -------------- | --------------- | ---------- | ------------ | ---------------------- |
| and           | buf            | bufif0          | pulldown   | cmos         | rtran                  |
| nand          | not            | bufif1          | pullup     | nmos         | rtranif0               |
| nor           |                | notif0          |            | pmos         | rtranif1               |
| or            |                | notif1          |            | rcmos        | tran                   |
| xnor          |                |                 |            | rnmos        | tranif0                |
| or            |                |                 |            | rpmos        | tranif1                |

## User-Defined Primitives (UDP) 🎓

## Behavioral Modeling 🎭

## Tasks and Functions 🧗🏼‍♀️

## Hierarchical Structures🌲

## Timing Checks ⌛

## System Tasks and Functions 🔮

## Compiler Directives 🧜🏼‍♂️

