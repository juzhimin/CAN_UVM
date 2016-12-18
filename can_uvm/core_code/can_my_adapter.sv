// * ----------------------------------------------------
// * Author:juzhimin
// * Email:919373122@qq.com
// * Filename:can_tansaction.sv
// * Description:can_bus_adapter   
// *
// * Version:2016/12/9/v1.0
// *----------------------------------------------------
`ifndef CAN_MY_ADAPTER__SV 
`define can_MY_ADAPTER__SV 
class can_my_adapter extends uvm_reg_adapter;
    string tID = get_type_name();

    `uvm_object_utils(can_my_adapter)

   function new(string name="can_my_adapter");
      super.new(name);
   endfunction : new
   //reg2bus 目的是将uvm_reg_bus_op转换成bus_sequencer能够接受的形式
   //转换地址 数据    
   function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);  
      can_bus_transaction tr;
      tr = new("tr"); 
      tr.addr = rw.addr;    
      tr.bus_op = (rw.kind == UVM_READ) ? BUS_RD: BUS_WR;
      if (tr.bus_op == BUS_WR)
         tr.wr_data = rw.data; 
      return tr;
   endfunction : reg2bus
    //bus2reg的作用为将收集来的transaction转换成寄存器模型能够接受的形式
	//需要在monitor中获取操作类型
   function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
      bus_transaction tr;
      if(!$cast(tr, bus_item)) begin
         `uvm_fatal(tID,
          "Provided bus_item is not of the correct type. Expecting bus_transaction")
          return;
      end
      rw.kind = (tr.bus_op == BUS_RD) ? UVM_READ : UVM_WRITE;
      rw.addr = tr.addr;
      rw.byte_en = 'h3;        //?????
      rw.data = (tr.bus_op == BUS_RD) ? tr.rd_data : tr.wr_data;
      rw.status = UVM_IS_OK;
   endfunction : bus2reg

endclass : can_my_adapter
`endif
