module ram_tb;

   parameter DATA_WIDTH = 8;
   parameter ADDR_WIDTH = 3;

   wire [(DATA_WIDTH-1):0] data;
   reg  [(ADDR_WIDTH-1):0] addr;
   reg  we,enable;
   reg  [(DATA_WIDTH-1):0] tempd;

   integer l;

   ram dut (we, enable, addr, data);
   
   assign data=(we && !enable) ? tempd : 8'hzz;

   task initialize();
      begin
	 we=1'b0; enable=1'b0; tempd=8'h00;
      end
   endtask

   task stimulus(input [(ADDR_WIDTH-1):0]i, input[(DATA_WIDTH-1):0]j);begin
      addr = i;
      tempd = j;
   end
   endtask

   task write();
      begin
	 we=1'b1;
	 enable=1'b0;
      end
   endtask

   task read();
      begin
	 we=1'b0;
	 enable=1'b1;
      end
   endtask

   task delay;
      begin
	 #10;
      end
   endtask
		
   initial
      begin
	 initialize;
	 delay;
	 write;
	 for(l=0;l<2**ADDR_WIDTH;l=l+1)
	    begin
	       stimulus(l,l);
	       delay;
	    end
	 initialize;
	 delay;
	 read;
	 for(l=0;l<2**ADDR_WIDTH;l=l+1)
	    begin
	       stimulus(l,l);
	       delay;
	    end
	 delay;
	 $finish;
      end

endmodule
