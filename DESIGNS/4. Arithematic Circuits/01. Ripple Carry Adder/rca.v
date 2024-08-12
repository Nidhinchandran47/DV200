module rca (
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output [3:0] sum,
    output c_out
);
    wire [2:0] w;

    full_adder_dataflow fa0(a[0], b[0], c_in, sum[0], w[0]);
    full_adder_dataflow fa1(a[1], b[1], w[0], sum[1], w[1]);
    full_adder_dataflow fa2(a[2], b[2], w[1], sum[2], w[2]);
    full_adder_dataflow fa3(a[3], b[3], w[2], sum[3], c_out);
    
endmodule