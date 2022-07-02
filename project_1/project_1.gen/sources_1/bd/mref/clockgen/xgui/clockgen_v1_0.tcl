# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "DUTY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FREQ" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PHASE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "clk_off" -parent ${Page_0}
  ipgui::add_param $IPINST -name "clk_on" -parent ${Page_0}
  ipgui::add_param $IPINST -name "clk_pd" -parent ${Page_0}
  ipgui::add_param $IPINST -name "quarter" -parent ${Page_0}
  ipgui::add_param $IPINST -name "start_dly" -parent ${Page_0}


}

proc update_PARAM_VALUE.DUTY { PARAM_VALUE.DUTY } {
	# Procedure called to update DUTY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DUTY { PARAM_VALUE.DUTY } {
	# Procedure called to validate DUTY
	return true
}

proc update_PARAM_VALUE.FREQ { PARAM_VALUE.FREQ } {
	# Procedure called to update FREQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FREQ { PARAM_VALUE.FREQ } {
	# Procedure called to validate FREQ
	return true
}

proc update_PARAM_VALUE.PHASE { PARAM_VALUE.PHASE } {
	# Procedure called to update PHASE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PHASE { PARAM_VALUE.PHASE } {
	# Procedure called to validate PHASE
	return true
}

proc update_PARAM_VALUE.clk_off { PARAM_VALUE.clk_off } {
	# Procedure called to update clk_off when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.clk_off { PARAM_VALUE.clk_off } {
	# Procedure called to validate clk_off
	return true
}

proc update_PARAM_VALUE.clk_on { PARAM_VALUE.clk_on } {
	# Procedure called to update clk_on when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.clk_on { PARAM_VALUE.clk_on } {
	# Procedure called to validate clk_on
	return true
}

proc update_PARAM_VALUE.clk_pd { PARAM_VALUE.clk_pd } {
	# Procedure called to update clk_pd when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.clk_pd { PARAM_VALUE.clk_pd } {
	# Procedure called to validate clk_pd
	return true
}

proc update_PARAM_VALUE.quarter { PARAM_VALUE.quarter } {
	# Procedure called to update quarter when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.quarter { PARAM_VALUE.quarter } {
	# Procedure called to validate quarter
	return true
}

proc update_PARAM_VALUE.start_dly { PARAM_VALUE.start_dly } {
	# Procedure called to update start_dly when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.start_dly { PARAM_VALUE.start_dly } {
	# Procedure called to validate start_dly
	return true
}


proc update_MODELPARAM_VALUE.FREQ { MODELPARAM_VALUE.FREQ PARAM_VALUE.FREQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FREQ}] ${MODELPARAM_VALUE.FREQ}
}

proc update_MODELPARAM_VALUE.PHASE { MODELPARAM_VALUE.PHASE PARAM_VALUE.PHASE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PHASE}] ${MODELPARAM_VALUE.PHASE}
}

proc update_MODELPARAM_VALUE.DUTY { MODELPARAM_VALUE.DUTY PARAM_VALUE.DUTY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DUTY}] ${MODELPARAM_VALUE.DUTY}
}

proc update_MODELPARAM_VALUE.clk_pd { MODELPARAM_VALUE.clk_pd PARAM_VALUE.clk_pd } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.clk_pd}] ${MODELPARAM_VALUE.clk_pd}
}

proc update_MODELPARAM_VALUE.clk_on { MODELPARAM_VALUE.clk_on PARAM_VALUE.clk_on } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.clk_on}] ${MODELPARAM_VALUE.clk_on}
}

proc update_MODELPARAM_VALUE.clk_off { MODELPARAM_VALUE.clk_off PARAM_VALUE.clk_off } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.clk_off}] ${MODELPARAM_VALUE.clk_off}
}

proc update_MODELPARAM_VALUE.quarter { MODELPARAM_VALUE.quarter PARAM_VALUE.quarter } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.quarter}] ${MODELPARAM_VALUE.quarter}
}

proc update_MODELPARAM_VALUE.start_dly { MODELPARAM_VALUE.start_dly PARAM_VALUE.start_dly } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.start_dly}] ${MODELPARAM_VALUE.start_dly}
}

