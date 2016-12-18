// * ----------------------------------------------------
// * Author:juzhimin
// * Email:919373122@qq.com
// * Filename:can_interface.sv
// * Description:can   interface
// * Version:2016/10/7/v1.0
// * ----------------------------------------------------

`ifndef CAN_DRIVER__SV
`define CAN_DRIVER__SV
class can_driver extends uvm_driver#(can_transaction);
virtual   can_interface my_interface;           //类中不能声明interface  所以必须是virtual类型的
   
 
   `uvm_component_utils(can_driver)
   function new(string name="my_driver",uvm_component parent=null);
       super.new(name,parent);
   endfunction
  

   virtual function void build_phase(uvm_phase phase);
       super.build_phase(phase);
       
       
       if(!uvm_config_db#(virtual can_interface)::get(this ,"","my_interface",my_interface));    
//一二个参数构成组合路径。第三个参数set与get一样	   
//set和get都有四个参数 这两个的第三个参数必须一致，set的第四个参数指定传递给哪个driver。
//get的第四个参数指定driver的哪个 interface接收
	   `uvm_fatal("my_driver","virtual interface must be set for vif")//执行到第二个参数时退出
    
   endfunction
   extern task main_phase(uvm_phase phase);
   extern task drive_one_pkt(can_transaction tr);
endclass
   
  task can_driver::main_phase(uvm_phase phase);   //基本上的工作都集中在main_phase中完成
                                           //初始化
    my_interface.CS<=1'b1;                //片选不选中
	my_interface.AD<=1'b0;               //数据地址置0
	my_interface.WR<=1'b1;                //写不使能
	my_interface.RD<=1'b1;                //读不使能
	my_interface.ALE<=1'b0;               //地址锁存 
	my_interface.MODE<=1'b1;              //模式选择intel模式
	while(!my_interface.RST)
	    @(posedge my_interface.CLK);       //等待复位
	                                        
											
											
											//这里是寄存器的初始化。。。。。。。。。
											
											
											
    while(1)
	   begin
	   seq_item_port.get_next_item(req);          //req??是什么东西
	   drive_one_pkt(req);                       //驱动一个transaction
	   seq_item_port.item_done();                //完成一个transaction驱动
	   end
  endtask
  
  
  task  can_driver::drive_one_pkt(can_transaction tr);   //驱动一个transaction具体实现
      byte unsigned data_q[];           //声明一个不定数组
      int data_size;                     //保存数组大小
   
   
   data_size=tr.pack_bytes(data_q)/8;   //将transction打包成字节流存入data_q里面并计算其大小。
  `uvm_info("can_driver","begin to drive one pkt",UVM_LOW);   //输出打印信息   
                                                  //直接用寄存器实现					
  
  
  
  endtask
   










`endif