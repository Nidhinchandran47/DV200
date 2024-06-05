module nor_gate_assign (
       input a,
       input b,
       output y
   );
       assign y = ~ ( a | b );
endmodule