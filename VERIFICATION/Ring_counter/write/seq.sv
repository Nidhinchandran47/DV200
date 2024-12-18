class wseq extends uvm_sequence #(counter_xtn);
  `uvm_object_utils(wseq)

  function new(string name = "wseq");
    super.new(name);
  endfunction

  task body();
    repeat (10) begin
      req = counter_xtn::type_id::create("req");
      start_item(req);
      assert (req.randomize());
      //`uvm_info("SEQUENCE", $sformatf("printing from sequence \n %s", req.sprint()), UVM_LOW)
      finish_item(req);
    end
  endtask
endclass
