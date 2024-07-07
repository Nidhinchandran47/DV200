module mux_tri (
    input i0, i1, i2, i3, s0, s1, e,
    output y
);
    wire [3:0] w;
    decoder2x4 m1(
        .in({s1,s0}),
        .enable(e),
        .out(w)
    );

    tri_buf a0 (i0, w[0], y);
    tri_buf a1 (i1, w[1], y);
    tri_buf a2 (i2, w[2], y);
    tri_buf a3 (i3, w[3], y);
    
endmodule

module decoder2x4(
    input [1:0] in,
    input enable,
    output [3:0] out
);
    assign out[0] = enable & ~in[0] & ~in[1];
    assign out[1] = enable &  in[0] & ~in[1];
    assign out[2] = enable & ~in[0] &  in[1];
    assign out[3] = enable &  in[0] &  in[1];
    
endmodule

module tri_buf (
    input d_in,
    input c,
    output d_out
);
    assign d_out = c ? d_in : 1'bz;
    
endmodule