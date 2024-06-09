module or_gate_behavioral (
       input wire a,
       input wire b,
       output wire y
   );
       assign y = ~(a ^ b); 
   endmodule