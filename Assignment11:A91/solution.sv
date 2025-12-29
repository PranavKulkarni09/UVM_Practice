`include "uvm_macros.svh"
import uvm_pkg::*;

class transaction extends uvm_sequence_item;
  `uvm_object_utils(transaction)
  
  rand bit [3:0] a, b, c, d;
  rand bit [1:0] sel;
  bit [3:0] y;
  
  function new(string path = "transaction");
    super.new(path);
  endfunction
endclass

class valid_sel_00_rand_inp extends uvm_sequence#(transaction);
  `uvm_object_utils(valid_sel_00_rand_inp)
  
  transaction tr;
  
  function new(string path = "valid_sel_00_rand_inp");
    super.new(path);
  endfunction
  
  virtual task body();
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        if(!tr.randomize()) begin
          `uvm_error("SEQ-valid_sel_00_rand_inp", "----Radnomization Failed----");
        end
        tr.sel = 2'b00;
        `uvm_info("SEQ-valid_sel_00_rand_inp", $sformatf("Sequence generated | sel: %0b -> input_a: %0d -> input_b: %0d -> input_c: %0d -> input_d: %0d | output_y: %0d", tr.sel, tr.a, tr.b, tr.c, tr.d, tr.y), UVM_NONE);
        finish_item(tr);
      end
  endtask
endclass

class valid_sel_01_rand_inp extends uvm_sequence#(transaction);
  `uvm_object_utils(valid_sel_01_rand_inp)
  
  transaction tr;
  
  function new(string path = "valid_sel_01_rand_inp");
    super.new(path);
  endfunction
  
  virtual task body();
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        if(!tr.randomize()) begin
          `uvm_error("SEQ-valid_sel_01_rand_inp", "----Radnomization Failed----");
        end
        tr.sel = 2'b01;
        `uvm_info("SEQ-valid_sel_01_rand_inp", $sformatf("Sequence generated | sel: %0b -> input_a: %0d -> input_b: %0d -> input_c: %0d -> input_d: %0d | output_y: %0d", tr.sel, tr.a, tr.b, tr.c, tr.d, tr.y), UVM_NONE);
        finish_item(tr);
      end
  endtask
endclass

class valid_sel_10_rand_inp extends uvm_sequence#(transaction);
  `uvm_object_utils(valid_sel_10_rand_inp)
  
  transaction tr;
  
  function new(string path = "valid_sel_10_rand_inp");
    super.new(path);
  endfunction
  
  virtual task body();
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        if(!tr.randomize()) begin
          `uvm_error("SEQ-valid_sel_10_rand_inp", "----Radnomization Failed----");
        end
        tr.sel = 2'b10;
        `uvm_info("SEQ-valid_sel_10_rand_inp", $sformatf("Sequence generated | sel: %0b -> input_a: %0d -> input_b: %0d -> input_c: %0d -> input_d: %0d | output_y: %0d", tr.sel, tr.a, tr.b, tr.c, tr.d, tr.y), UVM_NONE);
        finish_item(tr);
      end
  endtask
endclass

class valid_sel_11_rand_inp extends uvm_sequence#(transaction);
  `uvm_object_utils(valid_sel_11_rand_inp)
  
  transaction tr;
  
  function new(string path = "valid_sel_11_rand_inp");
    super.new(path);
  endfunction
  
  virtual task body();
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        if(!tr.randomize()) begin
          `uvm_error("SEQ-valid_sel_11_rand_inp", "----Radnomization Failed----");
        end
        tr.sel = 2'b11;
        `uvm_info("SEQ-valid_sel_11_rand_inp", $sformatf("Sequence generated | sel: %0b -> input_a: %0d -> input_b: %0d -> input_c: %0d -> input_d: %0d | output_y: %0d", tr.sel, tr.a, tr.b, tr.c, tr.d, tr.y), UVM_NONE);
        finish_item(tr);
      end
  endtask
endclass

