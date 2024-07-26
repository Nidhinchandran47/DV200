module sr_gate_tb();
    reg S, R;
    wire Q, Qbar;

    sr_gate dut (S, R, Q, Qbar);

    initial begin
        $monitor("Value of Q and Qbar are %b %b when S and R are %b %b", Q, Qbar, S, R);
        {S,R} = 2'b10;#10;
        {S,R} = 2'b00;#10;
        {S,R} = 2'b01;#10;
        {S,R} = 2'b00;#10;
        {S,R} = 2'b00;#10;
        {S,R} = 2'b11;#10;
        {S,R} = 2'b00;#10;
        {S,R} = 2'b00;#10;
        {S,R} = 2'b00;#10;
        {S,R} = 2'b10;#10;
        $finish;
    end
endmodule