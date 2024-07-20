# 4-bit Binary to Gray Code Converter

A Binary to Gray Code converter is used to transform a binary number into its equivalent Gray code. Gray code is a binary numeral system where two successive values differ in only one bit, which minimizes errors in digital systems.

### Gray Code

Gray code is a binary numeral system where two successive values differ in only one bit. This property helps minimize errors in digital systems, especially during the transition between states. Gray code is commonly used in applications like error correction in digital communications, Karnaugh maps for simplifying Boolean expressions, and rotary encoders for position tracking.

### Key Characteristics:
- **Single Bit Change:** Only one bit changes between successive values.
- **Error Minimization:** Reduces the chance of errors during state transitions.
- **Applications:** Widely used in digital systems, error correction, and position encoders.

### Example of 3-bit Gray Code:
| Decimal | Binary | Gray Code |
|---------|--------|-----------|
| 0       | 000    | 000       |
| 1       | 001    | 001       |
| 2       | 010    | 011       |
| 3       | 011    | 010       |
| 4       | 100    | 110       |
| 5       | 101    | 111       |
| 6       | 110    | 101       |
| 7       | 111    | 100       |



#### Key Features:
- **Error Minimization:** Reduces the chance of errors during the transition between states.
- **Single Bit Change:** Each successive number in Gray code differs by only one bit from the previous number.

### Conversion Logic
For a 4-bit binary number `B3 B2 B1 B0`, the equivalent Gray code `G3 G2 G1 G0` is calculated as:
- `G3 = B3`
- `G2 = B3 ⊕ B2`
- `G1 = B2 ⊕ B1`
- `G0 = B1 ⊕ B0`
where `⊕` denotes the XOR operation.



