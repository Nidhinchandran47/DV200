class write_config extends uvm_object;
  `uvm_object_utils(write_config)
  virtual counter_if vif;

  static int drv_count = 0;
  static int mon_count = 0;
  uvm_active_passive_enum is_active = UVM_ACTIVE;

  function new(string name = "write_config");
    super.new(name);
  endfunction
endclass
