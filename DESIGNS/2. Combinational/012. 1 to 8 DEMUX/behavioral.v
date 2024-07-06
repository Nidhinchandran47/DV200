module demux1to4 (
    input D,
    input S0,
    input S1,
    input S2,
    input EN,
    output [7:0] reg Y
);
    always @(*) begin
        if (EN) begin
            case ({S2, S1, S0})
                3'b000: Y = {8'h00, D};
                3'b001: Y = {8'h00, D} << 1;
                3'b010: Y = {8'h00, D} << 2;
                3'b011: Y = {8'h00, D} << 3;
                3'b100: Y = {8'h00, D} << 4;
                3'b101: Y = {8'h00, D} << 5;
                3'b110: Y = {8'h00, D} << 6;
                3'b111: Y = {8'h00, D} << 7;
                default: Y = 8'h00;
            endcase
        end else begin
            Y = 8'h00;
        end
    end
endmodule