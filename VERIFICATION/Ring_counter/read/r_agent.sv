class r_agent extends uvm_agent;
`uvm_component_utils(r_agent)
r_monitor mon;
    function new(string name = "r_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        mon = r_monitor::type_id::create("mon",this);
    endfunction
endclass
