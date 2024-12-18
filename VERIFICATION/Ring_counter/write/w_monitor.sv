class w_monitor extends uvm_monitor;

  `uvm_component_utils(w_monitor)
  virtual counter_if.W_M_MP vif;
  write_config m_cfg;
  uvm_analysis_port #(counter_xtn) monitor_port;

  function new(string name = "w_monitor", uvm_component parent);
    super.new(name, parent);
    monitor_port = new("monitor_port", this);
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
    wait(vif.wr_mon.rst==1);
      @(vif.wr_mon);
    forever collect_data();
  endtask

  task collect_data();
    counter_xtn mon_data;
    mon_data = counter_xtn::type_id::create("mon_data");
    @(vif.wr_mon);
    mon_data.rst = vif.wr_mon.rst;
    monitor_port.write(mon_data);
    //mon_data.print();
  endtask
endclass
