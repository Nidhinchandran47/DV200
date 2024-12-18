module top;
  import counter_pkg::*;
  import uvm_pkg::*;
  bit clk;

  initial begin
    forever #10 clk = ~clk;
  end

  counter_if in (clk);

  ring_counter DUV (
    .clk(clk),
    .rst(in.rst),
    .out(in.out)
  );

  initial begin
    uvm_config_db#(virtual counter_if)::set(null, "*", "vif", in);
    run_test();
  end

  property one_hot;
    @(posedge clk) $onehot(in .out) == 1;
  endproperty

  A1 :
  assert property (one_hot) $display("Assertion one hot success");
  else $display("Assertion one_hot failed!");

  property reset_p;
    @(posedge clk) in.rst |-> in.out == 8'b10000000;
  endproperty

  A2 :
  assert property (reset_p) $display("Assertion reset_p success");
  else $display("Assertion reset_p failed!");

endmodule
