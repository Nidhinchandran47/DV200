module ram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 3
)(input we_in,enable_in,
	   input [(ADDR_WIDTH-1):0]addr_in,
	   inout [(DATA_WIDTH-1):0]data);
	   
	   reg [(DATA_WIDTH-1):0]mem[2**ADDR_WIDTH-1:0];

   always@(data,we_in,enable_in,addr_in) begin
      if(we_in && !enable_in)
	      mem[addr_in]=data;
    end
   assign data= (enable_in && !we_in) ? mem[addr_in] : 8'hzz;

endmodule 


