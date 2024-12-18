class w_sequencer extends uvm_sequencer #(counter_xtn);

    `uvm_component_utils(w_sequencer)

    function new(string name = "w_sequencer", uvm_component parent);
        super.new(name, parent);
    endfunction

endclass
