module signed_comparator (
    input signed [3:0] A, // 4-bit signed input A
    input signed [3:0] B, // 4-bit signed input B
    output reg A_greater_B, // A > B
    output reg A_equal_B,   // A == B
    output reg A_less_B     // A < B
);

    always @(A or B) begin
        if (A > B) begin
            A_greater_B = 1;
            A_equal_B = 0;
            A_less_B = 0;
        end else if (A == B) begin
            A_greater_B = 0;
            A_equal_B = 1;
            A_less_B = 0;
        end else begin
            A_greater_B = 0;
            A_equal_B = 0;
            A_less_B = 1;
        end
    end

endmodule