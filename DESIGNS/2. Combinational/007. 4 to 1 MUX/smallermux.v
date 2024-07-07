module mux4x1 (
    input i0,i1,i2,i3,s1,s0,
    output y
);
    wire y1,y2;

    mux2x1 m1 (i0, i1, s0, y1);
    mux2x1 m2 (i2, i3, s0, y2);
    mux2x1 m3 (y1, y2, s1, y);
    
endmodule

module mux2x1 (
    input i0,i1,sel,
    output y
);
    assign y = ( i0 & ~sel) | ( i1 & sel);
endmodule