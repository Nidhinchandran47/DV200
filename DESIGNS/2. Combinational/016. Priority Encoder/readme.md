# Priority Encoder


A priority encoder is a digital circuit that encodes the position of the highest-order active input (the highest priority) into a binary code. It is used in applications where multiple inputs need to be prioritized, such as interrupt handling in microprocessors.


### Example: 4-to-2 Priority Encoder

For a 4-to-2 priority encoder, the inputs are `D3`, `D2`, `D1`, `D0`, and the outputs are `Y1`, `Y0`, with `V` (valid) indicating if any input is active.

Here Priority is in order **D3 > D2 > D1 > D0**

### Truth Table:

| D3    | D2    | D1    | D0    | V   | Y1  | Y0  |
| ----- | ----- | ----- | ----- | --- | --- | --- |
| 0     | 0     | 0     | 0     | 0   | -   | -   |
| 0     | 0     | 0     | **1** | 1   | 0   | 0   |
| 0     | 0     | **1** | 0     | 1   | 0   | 1   |
| 0     | 0     | **1** | 1     | 1   | 0   | 1   |
| 0     | **1** | 0     | 0     | 1   | 1   | 0   |
| 0     | **1** | 0     | 1     | 1   | 1   | 0   |
| 0     | **1** | 1     | 0     | 1   | 1   | 0   |
| 0     | **1** | 1     | 1     | 1   | 1   | 0   |
| **1** | 0     | 0     | 0     | 1   | 1   | 1   |
| **1** | 0     | 0     | 1     | 1   | 1   | 1   |
| **1** | 0     | 1     | 0     | 1   | 1   | 1   |
| **1** | 0     | 1     | 1     | 1   | 1   | 1   |
| **1** | 1     | 0     | 0     | 1   | 1   | 1   |
| **1** | 1     | 0     | 1     | 1   | 1   | 1   |
| **1** | 1     | 1     | 0     | 1   | 1   | 1   |
| **1** | 1     | 1     | 1     | 1   | 1   | 1   |

- ### Here you can find the data flow modeling of a [4 to 2 encoder](encoder4x2.v).
- ### [8 to 3 encoder](encoder8x3.v) and its [testbench](testbench.v) in structral modeling using a [4 to 2 encoder](encoder4x2.v).
- ###  [8 to 3 encoder](beha8x3.v) and its [testbench](beha_tb.v) in Behavioural modeling.