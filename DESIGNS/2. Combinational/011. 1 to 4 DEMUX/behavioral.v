module demux1to4 (
    input D,
    input S0,
    input S1,
    input EN,
    output reg Y0,
    output reg Y1,
    output reg Y2,
    output reg Y3
);
    always @(*) begin
        if (EN) begin
            case ({S1, S0})
                2'b00: {Y3, Y2, Y1, Y0} = {3'b000, D};
                2'b01: {Y3, Y2, Y1, Y0} = {3'b000, D} << 1;
                2'b10: {Y3, Y2, Y1, Y0} = {3'b000, D} << 2;
                2'b11: {Y3, Y2, Y1, Y0} = {3'b000, D} << 3;
                default: {Y3, Y2, Y1, Y0} = 4'b0000;
            endcase
        end else begin
            {Y3, Y2, Y1, Y0} = 4'b0000;
        end
    end
endmodule