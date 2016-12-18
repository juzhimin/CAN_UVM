`ifndef CAN_REG_MODEL__SV
`define CAN_REG_MODEL__SV

class reg_mod extends uvm_reg;         //模式寄存器

    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为5位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值0 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_mod)

    function new(input string name="reg_mod");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度 为8位   UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass

class reg_cmr extends uvm_reg;         //命令寄存器

    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为8位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值1 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_cmr)

    function new(input string name="reg_cmr");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度为8位    UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass

class reg_status extends uvm_reg;         //状态寄存器

    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为8位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值1 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_status)

    function new(input string name="reg_status");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度为8位    UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass

class reg_int extends uvm_reg;         //命中断寄存器

    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为8位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值1 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_int)

    function new(input string name="reg_int");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度为8位    UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass

class reg_int_ena extends uvm_reg;         //中断使能寄存器

    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为8位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值1 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_int_ena)

    function new(input string name="reg_int_ena");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度为8位    UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass

class reg_arb extends uvm_reg;         //仲裁捕捉寄存器

    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为8位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值1 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_arb)

    function new(input string name="reg_arb");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度为8位    UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass

class reg_wrong extends uvm_reg;         //错误代码捕捉寄存器

    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为8位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值1 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_wrong)

    function new(input string name="reg_wrong");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度为8位    UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass

class reg_wrong_lim extends uvm_reg;         //错误报警限额寄存器


    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为8位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值1 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_wrong_lim)

    function new(input string name="reg_wrong_lim");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度为8位    UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass

class reg_wrong_counter_r extends uvm_reg;         //RX错误计数寄存器

    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为8位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值1 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_wrong_counter_r)

    function new(input string name="reg_wrong_counter_r");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度为8位    UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass

class reg_wrong_counter_t extends uvm_reg;         //TX错误计数寄存器

    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为8位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值1 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_wrong_counter_t)

    function new(input string name="reg_wrong_counter_t");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度为8位    UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass

class reg_struct_inf extends uvm_reg;         //TX结构信息寄存器

    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为8位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值1 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_struct_inf)

    function new(input string name="reg_struct_inf");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度为8位    UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass

class reg_post_r extends uvm_reg;         //RX报文计数器

    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为8位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值1 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_post_r)

    function new(input string name="reg_post_r");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度为8位    UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass

class reg_start_r extends uvm_reg;         //RX缓冲区起始寄存器

    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为8位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值1 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_start_r)

    function new(input string name="reg_start_r");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度为8位    UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass

class reg_bus_ts0 extends uvm_reg;         //总线时序寄存器0

    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为8位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值1 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_bus_ts0)

    function new(input string name="reg_bus_ts0");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度为8位    UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass

class reg_bus_ts1 extends uvm_reg;         //总线时序寄存器1

    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为8位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值1 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_bus_ts1)

    function new(input string name="reg_bus_ts1");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度为8位    UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass

class reg_output_control extends uvm_reg;         //输出控制寄存器

    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为8位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值1 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_output_control)

    function new(input string name="reg_output_control");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度为8位    UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass

class reg_time_devide extends uvm_reg;         //时钟分频寄存器

    rand uvm_reg_field reg_data;   //uvm_reg-field  寄存器模型的最小最小单位

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);  //寄存器宽度为8位  最低位从0开始 尽量写入 读取时会清零
		//5是否易失 6上电默认值1 有复位 可以随机化  不能单独读取
     endfunction

    `uvm_object_utils(reg_time_devide)

    function new(input string name="reg_time_devide");
        //parameter: name, size, has_coverage
        super.new(name, 8, UVM_NO_COVERAGE);  //系统总线的宽度为8位    UVM_NO_COVERAGE表示是否收集覆盖率
    endfunction
endclass



    rand uvm_reg_field reg_data;

    virtual function void build();
        reg_data = uvm_reg_field::type_id::create("reg_data");
        // parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
        reg_data.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
    endfunction

    `uvm_object_utils(reg_vlan)

    function new(input string name="reg_vlan");
        //parameter: name, size, has_coverage
        super.new(name, 16, UVM_NO_COVERAGE);
    endfunction
endclass

