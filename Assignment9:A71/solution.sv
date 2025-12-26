`include "uvm_macros.svh"
import uvm_pkg::*;

class transaction extends uvm_sequence_item;
 
  bit [3:0] a = 12;
  bit [4:0] b = 24;
  int c = 256;
  
  function new(string inst = "transaction");
    super.new(inst);
  endfunction
  
  
    `uvm_object_utils_begin(transaction)
  `uvm_field_int(a, UVM_DEFAULT | UVM_DEC);
  `uvm_field_int(b, UVM_DEFAULT | UVM_DEC);
  `uvm_field_int(c, UVM_DEFAULT | UVM_DEC); 
    `uvm_object_utils_end
  
  
  
endclass

class COMPA extends uvm_component;
  `uvm_component_utils(COMPA)
  
  transaction tr;
  uvm_blocking_put_port#(transaction) send;
  
  function new(string path = "COMPA", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    tr = transaction::type_id::create("tr");
    send = new("send", this);
  endfunction
  
  task main_phase(uvm_phase phase);
    phase.raise_objection(this);
    send.put(tr);
    phase.drop_objection(this);
  endtask
endclass

class COMPB extends uvm_component;
  `uvm_component_utils(COMPB)
  
  uvm_blocking_put_imp#(transaction, COMPB) recv;
  
  function new(string path = "COMPB", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    recv = new("recv", this);
  endfunction
  
  virtual task put(transaction tr);
    tr.print();
  endtask
endclass

class env extends uvm_env;
  `uvm_component_utils(env)
  
  COMPA ca;
  COMPB cb;
  
  function new(string path = "env", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ca = COMPA::type_id::create("ca", this);
    cb = COMPB::type_id::create("cb", this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    ca.send.connect(cb.recv);
  endfunction
endclass

class test extends uvm_test;
  `uvm_component_utils(test)
  
  env e;
  
  function new(string path = "e", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e = env::type_id::create("e", this);
  endfunction
endclass

module tb;
  initial begin
    run_test("test");
  end
endmodule
