## ⭕ Data Type 

[Home🏠](readme.md)

The set of Verilog HDL data types is designed to represent the data storage and transmission elements found in digital hardware.

The Verilog HDL value set consists of four basic values:

- **0** - represents a logic zero, or a false condition
- **1** - represents a logic one, or a true condition
- **x** - represents an unknown logic value
- **z** - represents a high-impedance state

> [!TIP]
>There are two main groups of data types: the **variable** data types and the **net** data types.

##  Net declarations

The net data types can represent physical connections between structural entities, such as gates. A net shall not store a value.Instead, its value shall be determined by the values of its drivers, such as a continuous assignment or a gate.  . If no driver is connected to a net, its value shall be high-impedance (z). The default initialization value for a net shall be the value z.

Examples: `supply0 | supply1
| tri | triand | trior | tri0 | tri1 | uwire | wire | wand | wor`

[More about net in details](#net-type)

###  Variable declarations

A variable is an abstraction of a data storage element. A variable shall store a value from one assignment to the next. An assignment statement in a procedure acts as a trigger that changes the value in the data storage element. The initialization value for **reg, time, and integer** data types shall be the unknown value, x. The default initialization value for **real and realtime** variable data types shall be 0.0.

> [!NOTE]
> In previous versions of this standard, the term *register* was used to encompass the reg, integer, time, real, andrealtime types, but that term is no longer used as a Verilog data type.

> [!CAUTION]
> Nets and variables can be assigned negative values, but only integer, real, realtime, and signed reg variables and signed nets shall retain the significance of the sign. Time and unsigned reg variables and unsigned nets shall treat the value assigned to them as an unsigned value. 

### **Vector**

A *net* or *reg* declaration without a range specification shall be considered 1 bit wide and is known as a **scalar**. Multibit net and reg data types shall be declared by specifying a range, which is known as a **vector**.

```verilog
wand w;                       // a scalar net of type "wand"
tri [15:0] busa;              // a three-state 16-bit bus
trireg (small) storeit;       // a charge storage node of strength small
reg a;                        // a scalar reg
reg[3:0] v;                   // a 4-bit vector reg made up of (from most to 
                              // least significant)v[3], v[2], v[1], and v[0]
reg signed [3:0] signed_reg;  // a 4-bit vector in range -8 to 7
reg [-1:4] b;                 // a 6-bit vector reg
wire w1, w2;                  // declares two wires
reg [4:0] x, y, z;            // declares three 5-bit regs
```

### **Strengths**

Two types of strengths can be specified in a net declaration as follows:

- Charge strength shall only be used when declaring a net of type trireg.
- Drive strength shall only be used when placing a continuous assignment on a net in the same statement that declares the net.

Different strengths are
- Small
- Medium
- Large

Default strength of **trireg** net is **medium**

```verilog
trireg a;                        // trireg net of charge strength medium
trireg (large) #(0,0,50) cap1;   // trireg net of charge strength large
                                 // with charge decay time 50 time units
trireg (small)signed [3:0] cap2; // signed 4-bit trireg vector of
                                 // charge strength small 
```

#### Drive Strength

The Verilog HDL provides for accurate modeling of signal contention, bidirectional pass gates, resistive MOS devices, dynamic MOS, charge sharing, and other technology-dependent network configurations by allowing scalar net signal values to have a full range of unknown values and different levels of strength or combinations of levels of strength. This multiple-level logic strength modeling resolves combinations of signals into known or unknown values to represent the behavior of hardware with improved accuracy.

| **Strength Name** | **Strength Level** |
| ---  | :---: |
| supply0 | 7 |
| strong0 | 6 | 
| pull0 | 5 |
| large0 | 4 |
| weak0 | 3 |
| medium0 | 2 |
| small0 | 1 |
| highz0 | 0 |
| highz1 | 0 |
| small1 | 1 |
| medium1 | 2 |
| weak1 | 3 |
| large1 | 4 |
| pull1 | 5 |
| strong1 | 6 |
| supply1 | 7 |

![alt text](image.png)

Combining unequal strengths

![alt text](image-1.png)

![alt text](image-2.png)

Combination of signals of equal strength and opposite values

###  Net Type

![alt text](image-3.png)

The `wire` and `tri` nets connect elements. The net types `wire` and `tri` shall be identical in their syntax and functions; two names are provided so that the name of a net can indicate the purpose of the net in that model. A `wire` net can be used for nets that are driven by a single gate or continuous assignment. The `tri` net type can be used where multiple drivers drive a net.

![alt text](image-4.png)

Wired nets are of type wor, wand, trior, and triand and are used to model wired logic configurations. Wired nets use different truth tables to resolve the conflicts that result when multiple drivers drive the same net. The `wor` and `trior` nets shall create wired or configurations so that when any of the drivers is 1, the resulting value of the net is 1. The `wand` and `triand` nets shall create wired and configurations so that if any driver is 0, the value of the net is 0

![alt text](image-5.png)![alt text](image-6.png)

## Regs

Assignments to a reg are made by procedural assignments. See [assignment](assignment.md).  Because the reg holds a value between assignments, it can be used to model hardware registers. Edge-sensitive (i.e., flip-flops) and level-sensitive (i.e., reset-set and transparent latches) storage elements can be modeled. A reg need not represent a hardware storage element because it can also be used to represent combinatorial logic. 

### **Parameters**

Verilog HDL parameters do not belong to either the variable or the net group. Parameters are not variables; they are constants. There are two types of parameters: module parameters and specify parameters.

```verilog
parameter msb = 7;                 // defines msb as a constant value 7
parameter e = 25, f = 9;           // defines two constant numbers
parameter r = 5.7;                 // declares r as a real parameter
parameter [31:0] dec_const = 1'b1; // value converted to 32 bits
parameter newconst = 3'h4;         // implied range of [2:0]
parameter newconst = 4;            // implied range of at least [31:0]
```

**localparam** are identical to parameters except that they cannot directly be modified by **defparam** statements or module instance parameter value assignments.

The keyword **specparam** declares a special type of parameter that is intended only for providing timing and delay values, but can appear in any expression that is not assigned to a parameter and is not part of the range
specification of a declaration.


[Home🏠](readme.md)