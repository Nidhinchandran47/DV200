class r_monitor extends uvm_monitor;

  `uvm_component_utils(r_monitor)
  virtual counter_if.R_M_MP vif;
  read_config m_cfg;
  uvm_analysis_port #(counter_xtn) monitor_port;
  function new(string name = "r_monitor", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(read_config)::get(this, "", "read_config", m_cfg))
      `uvm_fatal("CONFIG", "cannot get() method")
    monitor_port = new("monitor_port", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    vif = m_cfg.vif;
  endfunction

  task run_phase(uvm_phase phase);
    wait (vif.rd_mon.rst == 1);
    @(vif.rd_mon);
    forever collect_data();
  endtask

  task collect_data();
    counter_xtn out_data;
    out_data = counter_xtn::type_id::create("out_data");
    @(vif.rd_mon);
    out_data.rst = vif.rd_mon.rst;
    out_data.out = vif.rd_mon.out;
    monitor_port.write(out_data);
    //out_data.print();
  endtask
endclass
