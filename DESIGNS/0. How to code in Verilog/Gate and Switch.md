## ⭕ Gate and Switch level modeling 

[Home🏠](readme.md)

There are 14 logic gates and 12 switches

| N input gates | N output gates | tri-state gates | pull gates | MOS switches | Bidirectional switches |
| ------------- | -------------- | --------------- | ---------- | ------------ | ---------------------- |
| and           | buf            | bufif0          | pulldown   | cmos         | rtran                  |
| nand          | not            | bufif1          | pullup     | nmos         | rtranif0               |
| nor           |                | notif0          |            | pmos         | rtranif1               |
| or            |                | notif1          |            | rcmos        | tran                   |
| xnor          |                |                 |            | rnmos        | tranif0                |
| or            |                |                 |            | rpmos        | tranif1                |

An example of gate level modeling is given
```verilog
nor #2 (highz1,strong0) n1(out1,in1,in2);
```

The first term `nor` is the Gate or Switch type specification, this must be one from 26 above the table

The second term, the one which starts with `#` is delay specifications. it is an optional specification, specify the propagation delay through the gate or switch. n. Gates and switches in declarations with no delay specification shall have no propagation delay. A delay specification can contain up to three delay values, depending on the gate type. The **pullup and pulldown** instance declarations shall not include delay specifications.
```verilog
and #(10) a1 (out, in1, in2);             // only one delay
and #(10,12) a2 (out, in1, in2);          // rise and fall delays
bufif0 #(10,12,11) b3 (out, in, ctrl);    // rise, fall, and turn-off delays
```
**Rule of Propagation delay when more than one delays are declared**

| From value | To value | 2 Delays     | 3 Delays         |
| :--------: | :------: | ------------ | ---------------- |
| 0          | 1        | d1           | d1               |
| 0          | x        | min( d1, d2) | min( d1, d2, d3) |
| 0          | z        | min( d1, d2) | d3               |
| 1          | 0        | d2           | d2               |
| 1          | x        | min( d1, d2) | min( d1, d2, d3) |
| 1          | z        | min( d1, d2) | d3               |
| x          | 0        | d2           | d2               |
| x          | 1        | d1           | d1               |
| x          | z        | min( d1, d2) | d3               |
| z          | 0        | d2           | d2               |
| z          | 1        | d1           | d1               |
| z          | x        | min( d1, d2) | min( d1, d2, d3) |



