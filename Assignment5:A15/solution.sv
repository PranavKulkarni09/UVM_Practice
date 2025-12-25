`include "uvm_macros.svh"
import uvm_pkg::*;

class a extends uvm_component;
  `uvm_component_utils(a)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
 
 
  
  
  task run();
    /////////////////add four independent warning messages in this task(Main task)
    ////////////Add ID as "a" and Messages as Warning 1, Warning 2, Warning 3 and Warning 4
    ////////////Send the warning message one after another starting from warning 1 at an interval of 10 ns (warning 1 must trigger at 0 ns , warning 2 must trigger at 10 ns and so on)
    for(int i = 1; i<5; i++) begin
      `uvm_warning("a", $sformatf("Warning %0d", i));
      #10;
    end
  endtask
  
 
  
endclass
 
/////////////////////////////////////////////
 
 
module tb;
 
///////////// Add a code to execute main task of a
//////////// Override the behavior of the UVM_WARNING such that it should be counted in UVM_QUIT COUNT
////////Set the quit count threshold to be 4
  a a1;
  initial begin
    a1.set_report_max_quit_count(4);
    a1 = new("a1", null);
  end
  initial begin
    a1.set_report_severity_action(UVM_WARNING, UVM_COUNT | UVM_DISPLAY);
    a1.run();
  end
  
endmodule
