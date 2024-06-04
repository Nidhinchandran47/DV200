module not_gate_always (
       input wire a,
       output reg y
   );
       always @(*) begin
           y = ~a;
       end
endmodule