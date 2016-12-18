// * ----------------------------------------------------
// * Author:juzhimin
// * Email:919373122@qq.com
// * Filename:can_interface.sv
// * Description:can   interface
// * Version:2016/10/7/v1.0
// * ----------------------------------------------------
`ifndef CAN_INTRTFACE__SV
`define CAN_INTRTFACE__SV
interface can_interface(CLK,RST);

//SJA1000的接口，时钟：CLK,复位：RST,数据地址复用口AD,
//片选：CS，低有效,读使能，低有效;RD,写使能，低有效;WR, 地址锁定，下降沿有效：ALE,中断：INT,
//模式选择：MODE,1=intel模式。0=motorala模式.数据发送端口：TX0,TX1,数据接受端口：RX0,RX1


 logic [7:0] AD;
 logic   CS;
 logic   RD;
 logic   WR;
 logic   ALE;
 logic   INT;
 logic   MODE;
 logic   TX0;
 logic   RX0;
 logic   TX1;
 logic   RX1;
 input   CLK;
 input   RST;
 endinterface

`endif