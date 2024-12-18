package counter_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "counter_xtn.sv"
    `include "write_config.sv"
    `include "read_config.sv"
    `include "env_config.sv"
    `include "w_monitor.sv"
    `include "w_driver.sv"
    `include "w_sequencer.sv"
    `include "w_agent.sv"
    `include "seq.sv"
    `include "r_monitor.sv"
    `include "r_agent.sv"
    `include "counter_sb.sv"
    `include "counter_env.sv"
    `include "counter_test.sv"
endpackage