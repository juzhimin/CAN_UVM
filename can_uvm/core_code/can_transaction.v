// * ----------------------------------------------------
// * Author:juzhimin
// * Email:919373122@qq.com
// * Filename:can_tansaction.sv
// * Description:can   extention   transaction
// * Version:2016/10/7/v1.0
// * ----------------------------------------------------
`ifndef MY_TRANSACTION__SV
`define MY_TRANSACTION__SV
class can_data_transaction extends uvm_sequence_item;
//描述:一字节帧头 四字节标识符 0~8字节数据
rand bit frame_format;         //帧格式 标准帧扩张帧  bit为无符号数
rand bit [2:0] frame_type;    //帧类型  数据帧 远程帧 错误帧 过载帧
rand bit  [31:0]  ID;        //标识符
rand byte  data[];           //数据
rand bit [2:0]  data_size;   //数据大小
rand bit [31:0] crc;        //crc校验码

constraint data_con{
    data.size>=0;              
	data.size<=8;
				  }
				  
//factory机制进行注册，注册之后可以直接使用copy campare print等函数，而无需自己定义
 `uvm_object_utils_begin(uvm_my_transaction)   
   `uvm_field_int(frame_start,UVM_ALL_ON)
   `uvm_field_int(ID,UVM_ALL_ON)
   `uvm_field_arrar(data,UVM_ALL_ON)
 `uvm_object_utils_end                          //注册结束
function new(string name ="my_transaction");  //带参数类的构造函数
   super.new();
   endfunction


endclass
`endif
