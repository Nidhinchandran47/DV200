   module or_gate_primitive (
       input wire a,
       input wire b,
       output wire y
   );
       or (y, a, b);
   endmodule