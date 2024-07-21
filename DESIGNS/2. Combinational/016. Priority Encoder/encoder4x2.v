module encoder4x2 (
    input [3:0] I,
    output [1:0] Y,
    output V
);
    assign Y = (I[3] ? 2'b11 : (I[2] ? 2'b10 : (I[1] ? 2'b01 : 2'b00)));
    assign V = |I; 
endmodule