class invalid_sel_rand_inp extends uvm_sequence#(transaction);
  `uvm_object_utils(invalid_sel_rand_inp)
  
  transaction tr;
  
  function new(string path = "invalid_sel_rand_inp");
    super.new(path);
  endfunction
  
  virtual task body();
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        if(!tr.randomize()) begin
          `uvm_error("SEQ-invalid_sel_rand_inp", "----Radnomization Failed----");
        end
        tr.sel = 3'b111;
        if(tr.sel > 2'b11) begin
          `uvm_warning("SEQ-invalid_sel_rand_inp", "sel value out of range, Truncating the value");
        end
        `uvm_info("SEQ-invalid_sel_rand_inp", $sformatf("Sequence generated | sel: %0b -> input_a: %0d -> input_b: %0d -> input_c: %0d -> input_d: %0d | output_y: %0d", tr.sel, tr.a, tr.b, tr.c, tr.d, tr.y), UVM_NONE);
        finish_item(tr);
      end
  endtask
endclass

class rand_sel_rand_inp extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_sel_rand_inp)
  
  transaction tr;
  
  function new(string path = "rand_sel_rand_inp");
    super.new(path);
  endfunction
  
  virtual task body();
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        if(!tr.randomize()) begin
          `uvm_error("SEQ-rand_sel_rand_inp", "----Radnomization Failed----");
        end
        `uvm_info("SEQ-rand_sel_rand_inp", $sformatf("Sequence generated | sel: %0b -> input_a: %0d -> input_b: %0d -> input_c: %0d -> input_d: %0d | output_y: %0d", tr.sel, tr.a, tr.b, tr.c, tr.d, tr.y), UVM_NONE);
        finish_item(tr);
      end
  endtask
endclass

class rand_sel_same_inp extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_sel_same_inp)
  
  transaction tr;
  
  function new(string path = "rand_sel_same_inp");
    super.new(path);
  endfunction
  
  virtual task body();
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        if(!tr.randomize()) begin
          `uvm_error("SEQ-rand_sel_same_inp", "----Radnomization Failed----");
        end
        tr.a = 4'b1110;
        tr.b = 4'b1110;
        tr.c = 4'b1110;
        tr.d = 4'b1110;
        `uvm_info("SEQ-rand_sel_same_inp", $sformatf("Sequence generated | sel: %0b -> input_a: %0d -> input_b: %0d -> input_c: %0d -> input_d: %0d | output_y: %0d", tr.sel, tr.a, tr.b, tr.c, tr.d, tr.y), UVM_NONE);
        finish_item(tr);
      end
  endtask
endclass

