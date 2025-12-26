//I have implemented a typedef enum in order to randomize the coder who will broadcast to all the subscribers

`include "uvm_macros.svh"
import uvm_pkg::*;

class PROD extends uvm_monitor;
  `uvm_component_utils(PROD)
  typedef enum {ZEN, ABC, XYZ} coders;
  rand coders cn;
  string coder_name;
  uvm_analysis_port#(string) send;
  
  function new(string path = "PROD", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    send = new("send", this);
  endfunction
  
  virtual task main_phase(uvm_phase phase);
    phase.raise_objection(this);
    if(!randomize()) begin
      `uvm_info("PROD", "Randomization Failed", UVM_NONE);
    end
    coder_name = cn.name();
    if(coder_name == "ZEN") begin
      send.write(coder_name);
    end
    else begin
      send.write(cn.name());
    end
    phase.drop_objection(this);
  endtask
endclass

class SUB1 extends uvm_scoreboard;
  `uvm_component_utils(SUB1)
  
  uvm_analysis_imp#(string, SUB1) recv_sub1;
  
  function new(string path = "SUB1", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    recv_sub1 = new("recv_sub1", this);
  endfunction
  
  virtual function void write(string coder_name);
    `uvm_info("SUB1", $sformatf("String broadcasted by PROD and received in SUB1 is : %0s", coder_name), UVM_NONE);
  endfunction
endclass

class SUB2 extends uvm_scoreboard;
  `uvm_component_utils(SUB2)
  
  uvm_analysis_imp#(string, SUB2) recv_sub2;
  
  function new(string path = "SUB2", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    recv_sub2 = new("recv_sub2", this);
  endfunction
  
  virtual function void write(string coder_name);
    `uvm_info("SUB2", $sformatf("String broadcasted by PROD and received in SUB2 is : %0s", coder_name), UVM_NONE);
  endfunction
endclass

class SUB3 extends uvm_scoreboard;
  `uvm_component_utils(SUB3)
  
  uvm_analysis_imp#(string, SUB3) recv_sub3;
  
  function new(string path = "SUB3", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    recv_sub3 = new("recv_sub3", this);
  endfunction
  
  virtual function void write(string coder_name);
    `uvm_info("SUB3", $sformatf("String broadcasted by PROD and received in SUB3 is : %0s", coder_name), UVM_NONE);
  endfunction
endclass

class env extends uvm_env;
  `uvm_component_utils(env)
  
  PROD p;
  SUB1 s1;
  SUB2 s2;
  SUB3 s3;
  
  function new(string path = "env", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    p = PROD::type_id::create("p", this);
    s1  =SUB1::type_id::create("s1", this);
    s2  =SUB2::type_id::create("s2", this);
    s3  =SUB3::type_id::create("s3", this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    p.send.connect(s1.recv_sub1);
    p.send.connect(s2.recv_sub2);
    p.send.connect(s3.recv_sub3);
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
