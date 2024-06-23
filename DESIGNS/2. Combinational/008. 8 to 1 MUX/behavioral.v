module mux8to1 (
    input I0,
    input I1,
    input I2,
    input I3,
    input I4,
    input I5,
    input I6,
    input I7,
    input S0,
    input S1,
    input S2,
    output reg Y
);
    always @(*) begin
        case ({S2, S1, S0})
            3'b000: Y = I0;
            3'b001: Y = I1;
            3'b010: Y = I2;
            3'b011: Y = I3;
            3'b100: Y = I4;
            3'b101: Y = I5;
            3'b110: Y = I6;
            3'b111: Y = I7;
            default: Y = 0;
        endcase
    end
endmodule