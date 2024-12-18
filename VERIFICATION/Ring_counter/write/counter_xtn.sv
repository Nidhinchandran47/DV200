class counter_xtn extends uvm_sequence_item;
  `uvm_object_utils(counter_xtn)

  rand bit rst;
  bit [7:0] out;

  constraint reset_c {
    rst dist {
      1 := 1,
      0 := 15
    };
  }
  function new(string name = "counter_xtn");
    super.new(name);
  endfunction

  function void do_print(uvm_printer printer);

  printer.print_field("rst", this.rst, 1, UVM_BIN);
  printer.print_field("out", this.out, 8, UVM_BIN);
  
endfunction
endclass
