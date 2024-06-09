module and_gate_generate (
    input wire [1:0] a, // 2-bit input vector
    input wire [1:0] b, // 2-bit input vector
    output wire [1:0] y // 2-bit output vector
);
    genvar i;
    generate
        for (i = 0; i < 2; i = i + 1) begin : and_gen
            assign y[i] = a[i] ^ b[i];
        end
    endgenerate
endmodule
