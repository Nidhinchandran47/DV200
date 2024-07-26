module sr_gate_tb();
    reg Sb, Rb;
    wire Q, Qbar;

    sr_gate dut (Sb, Rb, Q, Qbar);

    initial begin
        $monitor("Value of Q and Qbar are %b %b when Sbar and Rbar are %b %b", Q, Qbar, S, R);
        {Sb,Rb} = 2'b10;#10;
        {Sb,Rb} = 2'b00;#10;
        {Sb,Rb} = 2'b01;#10;
        {Sb,Rb} = 2'b00;#10;
        {Sb,Rb} = 2'b00;#10;
        {Sb,Rb} = 2'b11;#10;
        {Sb,Rb} = 2'b00;#10;
        {Sb,Rb} = 2'b00;#10;
        {Sb,Rb} = 2'b00;#10;
        {Sb,Rb} = 2'b10;#10;
        $finish;
    end
endmodule