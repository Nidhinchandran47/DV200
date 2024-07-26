module sr_gate(
    input S,
    input R,
    output Q,
    output Qbar
);
    nor nor1(Q, R, Qbar);
    nor nor2(Qbar, S, Q);
endmodule