# Ripple Carry Adder 

A ripple carry adder is a basic digital circuit used for adding two binary numbers. It consists of a series of full adders connected in a chain, where the carry output from each adder is passed to the next adder in the sequence. The first full adder adds the least significant bits (LSBs) of the numbers and passes the carry to the next adder, which adds the next pair of bits along with the carry. This process continues, with each bit "rippling" through the adder until the most significant bits (MSBs) are added, producing the final sum and carry-out. Although simple to implement, ripple carry adders are relatively slow because each full adder must wait for the carry from the previous stage, leading to a delay proportional to the number of bits.

[RTL](rca.v)

[Testbench](rc_adder_tb.v)