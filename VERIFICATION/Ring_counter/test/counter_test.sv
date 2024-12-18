class counter_test extends uvm_test;
  `uvm_component_utils(counter_test)
  env_config m_cfg;
  read_config rcfg;
  write_config wcfg;
  counter_env env;

  bit has_ragent = 1;
  bit has_wagent = 1;

  function new(string name = "counter_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_cfg = env_config::type_id::create("m_cfg");
    config_counter();
    uvm_config_db#(env_config)::set(this, "*", "env_config", m_cfg);
    env = counter_env::type_id::create("env", this);
  endfunction

  function void config_counter();
    if (has_ragent) begin
      rcfg = read_config::type_id::create("rcfg");
      if (!uvm_config_db#(virtual counter_if)::get(this, "", "vif", rcfg.vif))
        `uvm_fatal("VIF CONFIG.WRITE", "cannot get cfg")
      rcfg.is_active   = UVM_PASSIVE;
      m_cfg.rd_agt_cfg = rcfg;
    end
    if (has_wagent) begin
      wcfg = write_config::type_id::create("wcfg");
      if (!uvm_config_db#(virtual counter_if)::get(this, "", "vif", wcfg.vif))
        `uvm_fatal("VIF CONFIG.WRITE", "cannot get cfg")
      wcfg.is_active   = UVM_ACTIVE;
      m_cfg.wr_agt_cfg = wcfg;
    end
  endfunction

endclass

class counter_test_1 extends counter_test;
  `uvm_component_utils(counter_test_1)
  wseq counter_seqh;
  function new(string name = "counter_test_1", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    counter_seqh = wseq::type_id::create("counter_seqh");
    counter_seqh.start(env.wagt.seqh);
    #30;
    phase.drop_objection(this);
  endtask
endclass
