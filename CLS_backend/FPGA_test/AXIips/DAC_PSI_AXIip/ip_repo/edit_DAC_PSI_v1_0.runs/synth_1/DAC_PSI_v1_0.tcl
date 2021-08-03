# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param tcl.collectionResultDisplayLimit 0
set_param chipscope.maxJobs 2
set_param xicom.use_bs_reader 1
set_msg_config -id {HDL-1065} -limit 10000
create_project -in_memory -part xc7k325tffg900-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir E:/Memristor_testboard/FPGA_test/DAC_PSI_platform/ip_repo/edit_DAC_PSI_v1_0.cache/wt [current_project]
set_property parent.project_path E:/Memristor_testboard/FPGA_test/DAC_PSI_platform/ip_repo/edit_DAC_PSI_v1_0.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths {
  e:/CLS_frontend/AxiIPs/16bitsDAC_driver/ip_repo/DAC_driver_1.0
  e:/Memristor_testboard/FPGA_test/DAC_PSI_platform/ip_repo/DAC_PSI_1.0
} [current_project]
update_ip_catalog
set_property ip_output_repo e:/Memristor_testboard/FPGA_test/DAC_PSI_platform/ip_repo/edit_DAC_PSI_v1_0.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library "" {
  E:/Memristor_testboard/FPGA_test/DAC_PSI_platform/ip_repo/DAC_PSI_1.0/hdl/DAC_PSI_v1_0_S00_AXI.v
  E:/Memristor_testboard/FPGA_test/DAC_PSI_platform/ip_repo/DAC_PSI_1.0/hdl/DAC_PSI_v1_0.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top DAC_PSI_v1_0 -part xc7k325tffg900-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef DAC_PSI_v1_0.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file DAC_PSI_v1_0_utilization_synth.rpt -pb DAC_PSI_v1_0_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
