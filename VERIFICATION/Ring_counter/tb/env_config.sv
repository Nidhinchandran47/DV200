class env_config extends uvm_object;

  bit has_wagent = 1;
  bit has_ragent = 1;
  bit has_scoreboard = 1;

  write_config wr_agt_cfg;
  read_config rd_agt_cfg;

  `uvm_object_utils(env_config)

  function new(string name = "env_config");
    super.new(name);
  endfunction
endclass
