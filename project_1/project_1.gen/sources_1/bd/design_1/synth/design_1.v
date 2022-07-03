//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
//Date        : Sat Jul  2 21:04:42 2022
//Host        : ransara-laptop running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

/* STR_POINTER
PC
IR
PR1
PR2
PR3
ROW
COL
R1
R2 */
(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=20,numReposBlks=20,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=20,numPkgbdBlks=0,bdsource=USER,\"\"\"\"\"da_clkrst_cnt\"\"\"\"\"=18,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (clk);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN design_1_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk;

  wire [15:0]COL_0_A;
  wire [15:0]COL_0_B;
  wire Decoder_0_col;
  wire Decoder_0_mar;
  wire Decoder_0_mdr;
  wire Decoder_0_pr1;
  wire Decoder_0_pr2;
  wire Decoder_0_pr3;
  wire Decoder_0_r1;
  wire Decoder_0_r2;
  wire Decoder_0_row;
  wire Decoder_0_str_pointer;
  wire [15:0]MAR_0_A;
  wire [15:0]MAR_0_B;
  wire [15:0]MDR_Mux_0_MDR_in;
  wire [15:0]R1_0_A;
  wire [15:0]R1_0_B;
  wire [15:0]R1_2_A;
  wire [15:0]R1_2_B;
  wire [15:0]R1_3_A;
  wire [15:0]R1_3_B;
  wire [15:0]R1_4_A;
  wire [15:0]R1_4_B;
  wire [15:0]R1_5_A;
  wire [15:0]R1_5_B;
  wire [15:0]R1_8_A;
  wire [15:0]R1_8_B;
  wire [15:0]R1_9_A;
  wire [15:0]R1_9_B;
  wire [15:0]ROW_0_A;
  wire [15:0]ROW_0_B;
  wire alu_16bit_0_Z;
  wire [15:0]alu_16bit_0_out;
  wire clockgen_0_clk;
  wire [3:0]cu_0_alu_ctrl;
  wire cu_0_col_inc;
  wire cu_0_col_zero;
  wire cu_0_dmem_read;
  wire cu_0_dmem_write;
  wire cu_0_en_decAop;
  wire cu_0_en_decAout;
  wire cu_0_en_decBop;
  wire cu_0_en_decBout;
  wire cu_0_en_decCop;
  wire cu_0_en_decCout;
  wire cu_0_imem_read;
  wire cu_0_jump;
  wire cu_0_mar_inc;
  wire cu_0_pc_inc;
  wire cu_0_reset;
  wire cu_0_row_inc;
  wire [15:0]data_ram_1_dout;
  wire [15:0]imem_ram_0_dout;
  wire [15:0]ir_module_0_A;
  wire [15:0]ir_module_0_B;
  wire [3:0]ir_module_0_addrA;
  wire [3:0]ir_module_0_addrB;
  wire [3:0]ir_module_0_addrC;
  wire [15:0]mux_0_out;
  wire [15:0]mux_1_out;
  wire [15:0]pc_project_demo_1_PCResult;

  assign clockgen_0_clk = clk;
  design_1_COL_0_0 COL_0
       (.A(COL_0_A),
        .B(COL_0_B),
        .D(alu_16bit_0_out),
        .clk(clockgen_0_clk),
        .inc(cu_0_col_inc),
        .rst(cu_0_reset),
        .writeC(Decoder_0_col),
        .zero(cu_0_col_zero));
  design_1_Decoder_0_0 Decoder_0
       (.EN_OP(cu_0_en_decCop),
        .EN_OUT(cu_0_en_decCout),
        .col(Decoder_0_col),
        .mar(Decoder_0_mar),
        .mdr(Decoder_0_mdr),
        .pr1(Decoder_0_pr1),
        .pr2(Decoder_0_pr2),
        .pr3(Decoder_0_pr3),
        .r1(Decoder_0_r1),
        .r2(Decoder_0_r2),
        .row(Decoder_0_row),
        .sel(ir_module_0_addrC),
        .str_pointer(Decoder_0_str_pointer));
  design_1_MAR_0_0 MAR_0
       (.A(MAR_0_A),
        .B(MAR_0_B),
        .D(alu_16bit_0_out),
        .clk(clockgen_0_clk),
        .inc(cu_0_mar_inc),
        .rst(cu_0_reset),
        .writeC(Decoder_0_mar));
  design_1_MDR_Mux_0_0 MDR_Mux_0
       (.C_Bus(alu_16bit_0_out),
        .MDR_in(MDR_Mux_0_MDR_in),
        .Mem_Data_Bus(data_ram_1_dout),
        .clk(clockgen_0_clk),
        .dmem_read(cu_0_dmem_read));
  design_1_PC_0_0 PC_0
       (.Z(alu_16bit_0_Z),
        .clk(clockgen_0_clk),
        .inc(cu_0_pc_inc),
        .jump(cu_0_jump),
        .pc_result(pc_project_demo_1_PCResult),
        .reset(cu_0_reset));
  design_1_R1_0_0 R1_0
       (.A(R1_0_A),
        .B(R1_0_B),
        .D(alu_16bit_0_out),
        .clk(clockgen_0_clk),
        .rst(cu_0_reset),
        .writeC(Decoder_0_str_pointer));
  /* MDR */
  design_1_R1_2_0 R1_2
       (.A(R1_2_A),
        .B(R1_2_B),
        .D(MDR_Mux_0_MDR_in),
        .clk(clockgen_0_clk),
        .rst(cu_0_reset),
        .writeC(Decoder_0_mdr));
  design_1_R1_3_0 R1_3
       (.A(R1_3_A),
        .B(R1_3_B),
        .D(alu_16bit_0_out),
        .clk(clockgen_0_clk),
        .rst(cu_0_reset),
        .writeC(Decoder_0_pr1));
  design_1_R1_4_0 R1_4
       (.A(R1_4_A),
        .B(R1_4_B),
        .D(alu_16bit_0_out),
        .clk(clockgen_0_clk),
        .rst(cu_0_reset),
        .writeC(Decoder_0_pr2));
  design_1_R1_5_0 R1_5
       (.A(R1_5_A),
        .B(R1_5_B),
        .D(alu_16bit_0_out),
        .clk(clockgen_0_clk),
        .rst(cu_0_reset),
        .writeC(Decoder_0_pr3));
  design_1_R1_8_0 R1_8
       (.A(R1_8_A),
        .B(R1_8_B),
        .D(alu_16bit_0_out),
        .clk(clockgen_0_clk),
        .rst(cu_0_reset),
        .writeC(Decoder_0_r1));
  design_1_R1_9_0 R1_9
       (.A(R1_9_A),
        .B(R1_9_B),
        .D(alu_16bit_0_out),
        .clk(clockgen_0_clk),
        .rst(cu_0_reset),
        .writeC(Decoder_0_r2));
  design_1_ROW_0_0 ROW_0
       (.A(ROW_0_A),
        .B(ROW_0_B),
        .D(alu_16bit_0_out),
        .clk(clockgen_0_clk),
        .inc(cu_0_row_inc),
        .rst(cu_0_reset),
        .writeC(Decoder_0_row));
  design_1_alu_16bit_0_0 alu_16bit_0
       (.Z(alu_16bit_0_Z),
        .clk(clockgen_0_clk),
        .dout(alu_16bit_0_out),
        .operand1(mux_0_out),
        .operand2(mux_1_out),
        .operation(cu_0_alu_ctrl));
  design_1_cu_0_0 cu_0
       (.alu_ctrl(cu_0_alu_ctrl),
        .clk(clockgen_0_clk),
        .col_inc(cu_0_col_inc),
        .col_zero(cu_0_col_zero),
        .dmem_read(cu_0_dmem_read),
        .dmem_write(cu_0_dmem_write),
        .en_decAop(cu_0_en_decAop),
        .en_decAout(cu_0_en_decAout),
        .en_decBop(cu_0_en_decBop),
        .en_decBout(cu_0_en_decBout),
        .en_decCop(cu_0_en_decCop),
        .en_decCout(cu_0_en_decCout),
        .imem_read(cu_0_imem_read),
        .ir(ir_module_0_A),
        .jump(cu_0_jump),
        .mar_inc(cu_0_mar_inc),
        .pc_inc(cu_0_pc_inc),
        .reset(cu_0_reset),
        .row_inc(cu_0_row_inc));
  design_1_data_ram_1_0 data_ram_1
       (.addr(MAR_0_A),
        .clk(clockgen_0_clk),
        .data(R1_2_A),
        .dout(data_ram_1_dout),
        .we(cu_0_dmem_write));
  design_1_imem_ram_0_0 imem_ram_0
       (.addr(pc_project_demo_1_PCResult),
        .clk(clockgen_0_clk),
        .data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dout(imem_ram_0_dout),
        .we(1'b0));
  design_1_ir_module_0_0 ir_module_0
       (.A(ir_module_0_A),
        .B(ir_module_0_B),
        .addrA(ir_module_0_addrA),
        .addrB(ir_module_0_addrB),
        .addrC(ir_module_0_addrC),
        .clk(clockgen_0_clk),
        .din(imem_ram_0_dout),
        .rst(cu_0_reset),
        .write_en(cu_0_imem_read));
  design_1_mux_0_0 mux_0
       (.clk(clockgen_0_clk),
        .col(COL_0_A),
        .dout(mux_0_out),
        .en_op(cu_0_en_decAop),
        .en_out(cu_0_en_decAout),
        .ir(ir_module_0_A),
        .mar(MAR_0_A),
        .mdr(R1_2_A),
        .pc(pc_project_demo_1_PCResult),
        .pr1(R1_3_A),
        .pr2(R1_4_A),
        .pr3(R1_5_A),
        .r1(R1_8_A),
        .r2(R1_9_A),
        .reset(cu_0_reset),
        .row(ROW_0_A),
        .sel(ir_module_0_addrA),
        .str_pointer(R1_0_A));
  design_1_mux_1_0 mux_1
       (.clk(clockgen_0_clk),
        .col(COL_0_B),
        .dout(mux_1_out),
        .en_op(cu_0_en_decBop),
        .en_out(cu_0_en_decBout),
        .ir(ir_module_0_B),
        .mar(MAR_0_B),
        .mdr(R1_2_B),
        .pc(pc_project_demo_1_PCResult),
        .pr1(R1_3_B),
        .pr2(R1_4_B),
        .pr3(R1_5_B),
        .r1(R1_8_B),
        .r2(R1_9_B),
        .reset(cu_0_reset),
        .row(ROW_0_B),
        .sel(ir_module_0_addrB),
        .str_pointer(R1_0_B));
endmodule
