module nor_gate_behavioral (
       input a,
       input b,
       output y
   );
       assign y = ! ( a || b ); 
endmodule