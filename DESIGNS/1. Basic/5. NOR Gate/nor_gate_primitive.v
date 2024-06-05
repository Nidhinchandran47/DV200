module nor_gate_primitive (
       input a,
       input b,
       output y
   );
       nor (y, a, b);
endmodule