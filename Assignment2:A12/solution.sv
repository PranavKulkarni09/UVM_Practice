class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path = "driver", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    `uvm_info("DRV", "This is driver class and verobisty used is FULL", UVM_FULL);
  endtask
endclass

class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  function new(string path = "monitor", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    `uvm_info("MON", "This is monitor class and verbosity used is HIGH", UVM_HIGH);
  endtask
endclass

class agent extends uvm_agent;
  `uvm_component_utils(agent)
  
  driver drv;
  monitor mon;
  
  function new(string path = "agent", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = driver::type_id::create("drv", this);
    mon = monitor::type_id::create("mon", this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("AGNT", "This is agent class and verbosity used is MEDIUM (Default)", UVM_MEDIUM);
  endfunction
endclass

class env extends uvm_env;
  `uvm_component_utils(env)
  
  agent agnt;
  
  function new(string path = "env", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agnt = agent::type_id::create("agnt", this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV", "This is environment class and verbosity used is DEBUG", UVM_DEBUG);
  endfunction
endclass

class test extends uvm_test;
  `uvm_component_utils(test)
  
  env e;
  
  function new(string path = "test", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e = env::type_id::create("e", this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    `uvm_info("TEST", "This is test class and verbosity used is NONE", UVM_NONE);
  endtask
endclass

module tb;
  initial begin
    $display("Default Verbosity level is : %0d", uvm_top.get_report_verbosity_level);
    uvm_top.set_report_verbosity_level(UVM_DEBUG);
    $display("New Verbosity level is : %0d", uvm_top.get_report_verbosity_level);
  end
  initial begin
    run_test("test");
  end
endmodule

//The Line 89 is used to change the verbosity level of the full verification environment. 
//This works because this line is called before run_test("test") and also works because uvm_top is is highest class in the hierarchy tree.
