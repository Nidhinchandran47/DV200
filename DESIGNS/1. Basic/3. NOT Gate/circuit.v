module(
    input x,
    output f
);
    supply1 vdd;
    supply0 gnd;

    pmos p (f,vdd,x);
    nmos n (f,gnd,x);
    
endmodule