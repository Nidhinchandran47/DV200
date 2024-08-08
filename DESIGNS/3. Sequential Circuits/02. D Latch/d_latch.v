module d_latch (
    input d, 
    input ena,
    output q);
    always @ (*)
        begin
            if(ena)
            	q <= d;
        end
endmodule