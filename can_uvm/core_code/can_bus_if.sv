// * ----------------------------------------------------
// * Author:juzhimin
// * Email:919373122@qq.com
// * Filename:can_bus_if.sv
// * Description:can_bus_interface
// * Version:2016/12/8/v1.0
// * ----------------------------------------------------

`ifndef CAN_BUS_IF__SV
`define CAN_BUS_IF__SV

interface can_bus_if(input clk, input rst_n);

   logic         bus_ale;       // 地址选定 低有效
   logic         bus_cs;        //片选 低有效
   logic [7:0]   bus_addr;      //数据地址总线
   logic         bus_wr_data;
   logic         bus_rd_data;
   logic         bus_int;       //中断       低有效
endinterface

`endif
bus