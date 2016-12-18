set  UVM_DPI_HOME D:/juzhimin/software/modelsim/setup/uvm-1.1d/win32       
set UVM_HOME D:/juzhimin/software/modelsim/setup/verilog_src/uvm-1.1d
set CODE_PATH C:/Users/Administrator/Desktop/can_uvm/core_code
vlib work                                                                   
vmap work work                                                             

vlog +incdir+$UVM_HOME/src+incdir+$CODE_PATH  -L mtiAvm -L mtiOvm -L mtiUvm -L mtiUPF  $CODE_PATH/top_tb.sv   
            
vsim  -ldflags "-lregex" -c  -novopt -sv_lib $UVM_DPI_HOME/uvm_dpi   work.top_tb     
  