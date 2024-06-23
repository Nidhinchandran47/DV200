module mux2to1 (
    input I0,
    input I1,
    input S,
    output reg Y
);
    always @(*) begin
        if (S)
            Y = I1;
        else
            Y = I0;
    end
endmodule
