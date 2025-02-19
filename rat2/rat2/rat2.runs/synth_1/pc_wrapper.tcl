# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/pangj/OneDrive - California Polytechnic State University/cpe233/rat2_new/rat2/rat2.cache/wt} [current_project]
set_property parent.project_path {C:/Users/pangj/OneDrive - California Polytechnic State University/cpe233/rat2_new/rat2/rat2.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
read_vhdl -library xil_defaultlib {
  {C:/Users/pangj/OneDrive - California Polytechnic State University/cpe233/rat2_new/rat2/rat2.srcs/sources_1/new/mux_4to1.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/cpe233/rat2_new/rat2/rat2.srcs/sources_1/new/pc.vhd}
  {C:/Users/pangj/OneDrive - California Polytechnic State University/cpe233/rat2_new/rat2/rat2.srcs/sources_1/new/rat2.vhd}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top pc_wrapper -part xc7a35tcpg236-1


write_checkpoint -force -noxdef pc_wrapper.dcp

catch { report_utilization -file pc_wrapper_utilization_synth.rpt -pb pc_wrapper_utilization_synth.pb }
