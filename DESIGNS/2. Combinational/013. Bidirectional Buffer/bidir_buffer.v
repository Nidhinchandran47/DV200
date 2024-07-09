module bidirectional_buffer(en,d_in,d_out);
    input en;
    inout wire d_in;
    inout wire d_out;
    bufif1 (d_out,d_in,en);
    bufif0 (d_in,d_out,en);
    wire w2;
    assign w2=d_out;
endmodule