# ⭕ Assignments

[Home🏠](readme.md)

The assignment is the basic mechanism for placing values into nets and variables. There are two basic forms of assignments:
- The continuous assignment, which assigns values to nets.
-  The procedural assignment, which assigns values to variables.
  
There are two additional forms of assignments, assign/deassign and force/release, which are called procedural continuous assignments.

An assignment consists of two parts, a left-hand side and a right-hand side, separated by the equals ( = ) character; or, in the case of nonblocking procedural assignment, the less-than-equals ( <= ) character pair. The right-hand side can be any expression that evaluates to a value. The left-hand side indicates the variable to which the right-hand side value is to be assigned. 

**Statement type --  left-hand side** 

**Continuous assignment**

- Net (vector or scalar)
- Constant bit-select of a vector net
- Constant part-select of a vector net
- Constant indexed part-select of a vector net
- Concatenation or nested concatenation of any of the above left-hand side

**Procedural assignment**

- Variables (vector or scalar)
- Bit-select of a vector reg, integer, or time variable
- Constant part-select of a vector reg, integer, or time variable
- Indexed part-select of a vector reg, integer, or time variable
- Memory word
- Concatenation or nested concatenation of any of the above left-hand side


## Continuous assignments

Continuous assignments shall drive values onto nets, both vector and scalar. This assignment shall occur whenever the value of the right-hand side changes. Continuous assignments provide a way to model combinational logic without specifying an interconnection of gates. Instead, the model specifies the logical expression that drives the net.

#### Delay

A delay given to a continuous assignment shall specify the time duration between a right-hand operand value change and the assignment made to the left-hand side. If the left-hand references a scalar net, then the delay shall be treated in the same way as for gate delays; that is, different delays can be given for the output rising, falling, and changing to high impedance

If the left-hand references a vector net, then up to three delays can be applied. The following rules determine
which delay controls the assignment
- If the right-hand side makes a transition from nonzero to zero, then the falling delay shall be used.
-  If the right-hand side makes a transition to z, then the turn-off delay shall be used.
-  For all other cases, the rising delay shall be used.
  
```verilog
wire #10 wireA;
```

##  Procedural Assignments

Continuous assignments drive nets in a manner similar to the way gates drive nets. The expression on the right-hand side can be thought of as a combinatorial circuit that drives the net continuously. In contrast, procedural assignments put values in variables. The assignment does not have duration; instead, the variable holds the value of the assignment until the next procedural assignment to that variable.


Procedural assignments occur within procedures such as **always**, **initial**,  **task**, and **function** and can be thought of as “triggered” assignments. The trigger occurs when the flow of execution in the simulation reaches an assignment within a procedure. Reaching the assignment can be controlled by conditional statements. Event controls, delay controls, **if** statements, **case** statements, and looping statements can all be used to control whether assignments are evaluated.

[Home🏠](readme.md)