module nand_gate_primitive (
       input a,
       input b,
       output y
   );
       nand (y, a, b);
endmodule