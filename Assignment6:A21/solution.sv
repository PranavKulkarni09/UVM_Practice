`include "uvm_macros.svh"
import uvm_pkg::*;

class my_object extends uvm_object;
  `uvm_object_utils(my_object)
  
  logic [1:0] a;
  logic [3:0] b;
  logic [7:0] c;
  
  function new(string path = "my_object");
    super.new(path);
  endfunction
  
  virtual function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_int("a", $random(a), $bits(a));
    printer.print_int("b", $random(b), $bits(b));
    printer.print_int("c", $random(c), $bits(c));
  endfunction
endclass

module tb;
  my_object obj;
  initial begin
    obj = new("obj");
    obj.print();
  end
endmodule
