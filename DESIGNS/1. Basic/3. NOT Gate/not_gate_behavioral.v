module not_gate_behavioral (
       input wire a,
       output wire y
   );
       assign y = !a; // Using logical NOT (!)
endmodule