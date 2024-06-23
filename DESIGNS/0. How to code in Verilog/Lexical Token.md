## ⭕ Lexical Token 

[Home🏠](readme.md)


## White Space

White space shall contain the characters for spaces, tabs, newlines, and formfeeds. These characters shall be ignored except when they serve to separate other lexical tokens. However, blanks and tabs shall be considered significant characters in strings

## Comments

The Verilog HDL has two forms to introduce comments. A one-line comment shall start with the two characters // and end with a newline.

```verilog
// this line is a comment
This is not!
// Again this is comment
```

A block comment shall start with /* and end with */. Block comments shall not be nested.

```verilog
/* This line is comment
this too..
and this toooo...*/
But not this
```
look! above `not` and `this` and in different colour. Thats due to there are [keywords]().

## Operators

perators are single-, double-, or triple-character sequences and are used in expressions. There are discussed in detail in [Expressions](). Unary operators shall appear to the left of their operand. Binary operators shall appear between their
operands. A conditional operator shall have two operator characters that separate three operands.

## Numbers

#### Integer Constants

- Decimal, Hexadecimal, Octal or binary format

There are two forms to express integer constants, THe first one is simple decimal number, which specified as sequence of digits 0 through 9.

```verilog
659       // is a decimal number
``` 

The
second form specifies a based constant, which shall be composed of up to three tokens—an optional size constant, an apostrophe character followed by a base format character, and the digits representing the value of the number. It shall be legal to macro-substitute these three tokens. 
```verilog
'h 837FF   // is a hexadecimal number 
'o7460     // is an octal number 
4af        // is illegal (hexadecimal format requires 'h)
```
We can represent signed numbers also in the case
```verilog
4'b1001   // is a 4-bit binary number 
5 'D 3    // is a 5-bit decimal number 
3'b01x    // is a 3-bit number with the least 
          // significant bit unknown 
12'hx     // is a 12-bit unknown number 
16'hz     // is a 16-bit high-impedance number
8 'd -6   // this is illegal syntax 
-8 'd 6   // this defines the two's complement of 6, 
          // held in 8 bits—equivalent to -(8'd 6) 
4 'shf    // this denotes the 4-bit number '1111', to 
          // be interpreted as a 2's complement number, 
          // or '-1'. This is equivalent to -4'h 1 
-4 'sd15  // this is equivalent to -(-4'd 1), or '0001'
16'sd?    // the same as 16'sbz 
```
The underscore character `_` shall be legal anywhere in a number except as the first character. The
underscore character is ignored. This feature can be used to break up long numbers for readability purposes. 

#### Real constants

> The real constant numbers shall be represented as described by IEEE Std 754 double-precision floating-point numbers.

Real numbers can be specified in either decimal notation (for example, 14.72) or in scientific notation (for example, 39e8, which indicates 39 multiplied by 10 to the eighth power). Real numbers expressed with a decimal point shall have at least one digit on each side of the decimal point.

```verilog
1.2 
0.1 
2394.26331 
1.2E12   //(the exponent symbol can be e or E)
1.30e-2 
0.1e-0 
23E10 
29E-2 
236.123_763_e-12 //(underscores are ignored)
```

#### Strings

A string is a sequence of characters enclosed by double quotes ("") and contained on a single line. Strings used as operands in expressions and assignments shall be treated as unsigned integer constants represented by a sequence of 8-bit ASCII values, with one 8-bit ASCII value representing one character.

To store the 12-character string "Hello world!" requires a reg 8 * 12, or 96 bits wide.

```verilog
reg [8*12:1] stringvar;
initial begin
    stringvar = "Hello world!";
end
```

#### Identifiers, Keywords and System names

An **identifier** is used to give an object a unique name so it can be referenced. An identifier is either a simple identifier or an escaped identifierA simple identifier shall be any sequence of letters, digits,
dollar signs ($), and underscore characters (_). 
The first character of a simple identifier shall not be a digit or $; it can be a letter or an underscore.
Identifiers shall be case sensitive.

**Keywords** are predefined nonescaped identifiers that are used to define the language constructs. A Verilog HDL keyword preceded by an escape character is not interpreted as a keyword. 
All keywords are defined in lowercase only.


The dollar sign ($) introduces a language construct that enables development of user-defined system tasks and functions. System constructs are not design semantics, but refer to simulator functionality. A name following the $ is interpreted as a system task or a **system function**. 


[Home🏠](readme.md)
