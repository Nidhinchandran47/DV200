class w_driver extends uvm_driver #(counter_xtn);

  `uvm_component_utils(w_driver)
  virtual counter_if.W_D_MP vif;
  write_config m_cfg;

  function new(string name = "w_driver", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(write_config)::get(this, "", "write_config", m_cfg))
      `uvm_fatal("CONFIG", "cannot get() method")
  endfunction

  function void connect_phase(uvm_phase phase);
    vif = m_cfg.vif;
  endfunction

  task run_phase(uvm_phase phase);
    @(vif.wr_drv);
    vif.wr_drv.rst <= 1;
    @(vif.wr_drv);
    vif.wr_drv.rst <= 0;
    forever begin
      seq_item_port.get_next_item(req);
      send_to_dut(req);
      seq_item_port.item_done();
    end
  endtask

  task send_to_dut(counter_xtn xtn);
    @(vif.wr_drv);
    vif.wr_drv.rst <= xtn.rst;
    //xtn.print();
  endtask

endclass
