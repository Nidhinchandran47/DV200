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

**An example of gate level modeling is given**
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


The next term in our example was (highz1,strong0), which is also another optional specification which specify the strength of the logic value on the output terminal of instance.


> [!NOTE]
> Only `and`, `or`,`xor`, `nand`, `nor`, `xnor`, `buf`, `bufif0`, `bufif1`, `not`, `notif0`, `notif1`, `pulldown` and `pullup` are vaild to used strenth declaration. 
 
`pullup` only support strength1 and `pulldown` strength0.

The strength1 are `supply1` `strong1` `pull1` `weak1`

The strength0 are `supply0` `strong0` `pull0` `weak0`

Specifying highz1 as strength1 shall cause the gate or switch to output a logic value z in place of a 1. Specifying highz0 shall cause the gate to output a logic value z in place of a 0. The strength specifications (highz0, highz1) and (highz1, highz0) shall be considered invalid

So in our example, the nor gate outputs a z in place of a 1.

The next term is n1, Which the name of the instantiation which can be anything just like variable name.There are many situations when repetitive instances are required. These instances shall differ from each other only by the index of the vector to which they are connected. In order to specify an array of instances, the instance name shall be followed by the range specification. The range shall be specified by two constant expressions, left-hand index (lhi) and right-hand index (rhi), separated by a colon and enclosed within a pair of square brackets. A [lhi:rhi] range specification shall represent an array of abs(lhi-rhi)+1 instances. Neither of the two constant expressions are required to be zero, and lhi is not required to be larger than rhi. If both constant expressions are equal, only one instance shall be generated. 