 module or_gate_generate (
       input wire [1:0] a, 
       input wire [1:0] b, 
       output wire [1:0] y 
   );
       genvar i;
       generate
           for (i = 0; i < 2; i = i + 1) begin : or_gen
               assign y[i] = a[i] | b[i];
           end
       endgenerate
   endmodule