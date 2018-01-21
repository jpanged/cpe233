# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/pangj/OneDrive - California Polytechnic State University/cpe233/hw1/hw_1/hw_1.cache/wt} [current_project]
set_property parent.project_path {C:/Users/pangj/OneDrive - California Polytechnic State University/cpe233/hw1/hw_1/hw_1.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_vhdl -library xil_defaultlib {{C:/Users/pangj/OneDrive - California Polytechnic State University/cpe233/hw1/hw_1/hw_1.srcs/sources_1/new/pwm_dac.vhd}}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/pangj/OneDrive - California Polytechnic State University/cpe233/hw1/hw_1/hw_1.srcs/constrs_1/new/adsf.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/pangj/OneDrive - California Polytechnic State University/cpe233/hw1/hw_1/hw_1.srcs/constrs_1/new/adsf.xdc}}]


synth_design -top pwm_dac -part xc7a35tcpg236-1


write_checkpoint -force -noxdef pwm_dac.dcp

catch { report_utilization -file pwm_dac_utilization_synth.rpt -pb pwm_dac_utilization_synth.pb }
