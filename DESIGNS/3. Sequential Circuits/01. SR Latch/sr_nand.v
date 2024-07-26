module sr_nand (
    input Sb,Rb,
    output Q,Qbar
);
    nand n1(Q, Rb, Qbar);
    nand n2(Qbar, Sb, Q);
endmodule