module decoder2to4 (
    input A0,
    input A1,
    input EN,
    output reg Y0,
    output reg Y1,
    output reg Y2,
    output reg Y3
);
    always @(*) begin
        if (EN) begin
            case ({A1, A0})
                2'b00: {Y3, Y2, Y1, Y0} = 4'b0001;
                2'b01: {Y3, Y2, Y1, Y0} = 4'b0010;
                2'b10: {Y3, Y2, Y1, Y0} = 4'b0100;
                2'b11: {Y3, Y2, Y1, Y0} = 4'b1000;
                default: {Y3, Y2, Y1, Y0} = 4'b0000;
            endcase
        end else begin
            {Y3, Y2, Y1, Y0} = 4'b0000;
        end
    end
endmodule