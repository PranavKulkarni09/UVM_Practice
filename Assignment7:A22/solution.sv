`include "uvm_macros.svh"
import uvm_pkg::*;

class my_object extends uvm_object;
  `uvm_object_utils(my_object)
  
  rand logic [1:0] a;
  rand logic [3:0] b;
  rand logic [7:0] c;

  function new(string path="my_object");
    super.new(path);
  endfunction

  virtual function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_field_int("a: ", a, $bits(a), UVM_DEC);
    printer.print_field_int("b: ", b, $bits(b), UVM_DEC);
    printer.print_field_int("c: ", c, $bits(c), UVM_DEC);
  endfunction
  
  virtual function void do_copy(uvm_object rhs);
    my_object temp;
    $cast(temp, rhs);
    super.do_copy(rhs);
    this.a=temp.a;
    this.b=temp.b;
    this.c=temp.c;
  endfunction

  virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    my_object temp;
    int stat;
    $cast(temp, rhs);
    stat=super.do_compare(rhs, comparer) && (a==temp.a) && (b==temp.b) && (c==temp.c);
    return stat;
  endfunction
endclass

module tb;
  my_object obj1, obj2;
  int stat;
  
  initial begin
    obj1 = my_object::type_id::create("obj1");
    obj2 = my_object::type_id::create("obj2");
    obj1.randomize();
    obj1.print();
    $cast(obj2, obj1.clone());
    stat = obj2.compare(obj1);
    `uvm_info("TB_TOP", $sformatf("Status of do_compare: %0d", stat), UVM_NONE);
    obj2.print();
  end
endmodule
