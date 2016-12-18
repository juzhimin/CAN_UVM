// * ----------------------------------------------------
// * Author:juzhimin
// * Email:919373122@qq.com
// * Filename:can_tansaction.sv
// * Description:can_bus_driver   
// *
// * Version:2016/12/8/v1.0
// *----------------------------------------------------

`ifndef CAN_BUS_DRIVER__SV
`define CAN_BUS_DRIVER__SV
class can_bus_driver extends uvm_driver#(can_bus_transaction);

   virtual can_bus_if vif;
   `uvm_component_utils(can_bus_driver)
   function new(string name = "can_bus_driver", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase); 
      super.build_phase(phase);
      if(!uvm_config_db#(virtual can_bus_if)::get(this, "", "vif", vif))
         `uvm_fatal("can_bus_driver", "virtual interface must be set for vif!!!")
   endfunction
 
   extern task run_phase(uvm_phase phase);
   extern task drive_one_pkt(can_bus_transaction tr);
endclass

task can_bus_driver::run_phase(uvm_phase phase);
   vif.can_bus_cmd_valid <= 1'b0;
   vif.can_bus_op <= 1'b0;
   vif.can_bus_addr <= 15'b0;
   vif.can_bus_wr_data <= 15'b0;
   while(!vif.rst_n)
      @(posedge vif.clk);
   while(1) begin
      seq_item_port.get_next_item(req);
      drive_one_pkt(req);
      seq_item_port.item_done();
   end
endtask

task can_bus_driver::drive_one_pkt(can_bus_transaction tr);
   `uvm_info("can_bus_driver", "begin to drive one pkt", UVM_LOW);
   //bus_driver在驱动总线进行读操作时，他也能顺便获取要读的值，如果他将此值放入葱bus_sequencer
   //获得的transaction中，那么bus_transaction中就会有bus_transaction的值，此值经过bus2reg的转换，
   //最终被寄存器模型获取。
   // repeat(1) @(posedge vif.clk);
   
   // vif.can_bus_cmd_valid <= 1'b1;
   // vif.can_bus_op <= ((tr.can_bus_op == can_bus_RD) ? 0 : 1);
   // vif.can_bus_addr = tr.addr;
   // vif.can_bus_wr_data <= ((tr.can_bus_op == can_bus_RD) ? 0 : tr.wr_data);

   // @(posedge vif.clk);
   // vif.can_bus_cmd_valid <= 1'b0;
   // vif.can_bus_op <= 1'b0;
   // vif.can_bus_addr <= 15'b0;
   // vif.can_bus_wr_data <= 15'b0;

   // @(posedge vif.clk);   //读取总线上的值存入bus_transaction中
   // if(tr.can_bus_op == can_bus_RD) begin
      // tr.rd_data = vif.can_bus_rd_data;   
      // //$display("@%0t, rd_data is %0h", $time, tr.rd_data);
    // end
	
    repeat(1) @(posedge vif.clk);
   
    vif.bus_ale<= 1'b0;
    vif.bus_cs <= 1;
    vif.bus_addr<=8'b0;
	vif.bus_wr_data<=1;
	vif.bus_rd_data<=1; 
	
	@(posedge vif.clk);
	vif.bus_ale<=1;
	vif.bus_addr<=tr.
	
    
	
	
	
	
	
   //`uvm_info("can_bus_driver", "end drive one pkt", UVM_LOW);
endtask


`endif
