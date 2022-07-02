vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xlconstant_v1_1_7

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xlconstant_v1_1_7 questa_lib/msim/xlconstant_v1_1_7

vlog -work xil_defaultlib  -incr -mfcu \
"../../../bd/design_1/ip/design_1_R1_0_0/sim/design_1_R1_0_0.v" \
"../../../bd/design_1/ip/design_1_R1_2_0/sim/design_1_R1_2_0.v" \
"../../../bd/design_1/ip/design_1_R1_3_0/sim/design_1_R1_3_0.v" \
"../../../bd/design_1/ip/design_1_R1_4_0/sim/design_1_R1_4_0.v" \
"../../../bd/design_1/ip/design_1_R1_5_0/sim/design_1_R1_5_0.v" \
"../../../bd/design_1/ip/design_1_R1_8_0/sim/design_1_R1_8_0.v" \
"../../../bd/design_1/ip/design_1_R1_9_0/sim/design_1_R1_9_0.v" \
"../../../bd/design_1/ip/design_1_cu_0_0/sim/design_1_cu_0_0.v" \
"../../../bd/design_1/ip/design_1_MAR_0_0/sim/design_1_MAR_0_0.v" \
"../../../bd/design_1/ip/design_1_PC_0_0/sim/design_1_PC_0_0.v" \
"../../../bd/design_1/ip/design_1_mux_0_0/sim/design_1_mux_0_0.v" \
"../../../bd/design_1/ip/design_1_mux_1_0/sim/design_1_mux_1_0.v" \
"../../../bd/design_1/ip/design_1_ir_module_0_0/sim/design_1_ir_module_0_0.v" \
"../../../bd/design_1/ip/design_1_data_ram_1_0/sim/design_1_data_ram_1_0.v" \
"../../../bd/design_1/ip/design_1_alu_16bit_0_0/sim/design_1_alu_16bit_0_0.v" \
"../../../bd/design_1/ip/design_1_clockgen_0_0/sim/design_1_clockgen_0_0.v" \
"../../../bd/design_1/ip/design_1_Decoder_0_0/sim/design_1_Decoder_0_0.v" \
"../../../bd/design_1/ip/design_1_ROW_0_0/sim/design_1_ROW_0_0.v" \
"../../../bd/design_1/ip/design_1_COL_0_0/sim/design_1_COL_0_0.v" \
"../../../bd/design_1/ip/design_1_MDR_Mux_0_0/sim/design_1_MDR_Mux_0_0.v" \
"../../../bd/design_1/ip/design_1_imem_ram_0_0/sim/design_1_imem_ram_0_0.v" \

vlog -work xlconstant_v1_1_7  -incr -mfcu \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

