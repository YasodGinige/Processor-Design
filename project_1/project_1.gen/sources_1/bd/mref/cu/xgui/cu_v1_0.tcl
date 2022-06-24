# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ADDR_AW" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ADDR_BW" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BUS_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DESTW" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OPCODE_LEN" -parent ${Page_0}


}

proc update_PARAM_VALUE.ADDR_AW { PARAM_VALUE.ADDR_AW } {
	# Procedure called to update ADDR_AW when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_AW { PARAM_VALUE.ADDR_AW } {
	# Procedure called to validate ADDR_AW
	return true
}

proc update_PARAM_VALUE.ADDR_BW { PARAM_VALUE.ADDR_BW } {
	# Procedure called to update ADDR_BW when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_BW { PARAM_VALUE.ADDR_BW } {
	# Procedure called to validate ADDR_BW
	return true
}

proc update_PARAM_VALUE.BUS_WIDTH { PARAM_VALUE.BUS_WIDTH } {
	# Procedure called to update BUS_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BUS_WIDTH { PARAM_VALUE.BUS_WIDTH } {
	# Procedure called to validate BUS_WIDTH
	return true
}

proc update_PARAM_VALUE.DESTW { PARAM_VALUE.DESTW } {
	# Procedure called to update DESTW when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DESTW { PARAM_VALUE.DESTW } {
	# Procedure called to validate DESTW
	return true
}

proc update_PARAM_VALUE.OPCODE_LEN { PARAM_VALUE.OPCODE_LEN } {
	# Procedure called to update OPCODE_LEN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OPCODE_LEN { PARAM_VALUE.OPCODE_LEN } {
	# Procedure called to validate OPCODE_LEN
	return true
}


proc update_MODELPARAM_VALUE.BUS_WIDTH { MODELPARAM_VALUE.BUS_WIDTH PARAM_VALUE.BUS_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BUS_WIDTH}] ${MODELPARAM_VALUE.BUS_WIDTH}
}

proc update_MODELPARAM_VALUE.OPCODE_LEN { MODELPARAM_VALUE.OPCODE_LEN PARAM_VALUE.OPCODE_LEN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OPCODE_LEN}] ${MODELPARAM_VALUE.OPCODE_LEN}
}

proc update_MODELPARAM_VALUE.ADDR_AW { MODELPARAM_VALUE.ADDR_AW PARAM_VALUE.ADDR_AW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_AW}] ${MODELPARAM_VALUE.ADDR_AW}
}

proc update_MODELPARAM_VALUE.ADDR_BW { MODELPARAM_VALUE.ADDR_BW PARAM_VALUE.ADDR_BW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_BW}] ${MODELPARAM_VALUE.ADDR_BW}
}

proc update_MODELPARAM_VALUE.DESTW { MODELPARAM_VALUE.DESTW PARAM_VALUE.DESTW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DESTW}] ${MODELPARAM_VALUE.DESTW}
}

