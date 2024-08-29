# 4-bit Subtractor using Adder

A 4-bit subtractor can be constructed by using an adder with the concept of two's complement. Here’s how it works:

1. **Two's Complement Conversion:**
   - The subtraction operation $A - B$ is equivalent to adding $A + (-B)$.
   - The two's complement of $B$ is calculated by inverting all bits of $B$ (using `~B`) and then adding `1`.

2. **Addition:**
   - Add the 4-bit input `A` to the two's complement of `B`. This is done using a 4-bit adder.
   - The result is the difference $A - B$.

3. **Borrow Detection:**
   - A borrow in binary subtraction occurs when a larger value is subtracted from a smaller value, resulting in a negative difference. In the circuit, this is detected by checking the carry out of the addition.
   - If no carry is generated, it means the result is negative, and the borrow output is set to 1. Otherwise, it is set to 0.

This method allows subtraction to be performed efficiently using a standard adder circuit.

### Find [the verilog code](sub.v) here.
