`timescale 1ns/1ps  //步进为1ns 精度为1ps
`include "uvm_macros.svh"

import uvm_pkg::*;
`include "can_interface.sv"
`include "can_transaction.sv"
//`include "can_monitor.sv"
`include  "can_driver.sv"
//`include "my_transaction.sv"
//`include "my_sequencer.sv"
//`include "my_driver.sv"
//`include "my_monitor.sv"
//`include "my_agent.sv"
//`include "my_model.sv"
//`include "my_scoreboard.sv"
//`include "my_env.sv"
//`include "base_test.sv"
//`include "my_case0.sv"


//单行、多行注释              //方式            ：ctrl+k
//区块注释                        / * * /方式      ：ctrl+q
//取消单行、多行、区块注释                  ：ctrl+shift+k

module top_tb;

reg clk;
reg rst_n;
reg[7:0] rxd;
reg rx_dv;
wire[7:0] txd;
wire tx_en;
can_interface input_if(clk, rst_n);
can_interface output_if(clk, rst_n);
//can_transaction my_transaction;
 //can_monitor  mon;
/*
dut my_dut(.clk(clk),
           .rst_n(rst_n),
           .rxd(input_if.data),
           .rx_dv(input_if.valid),
           .txd(output_if.data),
           .tx_en(output_if.valid));
*/
initial begin
   clk = 0;
   forever begin
      #100 clk = ~clk;
   end
end

initial begin
   rst_n = 1'b0;
   #1000;
   rst_n = 1'b1;
end

initial begin
  // `uvm_info("top","TESTd%",d%)
  
   run_test();
end

initial begin
   //uvm_config_db#(virtual can_interface)::set(null, "top_tb.mon", "vif", input_if);
   //uvm_config_db#(virtual my_if)::set(null, "uvm_test_top.env.i_agt.mon", "vif", input_if);
   //uvm_config_db#(virtual my_if)::set(null, "uvm_test_top.env.o_agt.mon", "vif", output_if);
end

endmodule
