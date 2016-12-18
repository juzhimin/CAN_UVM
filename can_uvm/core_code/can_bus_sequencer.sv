// * ----------------------------------------------------
// * Author:juzhimin
// * Email:919373122@qq.com
// * Filename:can_bus_sequencer.sv
// * Description:can_bus_sequencer
// * Version:2016/12/8/v1.0
// * ----------------------------------------------------

`ifndef CAN_BUS_SEQUENCER__SV
`define CAN_BUS_SEQUENCER__SV

class can_bus_sequencer extends uvm_sequencer #(can_bus_transaction);
   
   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction 
   
   `uvm_component_utils(can_bus_sequencer)
endclass

`endif
