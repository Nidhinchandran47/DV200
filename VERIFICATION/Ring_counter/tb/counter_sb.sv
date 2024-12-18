class counter_sb extends uvm_scoreboard;
  `uvm_component_utils(counter_sb)

  uvm_tlm_analysis_fifo #(counter_xtn) read_fifo, write_fifo;
  counter_xtn read_data, write_data;

  env_config m_cfg;
  bit [7:0] local_out = 8'b1;
  function new(string name = "counter_sb", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(env_config)::get(this, "", "env_config", m_cfg))
      `uvm_fatal("m_cfg", "no update")
    write_data = counter_xtn::type_id::create("write_data", this);
    read_data  = counter_xtn::type_id::create("read_data", this);
    write_fifo = new("write_fifo", this);
    read_fifo  = new("read_fifo", this);
  endfunction

  task run_phase(uvm_phase phase);
    fork
      begin
        forever begin
          write_fifo.get(write_data);
          `uvm_info("WRITE SB", "write data", UVM_LOW)
          write_data.print;
        end
      end
      begin
        forever begin
          read_fifo.get(read_data);
          `uvm_info("READ SB", "read data", UVM_LOW)
          read_data.print;
          check_data();
        end
      end
    join
  endtask

  function void check_data();

    if (read_data.rst == 1) begin
      local_out = 8'b1000_0000;
    end else begin
      local_out <= local_out << 1;
      local_out[0] <= local_out[7];
    end
    $display("Reference model output %b",local_out);
    if (local_out == read_data.out) `uvm_info("SB", "COUNT MATCHED SUCCESSFULLY", UVM_LOW)
    else `uvm_info("SB", "COUNT MISMATCHED", UVM_LOW)
  endfunction
endclass
