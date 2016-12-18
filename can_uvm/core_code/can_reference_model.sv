// * ----------------------------------------------------
// * Author:juzhimin
// * Email:919373122@qq.com
// * Filename:can_reference_model;.sv
// * Description:can_reference_model  
//* 验收滤波 计算crc 接收fifo 发送fifo 发送给scoreboard
// * Version:2016/12/2/v1.0
// * ----------------------------------------------------
`idndef REFERENCE_MODEL__SV   
`define REFERENCE_MODEL__SV
class can_reference_model extends uvm_component;
    can_transaction  tr_t;
	can_transaction  tr_r;
	can_interface my_if;
	uvm_analysis_port #(can_transaction)  ap;   //事物级传输端口
	uvm_analysis_port #(can_transaction)  ap_monitor;   //从monitor获得
	
	extern function new(string name,uvm_component,parent);
	extern function void bulid_phase(uvm_phase phase);
	extern virtual task main_phase(uvm_phase phase);     //虚函数可以被重载
    extern function void compute_crc(can_transaction tr);                 //计算crc校验码
	extern virtual function void chanel1(can_transaction tr_t,can_transaction tr_r);              //通道一处理函数
	extern virtual function void chanel2();              //通道二处理函数
	extern virtual function bit receive_filter(can_transaction tr);     //验收滤波处理函数
	
    `uvm_component_utils(can_reference_model);
endclass

function can_reference_model::new(string name,uvm_component parent);  //例化
    super.new(name,parent);
endfunction
function can_reference_model::compute_crc(can_transaction tr)
bit  data_q[$];  //计算crc的数据队列
constraint data_con{
    
    data.size<=8*8+39
				  }

  //如果是标准帧				  
  if(0)
   begin
   data.push_back(1'b0);
   for(int i=18;i<29;i++)
   data.push_back(tr.ID[i]);
   data.push_back(1'b0);
   data.push_back(1'b0);
   data.push_back(1'b1);
   
   
   data.push_back(1'b0)
   data.size=8*tr.data_size+18;
   data[data_size:0]={1'b0,tr.ID[28:18],'b0,'b0,'b1,tr.data_size[3:0],} //默认数据帧
   
   end 
   else if(0)	//如果是扩展帧
   data.size=8*tr.data_size+39;
   data[data_size:0]={}
   
	    
endfunction
function can_reference_model::receive_filter(can_transaction tr);//分为单过滤和双过滤模式
//在验收滤波模式下 只有当报文中的标识位和验收滤波的预定义位一样时，can控制器才允许将已接收到的
//报文存入RXFIFO
  bit receive_fla=0;
  bit double_filter_flag=0; //双滤波模式下的一个标志变量
  bit [7:0] receive_data; 
  bit [7:0] receive_code_0;    //验收代码
  bit [7:0] receive_code_1;
  bit [7:0] receive_code_2;
  bit [7:0] receive_code_3;
  bit [7:0] receive_m_code_0;  //屏蔽代码
  bit [7:0] receive_m_code_1;
  bit [7:0] receive_m_code_2;
  bit [7:0] receive_m_code_3;
 if(0)//如果是单滤波模式并且是标准帧
  begin
   receive_data=(receive_code_0~^tr.ID[28:21]|receive_m_code_0);
      if(receive_data=='hFF)//第一字节验收通过
      receive_flag='b1;
      else 
      receive_flag='b0;
   
   
   receive_data[7:4]=(receive_code_1[7:4]~^{tr.ID[20:18],tr.RTR}|receive_m_code_1[7:4]);
      if(receive_data[7:4]=='hF) //第二半字节验收通过
      receive_flag='b1;
      else 
      receive_flag='b0;
  

  receive_data=(receive_code_2~^tr.data[0]|receive_m_code_2);
      if(receive_data=='hFF)//第三字节验收通过
      receive_flag='b1;
      else 
      receive_flag='b0;
   
   
  receive_data=(receive_code_3~^tr.data[1]|receive_m_code_3);
      if(receive_data=='hFF)//第四字节验收通过
      receive_flag='b1;
      else 
      receive_flag='b0;
   return receive_flag;
  end
 if(0) //如果是单滤波而且是扩展帧
  begin 
  receive_data=(receive_code_0~^tr.ID[28:21]|receive_m_code_0);
      if(receive_data=='hFF)//第一字节验收通过
      receive_flag='b1;
      else 
      receive_flag='b0;
  
  
  receive_data=(receive_code_1~^tr.ID[20:13]|receive_m_code_1);
      if(receive_data=='hFF)//第二字节验收通过
      receive_flag='b1;
      else 
      receive_flag='b0;
  
  
  receive_data=(receive_code_2~^tr.ID[12:5]|receive_m_code_2);
      if(receive_data=='hFF)//第三字节验收通过
      receive_flag='b1;
      else 
      receive_flag='b0;  
  
  
  receive_data[7:2]=(receive_code_3[]~^{tr.ID[12:5],tr.RTR}|receive_m_code_3[7:2]);
      if(receive_data[7:2]=='h3F)//第四字节验收通过
      receive_flag='b1;
      else           
      receive_flag='b0;  
  return receive_flag;	 
  end  
  
 if(0)  //如果是双滤波模式且是标准帧
  begin
  //滤波器1
  receive_data=(receive_code_0~^tr.ID[28:21]|receive_m_code_0);
      if(receive_data=='hFF)//第一字节验收通过
      receive_flag='b1;
      else 
      receive_flag='b0;
  
  
  receive_data[7:4]=(receive_code_1[7:4]~^{tr.ID[20:18],tr.RTR}|receive_m_code_1[7:4]);
      if(receive_data[7:4]=='h3F)//第二字节验收通过
      receive_flag='b1;
      else 
      receive_flag='b0;
  
  
  receive_data=({receive_code_1[3:0],receive_code_3[3:0]}~^{tr.ID[28:21]}|{receive_m_code_1[3:0],receive_code_3[3:0]});
      if(receive_data=='hFF)//第三字节验收通过
      receive_flag='b1;
      else 
      receive_flag='b0;
  
  
  //滤波器2
  receive_data=(receive_code_2~^tr.ID[28:21]|receive_m_code_2);
      if(receive_data=='hFF)//第一字节验收通过
      double_filter_flag='b1;
      else 
      double_filter_flag='b0;
  
  
  receive_data[7:4]=(receive_code_3[7:4]~^{tr.ID[20:18],tr.RTR}|receive_m_code_3[7:4]);
      if(receive_data[7:4]=='h3F)//第二字节验收通过
      double_filter_flag='b1;
      else 
      double_filter_flag='b0;
  
   if(receive_flag==1||double_filter_flag==1)
    receive_flag=1;
	else 
	receive_flag=0;
	return receive_flag;
  end
  
  
 if(0)  //如果是双滤波模式且是扩展帧
   begin
   receive_data=(receive_code_0~^tr.ID[28:21]|receive_m_code_0);
      if(receive_data=='hFF)//第一字节验收通过
      receive_flag='b1;
      else 
      receive_flag='b0;
	  
	  
   receive_data=(receive_code_1~^tr.ID[20:13]|receive_m_code_1);
      if(receive_data=='hFF)//第二字节验收通过
      receive_flag='b1;
      else 
      receive_flag='b0;
	  
   receive_data=(receive_code_2~^tr.ID[28:21]|receive_m_code_2);
      if(receive_data=='hFF)//第一字节验收通过
      double_filter_flag='b1;
      else 
      double_filter_flag='b0;
	  
	  
   receive_data=(receive_code_3~^tr_r.ID[20:13]|receive_m_code_3);
      if(receive_data=='hFF)//第一字节验收通过
      double_filter_flag='b1;
      else 
      double_filter_flag='b0;
	  
   
   
   if(receive_flag==1||double_filter_flag==1)
    receive_flag=1;
	else 
	receive_flag=0;
	return receive_flag;  
   end
endfunction
function can_reference_model::chanel1(can_transaction tr_t,can_transaction tr_r);
  //首先判断当前状态是读还是写，2路SJA1000分开 
  
  ap_monitor.get(tr_r);  //get transaction from monitor
  ap_monitor.get(tr_t);
  compute_crc();  //计算crc 
  //读状态寄存器SR判断是读还是在写，
  if(0)  //写操作。判断是否在接收，正在接收则等待，判断上次发送是否完成，未完成则等待完成，判断发送区是否锁定，锁定则等待
  begin
  //将从driver得来的数据包发送给scoreboard
  //出错判断（在rm中是为了模块化）
  
  //逐位比较 找出错误    
  
  end
  if(0)  //读操作
  begin
   //验收滤波处理
  //错误处理
  
    
  end
  
endfunction
task can_reference_model::main_phase(uvm_phase phase);
     transaction new_tr；
	 tr=new("new_tr");
    fork    //并发执行 父进程不执行 被阻塞
    
	
	
	join	


endtask