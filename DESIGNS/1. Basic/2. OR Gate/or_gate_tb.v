module or_gate_tb;
    reg a, b;
    wire y;

    // Instantiate the OR gate
    or_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Monitor the inputs and output
        $monitor("a = %b, b = %b, y = %b", a, b, y);
        
        // Test cases
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end
endmodule
