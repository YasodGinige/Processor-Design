// (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:cu:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_cu_0_0 (
  ir,
  clk,
  reset,
  en_decAop,
  en_decBop,
  en_decCop,
  en_decAout,
  en_decBout,
  en_decCout,
  alu_ctrl,
  dmem_read,
  dmem_write,
  imem_read,
  pc_inc,
  mar_inc,
  col_zero,
  col_inc,
  row_inc,
  jump,
  clock_en
);

input wire [15 : 0] ir;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clockgen_0_0_clk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *)
output wire reset;
output wire en_decAop;
output wire en_decBop;
output wire en_decCop;
output wire en_decAout;
output wire en_decBout;
output wire en_decCout;
output wire [3 : 0] alu_ctrl;
output wire dmem_read;
output wire dmem_write;
output wire imem_read;
output wire pc_inc;
output wire mar_inc;
output wire col_zero;
output wire col_inc;
output wire row_inc;
output wire jump;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clock_en, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_cu_0_0_clock_en, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clock_en CLK" *)
output wire clock_en;

  cu #(
    .BUS_WIDTH(16),
    .OPCODE_LEN(4),
    .ADDR_AW(4),
    .ADDR_BW(4),
    .DESTW(4)
  ) inst (
    .ir(ir),
    .clk(clk),
    .reset(reset),
    .en_decAop(en_decAop),
    .en_decBop(en_decBop),
    .en_decCop(en_decCop),
    .en_decAout(en_decAout),
    .en_decBout(en_decBout),
    .en_decCout(en_decCout),
    .alu_ctrl(alu_ctrl),
    .dmem_read(dmem_read),
    .dmem_write(dmem_write),
    .imem_read(imem_read),
    .pc_inc(pc_inc),
    .mar_inc(mar_inc),
    .col_zero(col_zero),
    .col_inc(col_inc),
    .row_inc(row_inc),
    .jump(jump),
    .clock_en(clock_en)
  );
endmodule
