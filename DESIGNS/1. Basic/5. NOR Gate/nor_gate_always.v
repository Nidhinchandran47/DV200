module nor_gate_always (
       input a,
       input b,
       output reg y
   );
       always @(*) begin
           y = ~ ( a | b );
       end
endmodule