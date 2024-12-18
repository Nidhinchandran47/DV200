class w_agent extends uvm_agent;
  `uvm_component_utils(w_agent)
  w_monitor mon;
  w_driver drv;
  w_sequencer seqh;
  write_config m_cfg;

  function new(string name = "w_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(write_config)::get(this, "", "write_config", m_cfg))
      `uvm_fatal("config", "error in get")
    mon = w_monitor::type_id::create("mon", this);
    if (m_cfg.is_active == UVM_ACTIVE) begin
      drv = w_driver::type_id::create("drv", this);
      seqh = w_sequencer::type_id::create("seqh", this);
    end
  endfunction

  function void connect_phase(uvm_phase phase);
    if(m_cfg.is_active == UVM_ACTIVE)
		begin
			drv.seq_item_port.connect(seqh.seq_item_export);
		end
  endfunction
endclass
