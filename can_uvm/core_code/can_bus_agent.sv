// * ----------------------------------------------------
// * Author:juzhimin
// * Email:919373122@qq.com
// * Filename:can_bus_agent.sv
// * Description:can_bus_interface
// * Version:2016/12/8/v1.0
// * ----------------------------------------------------


`ifndef CAN_BUS_AGENT__SV
`define CAN_BUS_AGENT__SV

class can_bus_agent extends uvm_agent ;
   can_bus_sequencer  sqr;
   can_bus_driver     drv;
   can_bus_monitor    mon;
   
   uvm_analysis_port #(can_bus_transaction)  ap;
   
   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction 
   
   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);

   `uvm_component_utils(can_bus_agent)
endclass 


function void can_bus_agent::build_phase(uvm_phase phase);
   super.build_phase(phase);
   if (is_active == UVM_ACTIVE) begin
      sqr = can_bus_sequencer::type_id::create("sqr", this);
      drv = can_bus_driver::type_id::create("drv", this);
   end
   mon = can_bus_monitor::type_id::create("mon", this);
endfunction 

function void can_bus_agent::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   if (is_active == UVM_ACTIVE) begin
      drv.seq_item_port.connect(sqr.seq_item_export);
   end
   ap = mon.ap;
endfunction

`endif