class global_blk extends uvm_reg_block;  
   rand reg_mod  mod;
   rand reg_cmr  cmr;
   rand reg_status status;
   rand reg_int   Int; 
   rand reg_int_ena  int_ena;     
   rand reg_bus_ts0  bus_ts0;
   rand reg_bus_ts1  bus_ts1;
   rand reg_output_control output_control;
   
   virtual function void build();
      default_map = create_map("default_map", 0, 8, UVM_BIG_ENDIAN, 0);  //一个block对应一个defaultmap
       //基地址0  总线宽度8byte 
      mod= reg_mod::type_id::create("mod", , get_full_name());
      mod.configure(this, null, "");
      mod.build();
      default_map.add_reg(cmr, 'h0, "RW");
	  cmr= reg_cmr::type_id::create("cmr", , get_full_name());
      cmr.configure(this, null, "");
      cmr.build();
      default_map.add_reg(cmr, 'h1, "RW");
	  status= reg_status::type_id::create("status", , get_full_name());
      status.configure(this, null, "");
      status.build();
      default_map.add_reg(status, 'h2, "RW");
	  Int= reg_int::type_id::create("Int", , get_full_name());
      Int.configure(this, null, "");
      Int.build();
      default_map.add_reg(Int, 'h3, "RW");
	  int_ena= reg_int_ena::type_id::create("int_ena", , get_full_name());
      int_ena.configure(this, null, "");
      int_ena.build();
      default_map.add_reg(int_ena, 'h4, "RW");
	  bus_ts0= reg_bus_ts0::type_id::create("bus_ts0", , get_full_name());
      bus_ts0.configure(this, null, "");
      bus_ts0.build();
      default_map.add_reg(bus_ts0, 'h6, "RW");
	  bus_ts1= reg_bus_ts1::type_id::create("bus_ts1", , get_full_name());
      bus_ts1.configure(this, null, "");
      bus_ts1.build();
      default_map.add_reg(bus_ts1, 'h7, "RW");
	  output_control= reg_output_control::type_id::create("output_control", , get_full_name());
      output_control.configure(this, null, "");
      output_control.build();
      default_map.add_reg(output_control, 'h8, "RW");
   endfunction

    `uvm_object_utils(global_blk)

    function new(input string name="global_blk");
        super.new(name, UVM_NO_COVERAGE);
    endfunction 
   
endclass

class buf_blk extends uvm_reg_block;
   rand reg_arb arb;
   rand reg_wrong wrong;
   rand reg_wrong_lim wrong_lim;
   rand reg_wrong_counter_r wrong_counter_r;
   rand reg_wrong_counter_t wrong_counter_t;
   rand reg_struct_inf    struct_inf;
   
   
   virtual function void build();
      default_map = create_map("default_map", 0, 8, UVM_BIG_ENDIAN, 0);

      arb = reg_arb::type_id::create("arb", , get_full_name());
      arb.configure(this, null, "");
      arb.build();
      default_map.add_reg(arb, 'h1, "RW");
	  wrong = reg_wrong::type_id::create("wrong", , get_full_name());
      wrong.configure(this, null, "");
      wrong.build();
      default_map.add_reg(wrong, 'h2, "RW");
	  wrong_lim = reg_wrong_lim::type_id::create("wrong_lim", , get_full_name());
      wrong_lim.configure(this, null, "");
      wrong_lim.build();
      default_map.add_reg(wrong_lim, 'h3, "RW");
	  wrong_counter_r = reg_wrong_counter_r::type_id::create("wrong_counter_r", , get_full_name());
      wrong_counter_r.configure(this, null, "");
      wrong_counter_r.build();
      default_map.add_reg(wrong_counter_r, 'h4, "RW");
	  wrong_counter_t = reg_wrong_counter_t::type_id::create("wrong_counter_r", , get_full_name());
      wrong_counter_t.configure(this, null, "");
      wrong_counter_t.build();
      default_map.add_reg(wrong_counter_t, 'h5, "RW");
	  struct_inf = reg_struct_inf::type_id::create("struct_inf", , get_full_name());
      struct_inf.configure(this, null, "");
      struct_inf.build();
      default_map.add_reg(struct_inf, 'h6, "RW");
	  
   endfunction

    `uvm_object_utils(buf_blk)

    function new(input string name="buf_blk");
        super.new(name, UVM_NO_COVERAGE);
    endfunction 
   
endclass

class mac_blk extends uvm_reg_block;
   rand reg_post_r post_r;
   
   virtual function void build();       
      default_map = create_map("default_map", 0, 8, UVM_BIG_ENDIAN, 0);

      post_r = reg_post_r::type_id::create("post_r", , get_full_name());
      post_r.configure(this, null, "");
      post_r.build();
      default_map.add_reg(post_r, 'h9, "RW");
   endfunction

    `uvm_object_utils(mac_blk)

    function new(input string name="mac_blk");
        super.new(name, UVM_NO_COVERAGE);
    endfunction 
   
endclass

class fourth_blk extends uvm_reg_block;
   rand reg_start_r start_r;
   rand reg_time_devide time_devide;
   virtual function void build();       
      default_map = create_map("default_map", 0, 8, UVM_BIG_ENDIAN, 0);

      start_r = reg_start_r::type_id::create("start_r", , get_full_name());
      start_r.configure(this, null, "");
      start_r.build();
      default_map.add_reg(start_r, 'h0, "RW");
	  time_devide = reg_time_devide::type_id::create("time_devide", , get_full_name());
      time_devide.configure(this, null, "");
      time_devide.build();
      default_map.add_reg(time_devide, 'h1, "RW");
   endfunction

    `uvm_object_utils(fourth_blk)

    function new(input string name="fourth_blk");
        super.new(name, UVM_NO_COVERAGE);
    endfunction 
   
endclass

class reg_model extends uvm_reg_block;

   rand global_blk gb_ins;
   rand buf_blk    bb_ins;
   rand mac_blk    mb_ins;
   rand fourth_blk fb_ins;
   virtual function void build();
      default_map = create_map("default_map", 0, 8, UVM_BIG_ENDIAN, 0);
      gb_ins = global_blk::type_id::create("gb_ins");
      gb_ins.configure(this, "");
      gb_ins.build();
      gb_ins.lock_model();
      default_map.add_submap(gb_ins.default_map, 16'h0);

      bb_ins = buf_blk::type_id::create("bb_ins");
      bb_ins.configure(this, "");
      bb_ins.build();
      bb_ins.lock_model();
      default_map.add_submap(bb_ins.default_map, 16'h00a0);

      mb_ins = mac_blk::type_id::create("mb_ins");
      mb_ins.configure(this, "");
      mb_ins.build();
      mb_ins.lock_model();
      default_map.add_submap(mb_ins.default_map, 16'h0014);
	  
	  fb_ins = fourt_blk::type_id::create("fb_ins");
      fb_ins.configure(this, "");
      fb_ins.build();
      fb_ins.lock_model();
      default_map.add_submap(fb_ins.default_map, 16'h001d);

   endfunction

   `uvm_object_utils(reg_model)

    function new(input string name="reg_model");
        super.new(name, UVM_NO_COVERAGE);
    endfunction 

endclass
`endif
