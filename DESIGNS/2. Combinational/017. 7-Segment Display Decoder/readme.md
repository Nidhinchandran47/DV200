# 4-bit BCD to 7-Segment Display Decoder

A 4-bit Binary-Coded Decimal (BCD) to 7-segment display decoder converts a BCD input to a format that can be displayed on a 7-segment display. Each of the 7 segments (labeled a through g) can be turned on or off to display numbers 0-9.

![image](https://github.com/user-attachments/assets/98b33d65-6ab4-442d-9f2d-f52f6681093b)


### Truth Table

| BCD | a | b | c | d | e | f | g |
|-----|---|---|---|---|---|---|---|
| 0000| 1 | 1 | 1 | 1 | 1 | 1 | 0 |  // 0
| 0001| 0 | 1 | 1 | 0 | 0 | 0 | 0 |  // 1
| 0010| 1 | 1 | 0 | 1 | 1 | 0 | 1 |  // 2
| 0011| 1 | 1 | 1 | 1 | 0 | 0 | 1 |  // 3
| 0100| 0 | 1 | 1 | 0 | 0 | 1 | 1 |  // 4
| 0101| 1 | 0 | 1 | 1 | 0 | 1 | 1 |  // 5
| 0110| 1 | 0 | 1 | 1 | 1 | 1 | 1 |  // 6
| 0111| 1 | 1 | 1 | 0 | 0 | 0 | 0 |  // 7
| 1000| 1 | 1 | 1 | 1 | 1 | 1 | 1 |  // 8
| 1001| 1 | 1 | 1 | 1 | 0 | 1 | 1 |  // 9

Here you can find the [code](bcd_to_7seg.v) and [testbench](bcd_to_7seg_tb.v) for a normal 0 to 9 binary to 7 segment decoder.

![image](https://github.com/user-attachments/assets/10a28fe2-8612-4fbe-ab81-88a6d4d40fc3)


# IC 7447

The IC that decodes a 4-bit binary-coded decimal (BCD) to a 7-segment display is typically the 74LS47 or 7447. 

### Pinout:
1. B - BCD input B
2. C - BCD input C
3. LT - Lamp Test
4. BI/RBO - Blanking Input/Ripple Blanking Output
5. RBI - Ripple Blanking Input
6. D - BCD input D
7. A - BCD input A
8. GND - Ground
9. e - 7-segment segment e output
10. d - 7-segment segment d output 
11. c - 7-segment segment c output
12. b - 7-segment segment b output
13. a - 7-segment segment a output
14. g - 7-segment segment g output 
15. f - 7-segment segment f output
16. Vcc - Supply Voltage

Here is the [code](ic7447.v) and [testbench](ic7447_tb.v) for IC 7447.

![image](https://github.com/user-attachments/assets/a4f3108e-b76c-4303-be1f-2f579e1d2963)

