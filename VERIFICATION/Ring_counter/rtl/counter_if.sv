interface counter_if (
    input logic clk
);
  logic rst;
  logic [7:0] out;

  clocking wr_mon @(posedge clk);
    default input #1 output #1;
    input rst;
  endclocking

  clocking wr_drv @(posedge clk);
    default input #1 output #1;
    output rst;
  endclocking

  clocking rd_mon @(posedge clk);
    default input #1 output #1;
    input out;
    input rst;
  endclocking

  modport W_M_MP(clocking wr_mon);
  modport W_D_MP(clocking wr_drv);
  modport R_M_MP(clocking rd_mon);
  
endinterface
