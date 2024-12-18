module ring_counter (
    input clk,
    input rst,
    output reg [7:0] out
);
  always @(posedge clk or posedge rst) begin
    if (rst == 1) begin
      out <= 8'b1000_0000;
    end else begin
      out <= out << 1;
      out[0] <= out[7];
    end
  end
endmodule
