module encoder8x3_tb;
    reg [7:0] I;
    wire [2:0] Y;
    wire V;
    integer i;

    encoder8x3 uut (
        .I(I),
        .Y(Y),
        .V(V)
    );

    initial begin
        I = 8'b00000000; #10;
        I = 8'b00000001; #10;
        I = 8'b00000100; #10;
        I = 8'b00001000; #10;
        I = 8'b00010000; #10;
        I = 8'b00100000; #10;
        I = 8'b01000000; #10;
        I = 8'b10000000; #10;
        I = 8'b00000101; #10;
        I = 8'b00011000; #10;
        $finish;
    end

    initial begin
        $monitor("When input = %b, output is %b and Valid is %b",I,Y,V);
    end
    
endmodule
