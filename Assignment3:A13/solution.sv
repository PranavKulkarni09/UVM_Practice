`include "uvm_macros.svh"
import uvm_pkg::*;

module tb;
  initial begin
    uvm_top.set_report_max_quit_count(4);
    uvm_top.set_report_severity_action(UVM_WARNING, UVM_COUNT | UVM_DISPLAY);
  end
  initial begin
    for(int i = 0; i<10; i++) begin
      `uvm_warning("TB", $sformatf("Random message num: %0d", $urandom_range(0,10)));
    end
  end
endmodule
