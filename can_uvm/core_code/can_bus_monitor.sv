// * ----------------------------------------------------
// * Author:juzhimin
// * Email:919373122@qq.com
// * Filename:can_bus_minitor.sv
// * Description:can_bus_monitor
// * Version:2016/12/8/v1.0
// * ----------------------------------------------------
`ifndef CAN_BUS_MONITOR__SV
`define CAN_BUS_MONITOR__SV
class can_bus_monitor extends uvm_monitor;

   virtual can_bus_if vif;
   uvm_analysis_port #(can_bus_transaction)  ap;
   
   `uvm_component_utils(can_bus_monitor)
   function new(string name = "can_bus_monitor", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      if(!uvm_config_db#(virtual can_bus_if)::get(this, "", "vif", vif))
         `uvm_fatal("can_bus_monitor", "virtual interface must be set for vif!!!")
      ap = new("ap", this);
   endfunction

   extern task main_phase(uvm_phase phase);
   extern task collect_one_pkt(can_bus_transaction tr);
endclass

task can_bus_monitor::main_phase(uvm_phase phase);
   can_bus_transaction tr;
     while(1) begin
       tr = new("tr");
       collect_one_pkt(tr);
       ap.write(tr);
    end   
endtask 

task can_bus_monitor::collect_one_pkt(can_bus_transaction tr);
   
   // while(1) begin
      // @(posedge vif.clk);
      // if(vif.bus_cmd_valid) break;
   // end

   // tr.bus_op = ((vif.bus_op == 0) ? BUS_RD : BUS_WR);
   // tr.addr = vif.bus_addr;
   // tr.wr_data = vif.bus_wr_data;
   // @(posedge vif.clk);
   // tr.rd_data = vif.bus_rd_data;
   // `uvm_info("bus_monitor", "end collect one pkt", UVM_LOW);
   
   
   
   @(posedge vif.clk);    //等待ale信号的到来
   #4;   //ale脉宽为8ns 延迟4ns读取地址
   tr.bus_addr=vif.addr;
   @(posedge vif.cs)
   #10;   //
   if(vif.bus_wr_data==0)  //wrdata 脉宽为20ns 
   begin
       @(negedge vif.wr_data);     
       tr.bus_rd_data=vif.addr;  //得到读数据
   else if(vif.bus_rd_data==0)    //rd脉宽为40ns
        begin
		@(negedge vif.wr_data)
		tr.bus_rd_data=vif.addr; //得到写数据
		end
   `uvm_info("bus_monitor", "end collect one pkt", UVM_LOW);
   end
   
   
   
  
endtask


`endif