class rand_sel_all_invalid_inp extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_sel_all_invalid_inp)
  
  transaction tr;
  
  function new(string path = "rand_sel_all_invalid_inp");
    super.new(path);
  endfunction
  
  virtual task body();
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        if(!tr.randomize()) begin
          `uvm_error("SEQ-rand_sel_all_invalid_inp", "----Radnomization Failed----");
        end
        tr.a = 5'b11111;
        tr.b = 5'b11111;
        tr.c = 5'b11111;
        tr.d = 5'b11111;
        if((tr.a || tr.b || tr.c || tr.d) > 4'b1111) begin
          `uvm_warning("SEQ-rand_sel_all_invalid_inp", "input values out of range, Truncating the values");
        end
        `uvm_info("SEQ-rand_sel_all_invalid_inp", $sformatf("Sequence generated | sel: %0b -> input_a: %0d -> input_b: %0d -> input_c: %0d -> input_d: %0d | output_y: %0d", tr.sel, tr.a, tr.b, tr.c, tr.d, tr.y), UVM_NONE);
        finish_item(tr);
      end
  endtask
endclass

class rand_sel_invalid_inp_c extends uvm_sequence#(transaction);
  `uvm_object_utils(rand_sel_invalid_inp_c)
  
  transaction tr;
  
  function new(string path = "rand_sel_invalid_inp_c");
    super.new(path);
  endfunction
  
  virtual task body();
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        if(!tr.randomize()) begin
          `uvm_error("SEQ-rand_sel_invalid_inp_c", "----Radnomization Failed----");
        end
        tr.c = 5'b11111;
        if(tr.c > 4'b1111) begin
          `uvm_warning("SEQ-rand_sel_invalid_inp_c", "input c out of range, Truncating the value of c");
        end
        `uvm_info("SEQ-rand_sel_invalid_inp_c", $sformatf("Sequence generated | sel: %0b -> input_a: %0d -> input_b: %0d -> input_c: %0d -> input_d: %0d | output_y: %0d", tr.sel, tr.a, tr.b, tr.c, tr.d, tr.y), UVM_NONE);
        finish_item(tr);
      end
  endtask
endclass

class drv extends uvm_driver#(transaction);
  `uvm_component_utils(drv)
  
  transaction tr;
  virtual mux_if mif;
  
  function new(string path = "drv", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual mux_if)::get(this, "", "mif", mif)) begin
      `uvm_error("DRV", "Unable to match config_db");
    end
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    tr = transaction::type_id::create("tr");
    forever begin
      seq_item_port.get_next_item(tr);
      mif.sel = tr.sel;
      mif.a = tr.a;
      mif.b = tr.b;
      mif.c = tr.c;
      mif.d = tr.d;
      `uvm_info("DRV", $sformatf("DRV to Interface | sel: %0b -> input_a: %0d -> input_b: %0d -> input_c: %0d -> input_d: %0d | output_y: %0d", tr.sel, tr.a, tr.b, tr.c, tr.d, tr.y), UVM_NONE);
      seq_item_port.item_done();
    end
  endtask
endclass

