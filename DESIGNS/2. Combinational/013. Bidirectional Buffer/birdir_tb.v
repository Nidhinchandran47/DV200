module bidirectional_buffer_tb();
reg en;
reg tempd_in,tempd_out;
wire d_in,d_out;
integer i;
bidirectional_buffer uut(.en(en),.d_in(d_in),.d_out(d_out));
assign d_in=(en==1'b1) ? tempd_in:1'bz;
assign d_out=(en== 1'b0) ? tempd_out:1'bz;
initial
begin
for(i=0 ;i<8 ;i=i+1)
    begin
        {tempd_in,tempd_out,en} = i;
        #10;
        end
    end
initial
begin
    #100 $finish;
    end
endmodule