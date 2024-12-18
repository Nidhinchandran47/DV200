class counter_env extends uvm_env;
  `uvm_component_utils(counter_env)
  r_agent ragt;
  w_agent wagt;
  counter_sb sb;
  env_config m_cfg;

  function new(string name = "counter_env", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(env_config)::get(this, "", "env_config", m_cfg))
      `uvm_fatal("CONFIG", "cannot get m_cfg")
    uvm_config_db#(write_config)::set(this, "*", "write_config", m_cfg.wr_agt_cfg);
    uvm_config_db#(read_config)::set(this, "*", "read_config", m_cfg.rd_agt_cfg);
    if (m_cfg.has_ragent) begin
      ragt = r_agent::type_id::create("ragt", this);
    end
    if (m_cfg.has_wagent) begin
      wagt = w_agent::type_id::create("wagt", this);
    end
    if (m_cfg.has_scoreboard) begin
      sb = counter_sb::type_id::create("sb", this);
    end
  endfunction

  function void connect_phase(uvm_phase phase);
    if (m_cfg.has_scoreboard) begin
      wagt.mon.monitor_port.connect(sb.write_fifo.analysis_export);
      ragt.mon.monitor_port.connect(sb.read_fifo.analysis_export);
    end
  endfunction

  task run_phase(uvm_phase phase);
    uvm_top.print_topology;
  endtask
endclass