class mon extends uvm_monitor;
  `uvm_component_utils(mon)
  
  transaction tr;
  virtual mux_if mif;
  uvm_analysis_port#(transaction) send;
  
  function new(string path = "drv", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    tr = transaction::type_id::create("tr");
    send = new("send", this);
    if(!uvm_config_db#(virtual mux_if)::get(this, "", "mif", mif)) begin
      `uvm_error("MON", "Unable to match config_db");
    end
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      #10;
      tr.sel = mif.sel;
      tr.a = mif.a;
      tr.b = mif.b;
      tr.c = mif.c;
      tr.d = mif.d;
      tr.y = mif.y;
      `uvm_info("MON", $sformatf("Interface to MON | sel: %0b -> input_a: %0d -> input_b: %0d -> input_c: %0d -> input_d: %0d | output_y: %0d", tr.sel, tr.a, tr.b, tr.c, tr.d, tr.y), UVM_NONE);
      send.write(tr);
    end
  endtask
endclass

class sco extends uvm_scoreboard;
  `uvm_component_utils(sco)
  
  uvm_analysis_imp#(transaction, sco) recv;
  
  function new(string path = "drv", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    recv = new("recv", this);
  endfunction
  
  virtual function void write(transaction tr);
    `uvm_info("SCO", $sformatf("MON to SCO | sel: %0b -> input_a: %0d -> input_b: %0d -> input_c: %0d -> input_d: %0d | output_y: %0d", tr.sel, tr.a, tr.b, tr.c, tr.d, tr.y), UVM_NONE);
    if((tr.sel==2'b00)&&(tr.y===tr.a)) begin
      `uvm_info("SCO", "MATCH", UVM_NONE);
    end
    else if ((tr.sel==2'b01)&&(tr.y===tr.b)) begin
      `uvm_info("SCO", "MATCH", UVM_NONE);
    end
    else if ((tr.sel==2'b10)&&(tr.y===tr.c)) begin
      `uvm_info("SCO", "MATCH", UVM_NONE);
    end
    else if ((tr.sel==2'b11)&&(tr.y===tr.d)) begin
      `uvm_info("SCO", "MATCH", UVM_NONE);
    end
    else begin
      `uvm_info("SCO", "Nothing Matches", UVM_NONE);
    end
    $display("-------------------------------------------------");
  endfunction
endclass

class agent extends uvm_agent;
  `uvm_component_utils(agent)
  
  drv d;
  mon m;
  uvm_sequencer#(transaction) seqr;
  
  function new(string path = "agent", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    d = drv::type_id::create("d", this);
    m = mon::type_id::create("m", this);
    seqr = uvm_sequencer#(transaction)::type_id::create("seqr", this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    d.seq_item_port.connect(seqr.seq_item_export);
  endfunction
endclass

class env extends uvm_env;
  `uvm_component_utils(env)
  
  agent a;
  sco s;
  
  function new(string path = "env", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    a = agent::type_id::create("a", this);
    s = sco::type_id::create("s", this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    a.m.send.connect(s.recv);
  endfunction
endclass

class test extends uvm_test;
  `uvm_component_utils(test)
  
  env e;
  valid_sel_00_rand_inp vs00ri;
  valid_sel_01_rand_inp vs01ri;
  valid_sel_10_rand_inp vs10ri;
  valid_sel_11_rand_inp vs11ri;
  invalid_sel_rand_inp isri;
  rand_sel_rand_inp rsri;
  rand_sel_same_inp rssi;
  rand_sel_all_invalid_inp rsaii;
  rand_sel_invalid_inp_c rsiic;
  
  function new(string path = "test", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e = env::type_id::create("e", this);
    vs00ri = valid_sel_00_rand_inp::type_id::create("vs00ri");
	vs01ri = valid_sel_01_rand_inp::type_id::create("vs01ri");
	vs10ri = valid_sel_10_rand_inp::type_id::create("vs10ri");
	vs11ri = valid_sel_11_rand_inp::type_id::create("vs11ri");
	isri = invalid_sel_rand_inp::type_id::create("isri");
	rsri = rand_sel_rand_inp::type_id::create("rsri");
	rssi = rand_sel_same_inp::type_id::create("rssi");
	rsaii = rand_sel_all_invalid_inp::type_id::create("rsaii");
	rsiic = rand_sel_invalid_inp_c::type_id::create("rsiic");
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    vs00ri.start(e.a.seqr);
    #10;
    vs01ri.start(e.a.seqr);
    #10;
    vs10ri.start(e.a.seqr);
    #10;
    vs11ri.start(e.a.seqr);
    #10;
    rsri.start(e.a.seqr);
    #10;
    rssi.start(e.a.seqr);
    #10;
    isri.start(e.a.seqr); //This will not throw an error, because SystemVerilog Truncates it to match the input width
    #10;
    rsaii.start(e.a.seqr); //This will not throw an error, because SystemVerilog Truncates it to match the input width
    #10;
    rsiic.start(e.a.seqr); //This will not throw an error, because SystemVerilog Truncates it to match the input width
    #10;
    phase.drop_objection(this);
  endtask
endclass

module tb;
  
  mux_if mif();
  mux dut (.a(mif.a), .b(mif.b), .c(mif.c), .d(mif.d), .sel(mif.sel), .y(mif.y));
  
  initial begin
    uvm_config_db#(virtual mux_if)::set(null, "*", "mif", mif);
  end
  
  initial begin
    run_test("test");
  end
endmodule

/*
Test cases:
1) sel is in valid range i.e 0,1,2,3 (4 test sequences, all with random inputs)
-valid_sel_00_rand_inp
-valid_sel_01_rand_inp
-valid_sel_10_rand_inp
-valid_sel_11_rand_inp
2) random sel, with random input
-rand_sel_rand_inp
3) random sel, with all 4 inputs with same value
-rand_sel_same_inp
4) sel is invalid for ex: sel = 3'b100
-invalid_sel_rand_inp
-This will not throw an error, because SystemVerilog Truncates it to match the input width
5) random sel, with all invalid inputs i.e a/b/c/d = 5'b11111;
-rand_sel_all_invalid_inp
-This will not throw an error, because SystemVerilog Truncates it to match the input width
6) random sel, with one invalid input i.e c = 5'b11111;
-rand_sel_invalid_inp_c
-This will not throw an error, because SystemVerilog Truncates it to match the input width
*/
