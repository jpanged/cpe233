# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.cache/wt} [current_project]
set_property parent.project_path {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_vhdl -library xil_defaultlib {
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/new/pc.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/new/mux_4to1.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/Debounce_OneShot_FSM/counter_for_one_shot.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/new/stack_pointer.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/new/Scratch_RAM.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/new/register_file.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/new/rat_alu.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/new/rat2.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/new/prog_rom.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/new/mux_scr_data_in.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/new/mux_rf.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/new/mux_2T1.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/new/flags_mux_2to1.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/new/d_flip_flop.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/new/control_unit.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/new/mealy_sseg.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/Debounce_OneShot_FSM/debounce_one_shot_FSM.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/new/rat_mcu.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/sources_1/imports/new/RAT_WRAPPER.vhd}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/constrs_1/imports/new/rat_wrapper_constraints.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/pangj/OneDrive - California Polytechnic State University/rat-cpu/final_project/hoop_driver/hoop_driver.srcs/constrs_1/imports/new/rat_wrapper_constraints.xdc}}]


synth_design -top RAT_wrapper -part xc7a35tcpg236-1


write_checkpoint -force -noxdef RAT_wrapper.dcp

catch { report_utilization -file RAT_wrapper_utilization_synth.rpt -pb RAT_wrapper_utilization_synth.pb }
