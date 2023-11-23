#*****************************************************************************************
# Vivado (TM) v2022.1 (64-bit)
#
# normalized_lsl_fpga.tcl: Tcl script for re-creating project 'normalized_lsl_fpga'
#
# IP Build 3524634 on Mon Apr 18 20:55:01 MDT 2022
#
# This file contains the Vivado Tcl commands for re-creating the project to the state*
# when this script was generated. In order to re-create the project, please source this
# file in the Vivado Tcl Shell.
#
# * Note that the runs in the created project will be configured the same way as the
#   original project, however they will not be launched automatically. To regenerate the
#   run results please launch the synthesis/implementation runs as needed.
#
#*****************************************************************************************
# Check file required for this script exists
proc checkRequiredFiles { origin_dir} {
  set status true
  set files [list \
 "[file normalize "$origin_dir/../lsl_fpga/src/dsp_pkg.vhd"]"\
 "[file normalize "$origin_dir/src/dsp_pkg.vhd"]"\
 "[file normalize "$origin_dir/../lsl_fpga/src/update_slice.vhd"]"\
 "[file normalize "$origin_dir/src/lsl_core.vhd"]"\
 "[file normalize "$origin_dir/src/postmul_resizer.vhd"]"\
 "[file normalize "$origin_dir/src/c_port_resizer.vhd"]"\
 "[file normalize "$origin_dir/src/delay.vhd"]"\
 "[file normalize "$origin_dir/src/mux.vhd"]"\
 "[file normalize "$origin_dir/src/postmul_resizer_wideinput.vhd"]"\
 "[file normalize "$origin_dir/src/normalize.vhd"]"\
 "[file normalize "$origin_dir/src/update_slice.vhd"]"\
 "[file normalize "$origin_dir/src/divider.vhd"]"\
 "[file normalize "$origin_dir/vivado_project/normalized_lsl_fpga.srcs/sources_1/imports/hdl/init_chi_wrapper.vhd"]"\
 "[file normalize "$origin_dir/src/scalar_delay.vhd"]"\
 "[file normalize "$origin_dir/src/tb/update_gamma_tb.vhd"]"\
 "[file normalize "$origin_dir/src/wave_config/tb_behav_gamma.wcfg"]"\
 "[file normalize "$origin_dir/src/tb/update_epsilon_tb.vhd"]"\
 "[file normalize "$origin_dir/src/wave_config/tb_behav_epsilon.wcfg"]"\
 "[file normalize "$origin_dir/src/tb/update_kappa_tb.vhd"]"\
 "[file normalize "$origin_dir/src/wave_config/tb_behav_kappa.wcfg"]"\
 "[file normalize "$origin_dir/src/tb/update_xi_tb.vhd"]"\
 "[file normalize "$origin_dir/src/wave_config/tb_behav_xi.wcfg"]"\
  ]
  foreach ifile $files {
    if { ![file isfile $ifile] } {
      puts " Could not find remote file $ifile "
      set status false
    }
  }

  return $status
}
# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir [file dirname [info script]]

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

# Set the project name
set _xil_proj_name_ "normalized_lsl_fpga"

# Use project name variable, if specified in the tcl shell
if { [info exists ::user_project_name] } {
  set _xil_proj_name_ $::user_project_name
}

variable script_file
set script_file "normalized_lsl_fpga.tcl"

# Help information for this script
proc print_help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--project_name <name>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--project_name <name>\] Create project with the specified name. Default"
  puts "                       name is the name of the project from where this"
  puts "                       script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < $::argc} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir"   { incr i; set origin_dir [lindex $::argv $i] }
      "--project_name" { incr i; set _xil_proj_name_ [lindex $::argv $i] }
      "--help"         { print_help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/vivado_project"]"

# Check for paths and files needed for project creation
set validate_required 0
if { $validate_required } {
  if { [checkRequiredFiles $origin_dir] } {
    puts "Tcl file $script_file is valid. All files required for project creation is accesable. "
  } else {
    puts "Tcl file $script_file is not valid. Not all files required for project creation is accesable. "
    return
  }
}

# Create project
create_project ${_xil_proj_name_} $origin_dir/vivado_project -part xc7a35tcpg236-1 -quiet -force

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [current_project]
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "enable_resource_estimation" -value "0" -objects $obj
set_property -name "enable_vhdl_2008" -value "1" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/${_xil_proj_name_}.cache/ip" -objects $obj
set_property -name "mem.enable_memory_map_generation" -value "1" -objects $obj
set_property -name "part" -value "xc7a35tcpg236-1" -objects $obj
set_property -name "revised_directory_structure" -value "1" -objects $obj
set_property -name "sim.central_dir" -value "$proj_dir/${_xil_proj_name_}.ip_user_files" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "simulator.activehdl_gcc_version" -value "9.3.0" -objects $obj
set_property -name "simulator.activehdl_version" -value "12.0" -objects $obj
set_property -name "simulator.ies_gcc_version" -value "6.2.0" -objects $obj
set_property -name "simulator.ies_version" -value "15.20.083" -objects $obj
set_property -name "simulator.modelsim_gcc_version" -value "7.4.0" -objects $obj
set_property -name "simulator.modelsim_version" -value "2021.3" -objects $obj
set_property -name "simulator.questa_gcc_version" -value "7.4.0" -objects $obj
set_property -name "simulator.questa_version" -value "2021.3" -objects $obj
set_property -name "simulator.riviera_gcc_version" -value "9.3.0" -objects $obj
set_property -name "simulator.riviera_version" -value "2021.04" -objects $obj
set_property -name "simulator.vcs_gcc_version" -value "9.2.0" -objects $obj
set_property -name "simulator.vcs_version" -value "S-2021.09" -objects $obj
set_property -name "simulator.xcelium_gcc_version" -value "9.3.0" -objects $obj
set_property -name "simulator.xcelium_version" -value "21.09.002" -objects $obj
set_property -name "simulator.xsim_gcc_version" -value "6.2.0" -objects $obj
set_property -name "simulator.xsim_version" -value "2022.1" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "source_mgmt_mode" -value "DisplayOnly" -objects $obj
set_property -name "target_language" -value "VHDL" -objects $obj
set_property -name "webtalk.activehdl_export_sim" -value "55" -objects $obj
set_property -name "webtalk.ies_export_sim" -value "30" -objects $obj
set_property -name "webtalk.modelsim_export_sim" -value "55" -objects $obj
set_property -name "webtalk.questa_export_sim" -value "55" -objects $obj
set_property -name "webtalk.riviera_export_sim" -value "55" -objects $obj
set_property -name "webtalk.vcs_export_sim" -value "55" -objects $obj
set_property -name "webtalk.xcelium_export_sim" -value "8" -objects $obj
set_property -name "webtalk.xsim_export_sim" -value "55" -objects $obj
set_property -name "webtalk.xsim_launch_sim" -value "601" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
set files [list \
 [file normalize "${origin_dir}/../lsl_fpga/src/dsp_pkg.vhd"] \
 [file normalize "${origin_dir}/src/dsp_pkg.vhd"] \
 [file normalize "${origin_dir}/../lsl_fpga/src/update_slice.vhd"] \
 [file normalize "${origin_dir}/src/lsl_core.vhd"] \
 [file normalize "${origin_dir}/src/postmul_resizer.vhd"] \
 [file normalize "${origin_dir}/src/c_port_resizer.vhd"] \
 [file normalize "${origin_dir}/src/delay.vhd"] \
 [file normalize "${origin_dir}/src/mux.vhd"] \
 [file normalize "${origin_dir}/src/postmul_resizer_wideinput.vhd"] \
 [file normalize "${origin_dir}/src/normalize.vhd"] \
 [file normalize "${origin_dir}/src/update_slice.vhd"] \
 [file normalize "${origin_dir}/src/divider.vhd"] \
 [file normalize "${origin_dir}/vivado_project/normalized_lsl_fpga.srcs/sources_1/imports/hdl/init_chi_wrapper.vhd"] \
 [file normalize "${origin_dir}/src/scalar_delay.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
set file "$origin_dir/../lsl_fpga/src/dsp_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/dsp_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/../lsl_fpga/src/update_slice.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/lsl_core.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/postmul_resizer.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/c_port_resizer.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/delay.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/mux.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/postmul_resizer_wideinput.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/normalize.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/update_slice.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/divider.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/vivado_project/normalized_lsl_fpga.srcs/sources_1/imports/hdl/init_chi_wrapper.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/scalar_delay.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'sources_1' fileset file properties for local files
# None

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "lsl_core" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Empty (no sources present)

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]
set_property -name "target_part" -value "xc7a35tcpg236-1" -objects $obj

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "top" -value "divider_test_wrapper" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj

# Create 'test_gamma_update' fileset (if not found)
if {[string equal [get_filesets -quiet test_gamma_update] ""]} {
  create_fileset -simset test_gamma_update
}

# Set 'test_gamma_update' fileset object
set obj [get_filesets test_gamma_update]
set files [list \
 [file normalize "${origin_dir}/src/tb/update_gamma_tb.vhd"] \
 [file normalize "${origin_dir}/src/wave_config/tb_behav_gamma.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'test_gamma_update' fileset file properties for remote files
set file "$origin_dir/src/tb/update_gamma_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets test_gamma_update] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'test_gamma_update' fileset file properties for local files
# None

# Set 'test_gamma_update' fileset properties
set obj [get_filesets test_gamma_update]
set_property -name "top" -value "tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj

# Create 'test_epsilon_update' fileset (if not found)
if {[string equal [get_filesets -quiet test_epsilon_update] ""]} {
  create_fileset -simset test_epsilon_update
}

# Set 'test_epsilon_update' fileset object
set obj [get_filesets test_epsilon_update]
set files [list \
 [file normalize "${origin_dir}/src/tb/update_epsilon_tb.vhd"] \
 [file normalize "${origin_dir}/src/wave_config/tb_behav_epsilon.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'test_epsilon_update' fileset file properties for remote files
set file "$origin_dir/src/tb/update_epsilon_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets test_epsilon_update] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'test_epsilon_update' fileset file properties for local files
# None

# Set 'test_epsilon_update' fileset properties
set obj [get_filesets test_epsilon_update]
set_property -name "top" -value "tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj

# Create 'test_kappa_update' fileset (if not found)
if {[string equal [get_filesets -quiet test_kappa_update] ""]} {
  create_fileset -simset test_kappa_update
}

# Set 'test_kappa_update' fileset object
set obj [get_filesets test_kappa_update]
set files [list \
 [file normalize "${origin_dir}/src/tb/update_kappa_tb.vhd"] \
 [file normalize "${origin_dir}/src/wave_config/tb_behav_kappa.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'test_kappa_update' fileset file properties for remote files
set file "$origin_dir/src/tb/update_kappa_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets test_kappa_update] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'test_kappa_update' fileset file properties for local files
# None

# Set 'test_kappa_update' fileset properties
set obj [get_filesets test_kappa_update]
set_property -name "top" -value "tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj

# Create 'test_xi_update' fileset (if not found)
if {[string equal [get_filesets -quiet test_xi_update] ""]} {
  create_fileset -simset test_xi_update
}

# Set 'test_xi_update' fileset object
set obj [get_filesets test_xi_update]
set files [list \
 [file normalize "${origin_dir}/src/tb/update_xi_tb.vhd"] \
 [file normalize "${origin_dir}/src/wave_config/tb_behav_xi.wcfg"] \
]
add_files -norecurse -fileset $obj $files

# Set 'test_xi_update' fileset file properties for remote files
set file "$origin_dir/src/tb/update_xi_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets test_xi_update] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'test_xi_update' fileset file properties for local files
# None

# Set 'test_xi_update' fileset properties
set obj [get_filesets test_xi_update]
set_property -name "top" -value "tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj

# Set 'utils_1' fileset object
set obj [get_filesets utils_1]
# Empty (no sources present)

# Set 'utils_1' fileset properties
set obj [get_filesets utils_1]


# Adding sources referenced in BDs, if not already added


# Proc to create BD divider_test
proc cr_bd_divider_test { parentCell } {

  # CHANGE DESIGN NAME HERE
  set design_name divider_test

  common::send_gid_msg -ssname BD::TCL -id 2010 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

  create_bd_design $design_name

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  xilinx.com:ip:div_gen:5.1\
  "

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

  }

  if { $bCheckIPsPassed != 1 } {
    common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
    return 3
  }

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set i_a [ create_bd_port -dir I -from 17 -to 0 i_a ]
  set i_b [ create_bd_port -dir I -from 17 -to 0 i_b ]
  set i_ck [ create_bd_port -dir I i_ck ]
  set o_aready [ create_bd_port -dir O o_aready ]
  set o_bready [ create_bd_port -dir O o_bready ]
  set o_res [ create_bd_port -dir O -from 39 -to 0 o_res ]
  set o_valid [ create_bd_port -dir O o_valid ]
  set valid [ create_bd_port -dir I valid ]

  # Create instance: div_gen_0, and set properties
  set div_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:div_gen:5.1 div_gen_0 ]
  set_property -dict [ list \
   CONFIG.FlowControl {NonBlocking} \
   CONFIG.algorithm_type {High_Radix} \
   CONFIG.dividend_and_quotient_width {18} \
   CONFIG.divisor_width {18} \
   CONFIG.fractional_width {15} \
   CONFIG.latency {4} \
   CONFIG.latency_configuration {Manual} \
   CONFIG.remainder_type {Fractional} \
 ] $div_gen_0

  # Create port connections
  connect_bd_net -net div_gen_0_m_axis_dout_tdata [get_bd_ports o_res] [get_bd_pins div_gen_0/m_axis_dout_tdata]
  connect_bd_net -net div_gen_0_m_axis_dout_tvalid [get_bd_ports o_valid] [get_bd_pins div_gen_0/m_axis_dout_tvalid]
  connect_bd_net -net div_gen_0_s_axis_dividend_tready [get_bd_ports o_aready] [get_bd_pins div_gen_0/s_axis_dividend_tready]
  connect_bd_net -net div_gen_0_s_axis_divisor_tready [get_bd_ports o_bready] [get_bd_pins div_gen_0/s_axis_divisor_tready]
  connect_bd_net -net i_a_1 [get_bd_ports i_a] [get_bd_pins div_gen_0/s_axis_dividend_tdata]
  connect_bd_net -net i_b_1 [get_bd_ports i_b] [get_bd_pins div_gen_0/s_axis_divisor_tdata]
  connect_bd_net -net i_ck_1 [get_bd_ports i_ck] [get_bd_pins div_gen_0/aclk]
  connect_bd_net -net valid_1 [get_bd_ports valid] [get_bd_pins div_gen_0/s_axis_dividend_tvalid] [get_bd_pins div_gen_0/s_axis_divisor_tvalid]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_divider_test()
cr_bd_divider_test ""
set_property REGISTERED_WITH_MANAGER "1" [get_files divider_test.bd ] 
set_property SYNTH_CHECKPOINT_MODE "Hierarchical" [get_files divider_test.bd ] 


# Create wrapper file for divider_test.bd
make_wrapper -files [get_files divider_test.bd] -import -top



# Proc to create BD update_xi
proc cr_bd_update_xi { parentCell } {
# The design that will be created by this Tcl proc contains the following 
# module references:
# normalize, normalize



  # CHANGE DESIGN NAME HERE
  set design_name update_xi

  common::send_gid_msg -ssname BD::TCL -id 2010 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

  create_bd_design $design_name

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  xilinx.com:ip:c_addsub:12.0\
  xilinx.com:ip:dsp_macro:1.0\
  xilinx.com:ip:xlslice:1.0\
  xilinx.com:ip:mult_gen:12.0\
  "

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

  }

  ##################################################################
  # CHECK Modules
  ##################################################################
  set bCheckModules 1
  if { $bCheckModules == 1 } {
     set list_check_mods "\ 
  normalize\
  normalize\
  "

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

  if { $bCheckIPsPassed != 1 } {
    common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
    return 3
  }

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set ck [ create_bd_port -dir I ck ]
  set eb_m1 [ create_bd_port -dir I -from 17 -to 0 eb_m1 ]
  set ef_m1 [ create_bd_port -dir I -from 17 -to 0 ef_m1 ]
  set geb_m1 [ create_bd_port -dir I -from 17 -to 0 geb_m1 ]
  set gef_m1 [ create_bd_port -dir I -from 17 -to 0 gef_m1 ]
  set xib1_m1 [ create_bd_port -dir I -from 17 -to 0 xib1_m1 ]
  set xib_m1 [ create_bd_port -dir O -from 17 -to 0 xib_m1 ]
  set xif1_m1 [ create_bd_port -dir I -from 17 -to 0 xif1_m1 ]
  set xif_m1 [ create_bd_port -dir O -from 17 -to 0 xif_m1 ]

  # Create instance: c_addsub_0, and set properties
  set c_addsub_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_0 ]
  set_property -dict [ list \
   CONFIG.A_Width {18} \
   CONFIG.B_Value {000000000000000000} \
   CONFIG.B_Width {18} \
   CONFIG.CE {false} \
   CONFIG.Latency {0} \
   CONFIG.Out_Width {18} \
 ] $c_addsub_0

  # Create instance: c_addsub_1, and set properties
  set c_addsub_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_1 ]
  set_property -dict [ list \
   CONFIG.A_Width {18} \
   CONFIG.B_Value {000000000000000000} \
   CONFIG.B_Width {18} \
   CONFIG.CE {false} \
   CONFIG.Latency {0} \
   CONFIG.Out_Width {18} \
 ] $c_addsub_1

  # Create instance: gebsq, and set properties
  set gebsq [ create_bd_cell -type ip -vlnv xilinx.com:ip:dsp_macro:1.0 gebsq ]
  set_property -dict [ list \
   CONFIG.areg_3 {false} \
   CONFIG.areg_4 {false} \
   CONFIG.breg_3 {false} \
   CONFIG.breg_4 {false} \
   CONFIG.creg_3 {false} \
   CONFIG.creg_4 {false} \
   CONFIG.creg_5 {false} \
   CONFIG.instruction1 {A*B} \
   CONFIG.mreg_5 {true} \
   CONFIG.p_binarywidth {0} \
   CONFIG.p_full_width {36} \
   CONFIG.p_width {36} \
   CONFIG.pipeline_options {Expert} \
   CONFIG.preg_6 {false} \
 ] $gebsq

  # Create instance: gefsq, and set properties
  set gefsq [ create_bd_cell -type ip -vlnv xilinx.com:ip:dsp_macro:1.0 gefsq ]
  set_property -dict [ list \
   CONFIG.areg_3 {false} \
   CONFIG.areg_4 {false} \
   CONFIG.breg_3 {false} \
   CONFIG.breg_4 {false} \
   CONFIG.creg_3 {false} \
   CONFIG.creg_4 {false} \
   CONFIG.creg_5 {false} \
   CONFIG.instruction1 {A*B} \
   CONFIG.mreg_5 {true} \
   CONFIG.p_binarywidth {0} \
   CONFIG.p_full_width {36} \
   CONFIG.p_width {36} \
   CONFIG.pipeline_options {Expert} \
   CONFIG.preg_6 {false} \
 ] $gefsq

  # Create instance: normalize_0, and set properties
  set block_name normalize
  set block_cell_name normalize_0
  if { [catch {set normalize_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $normalize_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: normalize_1, and set properties
  set block_name normalize
  set block_cell_name normalize_1
  if { [catch {set normalize_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $normalize_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: resize, and set properties
  set resize [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 resize ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {32} \
   CONFIG.DIN_TO {15} \
   CONFIG.DIN_WIDTH {33} \
   CONFIG.DOUT_WIDTH {18} \
 ] $resize

  # Create instance: resize1, and set properties
  set resize1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 resize1 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {32} \
   CONFIG.DIN_TO {15} \
   CONFIG.DIN_WIDTH {33} \
   CONFIG.DOUT_WIDTH {18} \
 ] $resize1

  # Create instance: xib_times_lambda, and set properties
  set xib_times_lambda [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 xib_times_lambda ]
  set_property -dict [ list \
   CONFIG.ConstValue {32704} \
   CONFIG.MultType {Constant_Coefficient_Multiplier} \
   CONFIG.OutputWidthHigh {32} \
 ] $xib_times_lambda

  # Create instance: xif_times_lambda, and set properties
  set xif_times_lambda [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 xif_times_lambda ]
  set_property -dict [ list \
   CONFIG.ConstValue {32704} \
   CONFIG.MultType {Constant_Coefficient_Multiplier} \
   CONFIG.OutputWidthHigh {32} \
   CONFIG.Use_Custom_Output_Width {false} \
 ] $xif_times_lambda

  # Create port connections
  connect_bd_net -net c_addsub_0_S [get_bd_ports xib_m1] [get_bd_pins c_addsub_0/S]
  connect_bd_net -net c_addsub_1_S [get_bd_ports xif_m1] [get_bd_pins c_addsub_1/S]
  connect_bd_net -net ck_1 [get_bd_ports ck] [get_bd_pins gebsq/CLK] [get_bd_pins gefsq/CLK] [get_bd_pins xib_times_lambda/CLK] [get_bd_pins xif_times_lambda/CLK]
  connect_bd_net -net eb_m1_1 [get_bd_ports eb_m1] [get_bd_pins gebsq/A]
  connect_bd_net -net ef_m1_1 [get_bd_ports ef_m1] [get_bd_pins gefsq/A]
  connect_bd_net -net geb_m1_1 [get_bd_ports geb_m1] [get_bd_pins gebsq/B]
  connect_bd_net -net gebsq_P [get_bd_pins gebsq/P] [get_bd_pins normalize_0/i_data]
  connect_bd_net -net gef_m1_1 [get_bd_ports gef_m1] [get_bd_pins gefsq/B]
  connect_bd_net -net gefsq_P [get_bd_pins gefsq/P] [get_bd_pins normalize_1/i_data]
  connect_bd_net -net mult_gen_0_P [get_bd_pins resize1/Din] [get_bd_pins xif_times_lambda/P]
  connect_bd_net -net mult_gen_1_P [get_bd_pins resize/Din] [get_bd_pins xib_times_lambda/P]
  connect_bd_net -net normalize_0_o_data [get_bd_pins c_addsub_0/B] [get_bd_pins normalize_0/o_data]
  connect_bd_net -net normalize_1_o_data [get_bd_pins c_addsub_1/B] [get_bd_pins normalize_1/o_data]
  connect_bd_net -net resize1_Dout [get_bd_pins c_addsub_1/A] [get_bd_pins resize1/Dout]
  connect_bd_net -net resize_Dout [get_bd_pins c_addsub_0/A] [get_bd_pins resize/Dout]
  connect_bd_net -net xib1_m1_1 [get_bd_ports xib1_m1] [get_bd_pins xib_times_lambda/A]
  connect_bd_net -net xif1_m1_1 [get_bd_ports xif1_m1] [get_bd_pins xif_times_lambda/A]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_update_xi()
cr_bd_update_xi ""
set_property REGISTERED_WITH_MANAGER "1" [get_files update_xi.bd ] 
set_property SYNTH_CHECKPOINT_MODE "Hierarchical" [get_files update_xi.bd ] 


# Create wrapper file for update_xi.bd
make_wrapper -files [get_files update_xi.bd] -import -top



# Proc to create BD update_kappa
proc cr_bd_update_kappa { parentCell } {
# The design that will be created by this Tcl proc contains the following 
# module references:
# delay, delay, mux, mux, normalize, normalize



  # CHANGE DESIGN NAME HERE
  set design_name update_kappa

  common::send_gid_msg -ssname BD::TCL -id 2010 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

  create_bd_design $design_name

  # Add USER_COMMENTS on $design_name
  set_property USER_COMMENTS.comment_0 "total delay: 3" [get_bd_designs $design_name]

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  xilinx.com:ip:dsp_macro:1.0\
  xilinx.com:ip:c_addsub:12.0\
  xilinx.com:ip:div_gen:5.1\
  xilinx.com:ip:xlslice:1.0\
  "

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

  }

  ##################################################################
  # CHECK Modules
  ##################################################################
  set bCheckModules 1
  if { $bCheckModules == 1 } {
     set list_check_mods "\ 
  delay\
  delay\
  mux\
  mux\
  normalize\
  normalize\
  "

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

  if { $bCheckIPsPassed != 1 } {
    common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
    return 3
  }

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set Kb1_m [ create_bd_port -dir I -from 17 -to 0 Kb1_m ]
  set Kb_m [ create_bd_port -dir O -from 17 -to 0 Kb_m ]
  set Kf1_m [ create_bd_port -dir I -from 17 -to 0 Kf1_m ]
  set Kf_m [ create_bd_port -dir O -from 17 -to 0 Kf_m ]
  set beta1_m [ create_bd_port -dir I -from 17 -to 0 beta1_m ]
  set beta_m1 [ create_bd_port -dir O -from 17 -to 0 beta_m1 ]
  set ck [ create_bd_port -dir I ck ]
  set eb_m1 [ create_bd_port -dir I -from 17 -to 0 eb_m1 ]
  set ef_m1 [ create_bd_port -dir I -from 17 -to 0 ef_m1 ]
  set geb_m1 [ create_bd_port -dir I -from 17 -to 0 geb_m1 ]
  set gef_m [ create_bd_port -dir I -from 17 -to 0 gef_m ]
  set sel [ create_bd_port -dir I sel ]
  set valid [ create_bd_port -dir I valid ]
  set xib_m1 [ create_bd_port -dir I -from 17 -to 0 xib_m1 ]
  set xif_m [ create_bd_port -dir I -from 17 -to 0 xif_m ]

  # Create instance: betaef, and set properties
  set betaef [ create_bd_cell -type ip -vlnv xilinx.com:ip:dsp_macro:1.0 betaef ]
  set_property -dict [ list \
   CONFIG.areg_1 {false} \
   CONFIG.areg_2 {true} \
   CONFIG.areg_3 {true} \
   CONFIG.areg_4 {true} \
   CONFIG.breg_3 {false} \
   CONFIG.breg_4 {false} \
   CONFIG.creg_3 {false} \
   CONFIG.creg_4 {false} \
   CONFIG.creg_5 {false} \
   CONFIG.instruction1 {A*B} \
   CONFIG.mreg_5 {true} \
   CONFIG.output_properties {Full_Precision} \
   CONFIG.p_binarywidth {0} \
   CONFIG.p_full_width {36} \
   CONFIG.p_width {36} \
   CONFIG.pipeline_options {Expert} \
   CONFIG.preg_6 {false} \
 ] $betaef

  # Create instance: c_addsub_0, and set properties
  set c_addsub_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_0 ]
  set_property -dict [ list \
   CONFIG.A_Width {18} \
   CONFIG.B_Value {000000000000000000} \
   CONFIG.B_Width {18} \
   CONFIG.CE {false} \
   CONFIG.Latency {0} \
   CONFIG.Out_Width {18} \
 ] $c_addsub_0

  # Create instance: c_addsub_1, and set properties
  set c_addsub_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_1 ]
  set_property -dict [ list \
   CONFIG.A_Width {18} \
   CONFIG.B_Value {000000000000000000} \
   CONFIG.B_Width {18} \
   CONFIG.CE {false} \
   CONFIG.Latency {0} \
   CONFIG.Out_Width {18} \
 ] $c_addsub_1

  # Create instance: delay_0, and set properties
  set block_name delay
  set block_cell_name delay_0
  if { [catch {set delay_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $delay_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.delay_len {5} \
 ] $delay_0

  # Create instance: delay_1, and set properties
  set block_name delay
  set block_cell_name delay_1
  if { [catch {set delay_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $delay_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.delay_len {4} \
 ] $delay_1

  # Create instance: gef_over_xif_or_beta_m1, and set properties
  set gef_over_xif_or_beta_m1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:div_gen:5.1 gef_over_xif_or_beta_m1 ]
  set_property -dict [ list \
   CONFIG.algorithm_type {High_Radix} \
   CONFIG.dividend_and_quotient_width {18} \
   CONFIG.divisor_width {18} \
   CONFIG.fractional_width {15} \
   CONFIG.latency {4} \
   CONFIG.latency_configuration {Manual} \
   CONFIG.remainder_type {Fractional} \
 ] $gef_over_xif_or_beta_m1

  # Create instance: gefxifeb, and set properties
  set gefxifeb [ create_bd_cell -type ip -vlnv xilinx.com:ip:dsp_macro:1.0 gefxifeb ]
  set_property -dict [ list \
   CONFIG.areg_1 {false} \
   CONFIG.areg_2 {true} \
   CONFIG.areg_3 {true} \
   CONFIG.areg_4 {true} \
   CONFIG.breg_3 {false} \
   CONFIG.breg_4 {false} \
   CONFIG.creg_3 {false} \
   CONFIG.creg_4 {false} \
   CONFIG.creg_5 {false} \
   CONFIG.instruction1 {A*B} \
   CONFIG.mreg_5 {true} \
   CONFIG.output_properties {Full_Precision} \
   CONFIG.p_binarywidth {0} \
   CONFIG.p_full_width {36} \
   CONFIG.p_width {36} \
   CONFIG.pipeline_options {Expert} \
   CONFIG.preg_6 {false} \
 ] $gefxifeb

  # Create instance: mux_0, and set properties
  set block_name mux
  set block_cell_name mux_0
  if { [catch {set mux_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $mux_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: mux_1, and set properties
  set block_name mux
  set block_cell_name mux_1
  if { [catch {set mux_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $mux_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: normalize_0, and set properties
  set block_name normalize
  set block_cell_name normalize_0
  if { [catch {set normalize_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $normalize_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: normalize_1, and set properties
  set block_name normalize
  set block_cell_name normalize_1
  if { [catch {set normalize_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $normalize_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {17} \
   CONFIG.DIN_WIDTH {40} \
   CONFIG.DOUT_WIDTH {18} \
 ] $xlslice_0

  # Create port connections
  connect_bd_net -net Kb1_m_1 [get_bd_ports Kb1_m] [get_bd_pins delay_0/i_data]
  connect_bd_net -net Kf1_m_1 [get_bd_ports Kf1_m] [get_bd_pins delay_1/i_data]
  connect_bd_net -net beta1_m_1 [get_bd_ports beta1_m] [get_bd_pins betaef/B]
  connect_bd_net -net betaef_P [get_bd_pins betaef/P] [get_bd_pins normalize_1/i_data]
  connect_bd_net -net c_addsub_0_S [get_bd_ports Kb_m] [get_bd_pins c_addsub_0/S]
  connect_bd_net -net c_addsub_1_S [get_bd_ports Kf_m] [get_bd_pins c_addsub_1/S]
  connect_bd_net -net ck_1 [get_bd_ports ck] [get_bd_pins betaef/CLK] [get_bd_pins delay_0/i_ck] [get_bd_pins delay_1/i_ck] [get_bd_pins gef_over_xif_or_beta_m1/aclk] [get_bd_pins gefxifeb/CLK]
  connect_bd_net -net delay_0_o_data [get_bd_pins c_addsub_0/B] [get_bd_pins delay_0/o_data]
  connect_bd_net -net delay_1_o_data [get_bd_pins c_addsub_1/B] [get_bd_pins delay_1/o_data]
  connect_bd_net -net eb_m1_1 [get_bd_ports eb_m1] [get_bd_pins gefxifeb/A]
  connect_bd_net -net ef_m1_1 [get_bd_ports ef_m1] [get_bd_pins betaef/A]
  connect_bd_net -net geb_m1_1 [get_bd_ports geb_m1] [get_bd_pins mux_1/d1]
  connect_bd_net -net gef_m_1 [get_bd_ports gef_m] [get_bd_pins mux_1/d0]
  connect_bd_net -net gef_over_xif_or_beta_m1_m_axis_dout_tdata [get_bd_pins gef_over_xif_or_beta_m1/m_axis_dout_tdata] [get_bd_pins xlslice_0/Din]
  connect_bd_net -net gefxifeb_P [get_bd_pins gefxifeb/P] [get_bd_pins normalize_0/i_data]
  connect_bd_net -net mux_0_s [get_bd_pins gef_over_xif_or_beta_m1/s_axis_divisor_tdata] [get_bd_pins mux_0/s]
  connect_bd_net -net mux_1_s [get_bd_pins gef_over_xif_or_beta_m1/s_axis_dividend_tdata] [get_bd_pins mux_1/s]
  connect_bd_net -net normalize_0_o_data [get_bd_pins c_addsub_0/A] [get_bd_pins normalize_0/o_data]
  connect_bd_net -net normalize_1_o_data [get_bd_pins c_addsub_1/A] [get_bd_pins normalize_1/o_data]
  connect_bd_net -net sel_1 [get_bd_ports sel] [get_bd_pins mux_0/sel] [get_bd_pins mux_1/sel]
  connect_bd_net -net valid_1 [get_bd_ports valid] [get_bd_pins gef_over_xif_or_beta_m1/s_axis_dividend_tvalid] [get_bd_pins gef_over_xif_or_beta_m1/s_axis_divisor_tvalid]
  connect_bd_net -net xib_m1_1 [get_bd_ports xib_m1] [get_bd_pins mux_0/d1]
  connect_bd_net -net xif_m_1 [get_bd_ports xif_m] [get_bd_pins mux_0/d0]
  connect_bd_net -net xlslice_0_Dout1 [get_bd_ports beta_m1] [get_bd_pins gefxifeb/B] [get_bd_pins xlslice_0/Dout]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_update_kappa()
cr_bd_update_kappa ""
set_property REGISTERED_WITH_MANAGER "1" [get_files update_kappa.bd ] 
set_property SYNTH_CHECKPOINT_MODE "Hierarchical" [get_files update_kappa.bd ] 


# Create wrapper file for update_kappa.bd
make_wrapper -files [get_files update_kappa.bd] -import -top



# Proc to create BD update_gamma
proc cr_bd_update_gamma { parentCell } {
# The design that will be created by this Tcl proc contains the following 
# module references:
# normalize



  # CHANGE DESIGN NAME HERE
  set design_name update_gamma

  common::send_gid_msg -ssname BD::TCL -id 2010 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

  create_bd_design $design_name

  # Add USER_COMMENTS on $design_name
  set_property USER_COMMENTS.comment_0 "total delay: 4 samples for gam_m1
3 samples for beta_m
(chib must have a 2 sample delay wrt other inputs)" [get_bd_designs $design_name]

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  xilinx.com:ip:c_addsub:12.0\
  xilinx.com:ip:dsp_macro:1.0\
  "

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

  }

  ##################################################################
  # CHECK Modules
  ##################################################################
  set bCheckModules 1
  if { $bCheckModules == 1 } {
     set list_check_mods "\ 
  normalize\
  "

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

  if { $bCheckIPsPassed != 1 } {
    common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
    return 3
  }

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set beta_m [ create_bd_port -dir I -from 17 -to 0 beta_m ]
  set ck [ create_bd_port -dir I ck ]
  set gam_m [ create_bd_port -dir I -from 17 -to 0 gam_m ]
  set gam_m1 [ create_bd_port -dir O -from 17 -to 0 gam_m1 ]
  set geb_m [ create_bd_port -dir I -from 17 -to 0 geb_m ]

  # Create instance: c_addsub_0, and set properties
  set c_addsub_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 c_addsub_0 ]
  set_property -dict [ list \
   CONFIG.A_Width {18} \
   CONFIG.Add_Mode {Subtract} \
   CONFIG.B_Value {000000000000000000} \
   CONFIG.B_Width {18} \
   CONFIG.CE {false} \
   CONFIG.Latency {0} \
   CONFIG.Out_Width {18} \
 ] $c_addsub_0

  # Create instance: gam_minus_betageb, and set properties
  set gam_minus_betageb [ create_bd_cell -type ip -vlnv xilinx.com:ip:dsp_macro:1.0 gam_minus_betageb ]
  set_property -dict [ list \
   CONFIG.a_binarywidth {0} \
   CONFIG.a_width {18} \
   CONFIG.areg_3 {false} \
   CONFIG.areg_4 {false} \
   CONFIG.b_binarywidth {0} \
   CONFIG.b_width {18} \
   CONFIG.breg_3 {false} \
   CONFIG.breg_4 {false} \
   CONFIG.c_binarywidth {0} \
   CONFIG.c_width {48} \
   CONFIG.concat_binarywidth {0} \
   CONFIG.concat_width {48} \
   CONFIG.creg_1 {false} \
   CONFIG.creg_2 {false} \
   CONFIG.creg_3 {false} \
   CONFIG.creg_4 {false} \
   CONFIG.creg_5 {false} \
   CONFIG.d_width {18} \
   CONFIG.instruction1 {A*B} \
   CONFIG.mreg_5 {true} \
   CONFIG.output_properties {Full_Precision} \
   CONFIG.p_binarywidth {0} \
   CONFIG.p_full_width {36} \
   CONFIG.p_width {36} \
   CONFIG.pcin_binarywidth {0} \
   CONFIG.pipeline_options {Expert} \
   CONFIG.preg_6 {false} \
   CONFIG.tier_4 {false} \
   CONFIG.tier_5 {false} \
   CONFIG.tier_6 {false} \
   CONFIG.use_dsp48 {true} \
 ] $gam_minus_betageb

  # Create instance: normalize_0, and set properties
  set block_name normalize
  set block_cell_name normalize_0
  if { [catch {set normalize_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $normalize_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net beta_m_1 [get_bd_ports beta_m] [get_bd_pins gam_minus_betageb/A]
  connect_bd_net -net c_addsub_0_S [get_bd_ports gam_m1] [get_bd_pins c_addsub_0/S]
  connect_bd_net -net ck_1 [get_bd_ports ck] [get_bd_pins gam_minus_betageb/CLK]
  connect_bd_net -net gam_m_1 [get_bd_ports gam_m] [get_bd_pins c_addsub_0/A]
  connect_bd_net -net gam_minus_betageb_P [get_bd_pins gam_minus_betageb/P] [get_bd_pins normalize_0/i_data]
  connect_bd_net -net geb_m_1 [get_bd_ports geb_m] [get_bd_pins gam_minus_betageb/B]
  connect_bd_net -net normalize_0_o_data [get_bd_pins c_addsub_0/B] [get_bd_pins normalize_0/o_data]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_update_gamma()
cr_bd_update_gamma ""
set_property REGISTERED_WITH_MANAGER "1" [get_files update_gamma.bd ] 
set_property SYNTH_CHECKPOINT_MODE "Hierarchical" [get_files update_gamma.bd ] 


# Create wrapper file for update_gamma.bd
make_wrapper -files [get_files update_gamma.bd] -import -top



# Proc to create BD update_feedforward
proc cr_bd_update_feedforward { parentCell } {
# The design that will be created by this Tcl proc contains the following 
# module references:
# c_port_resizer, c_port_resizer, delay, delay, delay, normalize, postmul_resizer_wideinput, postmul_resizer_wideinput, postmul_resizer_wideinput



  # CHANGE DESIGN NAME HERE
  set design_name update_feedforward

  common::send_gid_msg -ssname BD::TCL -id 2010 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

  create_bd_design $design_name

  # Add USER_COMMENTS on $design_name
  set_property USER_COMMENTS.comment_0 "total delay: 3 samples" [get_bd_designs $design_name]

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  xilinx.com:ip:dsp_macro:1.0\
  xilinx.com:ip:c_addsub:12.0\
  "

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

  }

  ##################################################################
  # CHECK Modules
  ##################################################################
  set bCheckModules 1
  if { $bCheckModules == 1 } {
     set list_check_mods "\ 
  c_port_resizer\
  c_port_resizer\
  delay\
  delay\
  delay\
  normalize\
  postmul_resizer_wideinput\
  postmul_resizer_wideinput\
  postmul_resizer_wideinput\
  "

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

  if { $bCheckIPsPassed != 1 } {
    common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
    return 3
  }

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set beta_m [ create_bd_port -dir I -from 17 -to 0 beta_m ]
  set ck [ create_bd_port -dir I ck ]
  set e_m [ create_bd_port -dir I -from 17 -to 0 e_m ]
  set e_m1 [ create_bd_port -dir O -from 17 -to 0 e_m1 ]
  set eb_m [ create_bd_port -dir I -from 17 -to 0 eb_m ]
  set v1_m [ create_bd_port -dir I -from 17 -to 0 v1_m ]
  set v_m [ create_bd_port -dir O -from 17 -to 0 v_m ]
  set ys_m [ create_bd_port -dir I -from 17 -to 0 ys_m ]
  set ys_m1 [ create_bd_port -dir O -from 17 -to 0 ys_m1 ]

  # Create instance: betae, and set properties
  set betae [ create_bd_cell -type ip -vlnv xilinx.com:ip:dsp_macro:1.0 betae ]
  set_property -dict [ list \
   CONFIG.a_binarywidth {0} \
   CONFIG.a_width {18} \
   CONFIG.areg_3 {true} \
   CONFIG.areg_4 {true} \
   CONFIG.b_binarywidth {18} \
   CONFIG.b_width {18} \
   CONFIG.breg_3 {false} \
   CONFIG.breg_4 {false} \
   CONFIG.c_binarywidth {18} \
   CONFIG.c_width {48} \
   CONFIG.concat_binarywidth {18} \
   CONFIG.concat_width {48} \
   CONFIG.creg_1 {false} \
   CONFIG.creg_2 {false} \
   CONFIG.creg_3 {false} \
   CONFIG.creg_4 {false} \
   CONFIG.creg_5 {false} \
   CONFIG.d_width {18} \
   CONFIG.instruction1 {A*B} \
   CONFIG.instruction2 {#} \
   CONFIG.mreg_5 {true} \
   CONFIG.output_properties {Full_Precision} \
   CONFIG.p_binarywidth {18} \
   CONFIG.p_full_width {36} \
   CONFIG.p_width {36} \
   CONFIG.pcin_binarywidth {18} \
   CONFIG.pipeline_options {Expert} \
   CONFIG.preg_6 {false} \
 ] $betae

  # Create instance: c_port_resizer_0, and set properties
  set block_name c_port_resizer
  set block_cell_name c_port_resizer_0
  if { [catch {set c_port_resizer_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $c_port_resizer_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: c_port_resizer_2, and set properties
  set block_name c_port_resizer
  set block_cell_name c_port_resizer_2
  if { [catch {set c_port_resizer_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $c_port_resizer_2 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: delay_22, and set properties
  set block_name delay
  set block_cell_name delay_22
  if { [catch {set delay_22 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $delay_22 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.delay_len {1} \
 ] $delay_22

  # Create instance: delay_24, and set properties
  set block_name delay
  set block_cell_name delay_24
  if { [catch {set delay_24 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $delay_24 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.delay_len {1} \
 ] $delay_24

  # Create instance: delay_25, and set properties
  set block_name delay
  set block_cell_name delay_25
  if { [catch {set delay_25 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $delay_25 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.delay_len {1} \
 ] $delay_25

  # Create instance: e_minus_veb, and set properties
  set e_minus_veb [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 e_minus_veb ]
  set_property -dict [ list \
   CONFIG.A_Width {36} \
   CONFIG.Add_Mode {Subtract} \
   CONFIG.B_Value {000000000000000000000000000000000000} \
   CONFIG.B_Width {36} \
   CONFIG.CE {false} \
   CONFIG.Latency {1} \
   CONFIG.Out_Width {37} \
 ] $e_minus_veb

  # Create instance: normalize_0, and set properties
  set block_name normalize
  set block_cell_name normalize_0
  if { [catch {set normalize_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $normalize_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: postmul_resizer_wide_0, and set properties
  set block_name postmul_resizer_wideinput
  set block_cell_name postmul_resizer_wide_0
  if { [catch {set postmul_resizer_wide_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $postmul_resizer_wide_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: postmul_resizer_wide_2, and set properties
  set block_name postmul_resizer_wideinput
  set block_cell_name postmul_resizer_wide_2
  if { [catch {set postmul_resizer_wide_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $postmul_resizer_wide_2 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: postmul_resizer_wide_3, and set properties
  set block_name postmul_resizer_wideinput
  set block_cell_name postmul_resizer_wide_3
  if { [catch {set postmul_resizer_wide_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $postmul_resizer_wide_3 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: v1_plus_betae, and set properties
  set v1_plus_betae [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 v1_plus_betae ]
  set_property -dict [ list \
   CONFIG.A_Width {18} \
   CONFIG.Add_Mode {Subtract} \
   CONFIG.B_Value {000000000000000000} \
   CONFIG.B_Width {18} \
   CONFIG.CE {false} \
   CONFIG.Latency {0} \
   CONFIG.Out_Width {18} \
 ] $v1_plus_betae

  # Create instance: veb, and set properties
  set veb [ create_bd_cell -type ip -vlnv xilinx.com:ip:dsp_macro:1.0 veb ]
  set_property -dict [ list \
   CONFIG.a_binarywidth {0} \
   CONFIG.a_width {18} \
   CONFIG.areg_3 {false} \
   CONFIG.areg_4 {false} \
   CONFIG.b_binarywidth {0} \
   CONFIG.b_width {18} \
   CONFIG.breg_3 {false} \
   CONFIG.breg_4 {false} \
   CONFIG.c_binarywidth {0} \
   CONFIG.c_width {48} \
   CONFIG.concat_binarywidth {0} \
   CONFIG.concat_width {48} \
   CONFIG.creg_3 {false} \
   CONFIG.creg_4 {false} \
   CONFIG.creg_5 {false} \
   CONFIG.d_width {18} \
   CONFIG.instruction1 {A*B} \
   CONFIG.instruction2 {#} \
   CONFIG.mreg_5 {true} \
   CONFIG.output_properties {Full_Precision} \
   CONFIG.p_binarywidth {0} \
   CONFIG.p_full_width {36} \
   CONFIG.p_width {36} \
   CONFIG.pcin_binarywidth {0} \
   CONFIG.pipeline_options {Expert} \
   CONFIG.preg_6 {false} \
 ] $veb

  # Create instance: ys_plus_veb, and set properties
  set ys_plus_veb [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 ys_plus_veb ]
  set_property -dict [ list \
   CONFIG.A_Width {36} \
   CONFIG.B_Value {000000000000000000000000000000000000} \
   CONFIG.B_Width {36} \
   CONFIG.CE {false} \
   CONFIG.Latency {2} \
   CONFIG.Out_Width {37} \
 ] $ys_plus_veb

  # Create port connections
  connect_bd_net -net beta_m_1 [get_bd_ports beta_m] [get_bd_pins betae/A]
  connect_bd_net -net betae_P [get_bd_pins betae/P] [get_bd_pins normalize_0/i_data]
  connect_bd_net -net c_port_resizer_0_o_data [get_bd_pins c_port_resizer_0/o_data] [get_bd_pins e_minus_veb/A]
  connect_bd_net -net c_port_resizer_2_o_data [get_bd_pins c_port_resizer_2/o_data] [get_bd_pins ys_plus_veb/B]
  connect_bd_net -net ck_1 [get_bd_ports ck] [get_bd_pins betae/CLK] [get_bd_pins delay_22/i_ck] [get_bd_pins delay_24/i_ck] [get_bd_pins delay_25/i_ck] [get_bd_pins e_minus_veb/CLK] [get_bd_pins veb/CLK] [get_bd_pins ys_plus_veb/CLK]
  connect_bd_net -net delay_22_o_data [get_bd_pins c_port_resizer_0/i_data] [get_bd_pins delay_22/o_data]
  connect_bd_net -net delay_24_o_data [get_bd_pins c_port_resizer_2/i_data] [get_bd_pins delay_24/o_data]
  connect_bd_net -net delay_25_o_data [get_bd_ports e_m1] [get_bd_pins delay_25/o_data]
  connect_bd_net -net e_m_1 [get_bd_ports e_m] [get_bd_pins delay_22/i_data]
  connect_bd_net -net e_minus_veb_S [get_bd_pins e_minus_veb/S] [get_bd_pins postmul_resizer_wide_0/i_data] [get_bd_pins postmul_resizer_wide_3/i_data]
  connect_bd_net -net eb_m_2 [get_bd_ports eb_m] [get_bd_pins veb/B]
  connect_bd_net -net normalize_0_o_data [get_bd_pins normalize_0/o_data] [get_bd_pins v1_plus_betae/B]
  connect_bd_net -net postmul_resizer_wide_0_o_data [get_bd_pins betae/B] [get_bd_pins postmul_resizer_wide_0/o_data]
  connect_bd_net -net postmul_resizer_wide_2_o_data [get_bd_ports ys_m1] [get_bd_pins postmul_resizer_wide_2/o_data]
  connect_bd_net -net postmul_resizer_wide_3_o_data [get_bd_pins delay_25/i_data] [get_bd_pins postmul_resizer_wide_3/o_data]
  connect_bd_net -net v1_m_1 [get_bd_ports v1_m] [get_bd_pins v1_plus_betae/A] [get_bd_pins veb/A]
  connect_bd_net -net veb_P [get_bd_pins e_minus_veb/B] [get_bd_pins veb/P] [get_bd_pins ys_plus_veb/A]
  connect_bd_net -net xif_m1_S [get_bd_ports v_m] [get_bd_pins v1_plus_betae/S]
  connect_bd_net -net ys_m_1 [get_bd_ports ys_m] [get_bd_pins delay_24/i_data]
  connect_bd_net -net ys_plus_veb_S [get_bd_pins postmul_resizer_wide_2/i_data] [get_bd_pins ys_plus_veb/S]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_update_feedforward()
cr_bd_update_feedforward ""
set_property REGISTERED_WITH_MANAGER "1" [get_files update_feedforward.bd ] 
set_property SYNTH_CHECKPOINT_MODE "Hierarchical" [get_files update_feedforward.bd ] 


# Create wrapper file for update_feedforward.bd
make_wrapper -files [get_files update_feedforward.bd] -import -top



# Proc to create BD update_epsilon
proc cr_bd_update_epsilon { parentCell } {
# The design that will be created by this Tcl proc contains the following 
# module references:
# c_port_resizer, c_port_resizer, postmul_resizer_wideinput, postmul_resizer_wideinput



  # CHANGE DESIGN NAME HERE
  set design_name update_epsilon

  common::send_gid_msg -ssname BD::TCL -id 2010 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

  create_bd_design $design_name

  # Add USER_COMMENTS on $design_name
  set_property USER_COMMENTS.comment_0 "total delay: 1 samples" [get_bd_designs $design_name]

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  xilinx.com:ip:dsp_macro:1.0\
  "

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

  }

  ##################################################################
  # CHECK Modules
  ##################################################################
  set bCheckModules 1
  if { $bCheckModules == 1 } {
     set list_check_mods "\ 
  c_port_resizer\
  c_port_resizer\
  postmul_resizer_wideinput\
  postmul_resizer_wideinput\
  "

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

  if { $bCheckIPsPassed != 1 } {
    common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
    return 3
  }

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set Kb1_m [ create_bd_port -dir I -from 17 -to 0 Kb1_m ]
  set Kf1_m [ create_bd_port -dir I -from 17 -to 0 Kf1_m ]
  set ck [ create_bd_port -dir I ck ]
  set eb1_m [ create_bd_port -dir I -from 17 -to 0 eb1_m ]
  set eb_m1 [ create_bd_port -dir O -from 17 -to 0 eb_m1 ]
  set ef_m [ create_bd_port -dir I -from 17 -to 0 ef_m ]
  set ef_m1 [ create_bd_port -dir O -from 17 -to 0 ef_m1 ]

  # Create instance: c_port_resizer_0, and set properties
  set block_name c_port_resizer
  set block_cell_name c_port_resizer_0
  if { [catch {set c_port_resizer_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $c_port_resizer_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: c_port_resizer_1, and set properties
  set block_name c_port_resizer
  set block_cell_name c_port_resizer_1
  if { [catch {set c_port_resizer_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $c_port_resizer_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: kbef, and set properties
  set kbef [ create_bd_cell -type ip -vlnv xilinx.com:ip:dsp_macro:1.0 kbef ]
  set_property -dict [ list \
   CONFIG.a_binarywidth {0} \
   CONFIG.a_width {18} \
   CONFIG.areg_3 {false} \
   CONFIG.areg_4 {false} \
   CONFIG.b_binarywidth {0} \
   CONFIG.b_width {18} \
   CONFIG.breg_3 {false} \
   CONFIG.breg_4 {false} \
   CONFIG.c_binarywidth {0} \
   CONFIG.c_width {36} \
   CONFIG.concat_binarywidth {0} \
   CONFIG.concat_width {48} \
   CONFIG.creg_3 {false} \
   CONFIG.creg_4 {false} \
   CONFIG.creg_5 {true} \
   CONFIG.d_width {18} \
   CONFIG.instruction1 {C-(A*B)} \
   CONFIG.instruction2 {#} \
   CONFIG.instruction3 {#} \
   CONFIG.instruction4 {#} \
   CONFIG.instruction5 {#} \
   CONFIG.instruction6 {#} \
   CONFIG.instruction7 {#} \
   CONFIG.instruction8 {#} \
   CONFIG.mreg_5 {true} \
   CONFIG.output_properties {Full_Precision} \
   CONFIG.p_binarywidth {0} \
   CONFIG.p_full_width {37} \
   CONFIG.p_width {37} \
   CONFIG.pcin_binarywidth {0} \
   CONFIG.pipeline_options {Expert} \
   CONFIG.preg_6 {false} \
   CONFIG.show_filtered {false} \
 ] $kbef

  # Create instance: kfeb, and set properties
  set kfeb [ create_bd_cell -type ip -vlnv xilinx.com:ip:dsp_macro:1.0 kfeb ]
  set_property -dict [ list \
   CONFIG.areg_3 {false} \
   CONFIG.areg_4 {false} \
   CONFIG.breg_3 {false} \
   CONFIG.breg_4 {false} \
   CONFIG.c_binarywidth {0} \
   CONFIG.c_width {36} \
   CONFIG.creg_3 {false} \
   CONFIG.creg_4 {false} \
   CONFIG.creg_5 {true} \
   CONFIG.instruction1 {C-A*B} \
   CONFIG.mreg_5 {true} \
   CONFIG.output_properties {Full_Precision} \
   CONFIG.p_binarywidth {0} \
   CONFIG.p_full_width {37} \
   CONFIG.p_width {37} \
   CONFIG.pipeline_options {Expert} \
   CONFIG.preg_6 {false} \
 ] $kfeb

  # Create instance: postmul_resizer_wide_0, and set properties
  set block_name postmul_resizer_wideinput
  set block_cell_name postmul_resizer_wide_0
  if { [catch {set postmul_resizer_wide_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $postmul_resizer_wide_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: postmul_resizer_wide_1, and set properties
  set block_name postmul_resizer_wideinput
  set block_cell_name postmul_resizer_wide_1
  if { [catch {set postmul_resizer_wide_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $postmul_resizer_wide_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net Kb1_m_1 [get_bd_ports Kb1_m] [get_bd_pins kbef/A]
  connect_bd_net -net Kf1_m_1 [get_bd_ports Kf1_m] [get_bd_pins kfeb/A]
  connect_bd_net -net Net [get_bd_ports ck] [get_bd_pins kbef/CLK] [get_bd_pins kfeb/CLK]
  connect_bd_net -net c_port_resizer_0_o_data [get_bd_pins c_port_resizer_0/o_data] [get_bd_pins kbef/C]
  connect_bd_net -net c_port_resizer_1_o_data [get_bd_pins c_port_resizer_1/o_data] [get_bd_pins kfeb/C]
  connect_bd_net -net eb1_m_1 [get_bd_ports eb1_m] [get_bd_pins c_port_resizer_0/i_data] [get_bd_pins kfeb/B]
  connect_bd_net -net ef_m_1 [get_bd_ports ef_m] [get_bd_pins c_port_resizer_1/i_data] [get_bd_pins kbef/B]
  connect_bd_net -net kbef_P [get_bd_pins kbef/P] [get_bd_pins postmul_resizer_wide_1/i_data]
  connect_bd_net -net kfeb_P [get_bd_pins kfeb/P] [get_bd_pins postmul_resizer_wide_0/i_data]
  connect_bd_net -net postmul_resizer_wide_0_o_data [get_bd_ports ef_m1] [get_bd_pins postmul_resizer_wide_0/o_data]
  connect_bd_net -net postmul_resizer_wide_1_o_data [get_bd_ports eb_m1] [get_bd_pins postmul_resizer_wide_1/o_data]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_update_epsilon()
cr_bd_update_epsilon ""
set_property REGISTERED_WITH_MANAGER "1" [get_files update_epsilon.bd ] 
set_property SYNTH_CHECKPOINT_MODE "Hierarchical" [get_files update_epsilon.bd ] 


# Create wrapper file for update_epsilon.bd
make_wrapper -files [get_files update_epsilon.bd] -import -top



# Proc to create BD geb_gef_update
proc cr_bd_geb_gef_update { parentCell } {
# The design that will be created by this Tcl proc contains the following 
# module references:
# postmul_resizer, postmul_resizer



  # CHANGE DESIGN NAME HERE
  set design_name geb_gef_update

  common::send_gid_msg -ssname BD::TCL -id 2010 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

  create_bd_design $design_name

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  xilinx.com:ip:dsp_macro:1.0\
  "

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

  }

  ##################################################################
  # CHECK Modules
  ##################################################################
  set bCheckModules 1
  if { $bCheckModules == 1 } {
     set list_check_mods "\ 
  postmul_resizer\
  postmul_resizer\
  "

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

  if { $bCheckIPsPassed != 1 } {
    common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
    return 3
  }

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set ck [ create_bd_port -dir I ck ]
  set eb_m1 [ create_bd_port -dir I -from 17 -to 0 eb_m1 ]
  set ef_m1 [ create_bd_port -dir I -from 17 -to 0 ef_m1 ]
  set gam1_m1 [ create_bd_port -dir I -from 17 -to 0 gam1_m1 ]
  set gam_m1 [ create_bd_port -dir I -from 17 -to 0 gam_m1 ]
  set geb_m1 [ create_bd_port -dir O -from 17 -to 0 geb_m1 ]
  set gef_m1 [ create_bd_port -dir O -from 17 -to 0 gef_m1 ]

  # Create instance: dsp_macro_0, and set properties
  set dsp_macro_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:dsp_macro:1.0 dsp_macro_0 ]
  set_property -dict [ list \
   CONFIG.areg_3 {false} \
   CONFIG.areg_4 {false} \
   CONFIG.breg_3 {false} \
   CONFIG.breg_4 {false} \
   CONFIG.creg_3 {false} \
   CONFIG.creg_4 {false} \
   CONFIG.creg_5 {false} \
   CONFIG.instruction1 {A*B} \
   CONFIG.mreg_5 {true} \
   CONFIG.p_binarywidth {0} \
   CONFIG.p_full_width {36} \
   CONFIG.p_width {36} \
   CONFIG.pipeline_options {By_Tier} \
   CONFIG.preg_6 {false} \
   CONFIG.tier_5 {true} \
 ] $dsp_macro_0

  # Create instance: dsp_macro_1, and set properties
  set dsp_macro_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:dsp_macro:1.0 dsp_macro_1 ]
  set_property -dict [ list \
   CONFIG.areg_3 {false} \
   CONFIG.areg_4 {false} \
   CONFIG.breg_3 {false} \
   CONFIG.breg_4 {false} \
   CONFIG.creg_3 {false} \
   CONFIG.creg_4 {false} \
   CONFIG.creg_5 {false} \
   CONFIG.instruction1 {A*B} \
   CONFIG.mreg_5 {true} \
   CONFIG.p_binarywidth {0} \
   CONFIG.p_full_width {36} \
   CONFIG.p_width {36} \
   CONFIG.pipeline_options {By_Tier} \
   CONFIG.preg_6 {false} \
   CONFIG.tier_5 {true} \
 ] $dsp_macro_1

  # Create instance: postmul_resizer_0, and set properties
  set block_name postmul_resizer
  set block_cell_name postmul_resizer_0
  if { [catch {set postmul_resizer_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $postmul_resizer_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: postmul_resizer_1, and set properties
  set block_name postmul_resizer
  set block_cell_name postmul_resizer_1
  if { [catch {set postmul_resizer_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $postmul_resizer_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net ck_1 [get_bd_ports ck] [get_bd_pins dsp_macro_0/CLK] [get_bd_pins dsp_macro_1/CLK]
  connect_bd_net -net dsp_macro_0_P [get_bd_pins dsp_macro_0/P] [get_bd_pins postmul_resizer_1/i_data]
  connect_bd_net -net dsp_macro_1_P [get_bd_pins dsp_macro_1/P] [get_bd_pins postmul_resizer_0/i_data]
  connect_bd_net -net eb_m1_1 [get_bd_ports eb_m1] [get_bd_pins dsp_macro_1/B]
  connect_bd_net -net ef_m1_1 [get_bd_ports ef_m1] [get_bd_pins dsp_macro_0/B]
  connect_bd_net -net gam1_m1_1 [get_bd_ports gam1_m1] [get_bd_pins dsp_macro_0/A]
  connect_bd_net -net gam_m1_1 [get_bd_ports gam_m1] [get_bd_pins dsp_macro_1/A]
  connect_bd_net -net postmul_resizer_0_o_data [get_bd_ports geb_m1] [get_bd_pins postmul_resizer_0/o_data]
  connect_bd_net -net postmul_resizer_1_o_data [get_bd_ports gef_m1] [get_bd_pins postmul_resizer_1/o_data]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_geb_gef_update()
cr_bd_geb_gef_update ""
set_property REGISTERED_WITH_MANAGER "1" [get_files geb_gef_update.bd ] 
set_property SYNTH_CHECKPOINT_MODE "Hierarchical" [get_files geb_gef_update.bd ] 


# Create wrapper file for geb_gef_update.bd
make_wrapper -files [get_files geb_gef_update.bd] -import -top



# Proc to create BD init_xi
proc cr_bd_init_xi { parentCell } {
# The design that will be created by this Tcl proc contains the following 
# module references:
# normalize



  # CHANGE DESIGN NAME HERE
  set design_name init_xi

  common::send_gid_msg -ssname BD::TCL -id 2010 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

  create_bd_design $design_name

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  xilinx.com:ip:dsp_macro:1.0\
  xilinx.com:ip:mult_gen:12.0\
  xilinx.com:ip:c_addsub:12.0\
  xilinx.com:ip:xlslice:1.0\
  "

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

  }

  ##################################################################
  # CHECK Modules
  ##################################################################
  set bCheckModules 1
  if { $bCheckModules == 1 } {
     set list_check_mods "\ 
  normalize\
  "

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

  if { $bCheckIPsPassed != 1 } {
    common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
    return 3
  }

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set ck [ create_bd_port -dir I ck ]
  set x [ create_bd_port -dir I -from 17 -to 0 x ]
  set xi1_1 [ create_bd_port -dir I -from 17 -to 0 xi1_1 ]
  set xi_init [ create_bd_port -dir O -from 17 -to 0 xi_init ]

  # Create instance: gefsq, and set properties
  set gefsq [ create_bd_cell -type ip -vlnv xilinx.com:ip:dsp_macro:1.0 gefsq ]
  set_property -dict [ list \
   CONFIG.areg_3 {false} \
   CONFIG.areg_4 {false} \
   CONFIG.breg_3 {false} \
   CONFIG.breg_4 {false} \
   CONFIG.creg_3 {false} \
   CONFIG.creg_4 {false} \
   CONFIG.creg_5 {false} \
   CONFIG.instruction1 {A*B} \
   CONFIG.mreg_5 {true} \
   CONFIG.p_binarywidth {0} \
   CONFIG.p_full_width {36} \
   CONFIG.p_width {36} \
   CONFIG.pipeline_options {Expert} \
   CONFIG.preg_6 {false} \
 ] $gefsq

  # Create instance: lambda, and set properties
  set lambda [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 lambda ]
  set_property -dict [ list \
   CONFIG.ConstValue {32704} \
   CONFIG.MultType {Constant_Coefficient_Multiplier} \
   CONFIG.OutputWidthHigh {32} \
   CONFIG.Use_Custom_Output_Width {false} \
 ] $lambda

  # Create instance: lambda_plus_normalized_x_squared, and set properties
  set lambda_plus_normalized_x_squared [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 lambda_plus_normalized_x_squared ]
  set_property -dict [ list \
   CONFIG.A_Width {18} \
   CONFIG.Add_Mode {Subtract} \
   CONFIG.B_Value {000000000000000000} \
   CONFIG.B_Width {18} \
   CONFIG.CE {false} \
   CONFIG.Latency {0} \
   CONFIG.Out_Width {18} \
 ] $lambda_plus_normalized_x_squared

  # Create instance: normalize_0, and set properties
  set block_name normalize
  set block_cell_name normalize_0
  if { [catch {set normalize_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $normalize_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {32} \
   CONFIG.DIN_TO {15} \
   CONFIG.DIN_WIDTH {33} \
   CONFIG.DOUT_WIDTH {18} \
 ] $xlslice_0

  # Create port connections
  connect_bd_net -net chi1_1_1 [get_bd_ports xi1_1] [get_bd_pins lambda/A]
  connect_bd_net -net ck_1 [get_bd_ports ck] [get_bd_pins gefsq/CLK] [get_bd_pins lambda/CLK]
  connect_bd_net -net gefsq_P [get_bd_pins gefsq/P] [get_bd_pins normalize_0/i_data]
  connect_bd_net -net lambda_P [get_bd_pins lambda/P] [get_bd_pins xlslice_0/Din]
  connect_bd_net -net lambda_plus_normalized_x_squared_S [get_bd_ports xi_init] [get_bd_pins lambda_plus_normalized_x_squared/S]
  connect_bd_net -net normalize_0_o_data [get_bd_pins lambda_plus_normalized_x_squared/A] [get_bd_pins normalize_0/o_data]
  connect_bd_net -net x_1 [get_bd_ports x] [get_bd_pins gefsq/A] [get_bd_pins gefsq/B]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins lambda_plus_normalized_x_squared/B] [get_bd_pins xlslice_0/Dout]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_init_xi()
cr_bd_init_xi ""
set_property REGISTERED_WITH_MANAGER "1" [get_files init_xi.bd ] 
set_property SYNTH_CHECKPOINT_MODE "Hierarchical" [get_files init_xi.bd ] 


# Create wrapper file for init_xi.bd
make_wrapper -files [get_files init_xi.bd] -import -top

set idrFlowPropertiesConstraints ""
catch {
 set idrFlowPropertiesConstraints [get_param runs.disableIDRFlowPropertyConstraints]
 set_param runs.disableIDRFlowPropertyConstraints 1
}

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
    create_run -name synth_1 -part xc7a35tcpg236-1 -flow {Vivado Synthesis 2022} -strategy "Vivado Synthesis Defaults" -report_strategy {No Reports} -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2022" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Synthesis Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'synth_1_synth_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0] "" ] } {
  create_report_config -report_name synth_1_synth_report_utilization_0 -report_type report_utilization:1.0 -steps synth_design -runs synth_1
}
set obj [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0]
if { $obj != "" } {

}
set obj [get_runs synth_1]
set_property -name "part" -value "xc7a35tcpg236-1" -objects $obj
set_property -name "auto_incremental_checkpoint" -value "1" -objects $obj
set_property -name "strategy" -value "Vivado Synthesis Defaults" -objects $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
    create_run -name impl_1 -part xc7a35tcpg236-1 -flow {Vivado Implementation 2022} -strategy "Vivado Implementation Defaults" -report_strategy {No Reports} -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2022" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Implementation Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'impl_1_init_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_init_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps init_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.report_unconstrained" -value "1" -objects $obj

}
# Create 'impl_1_opt_report_drc_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0] "" ] } {
  create_report_config -report_name impl_1_opt_report_drc_0 -report_type report_drc:1.0 -steps opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0]
if { $obj != "" } {

}
# Create 'impl_1_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.report_unconstrained" -value "1" -objects $obj

}
# Create 'impl_1_power_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps power_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.report_unconstrained" -value "1" -objects $obj

}
# Create 'impl_1_place_report_io_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0] "" ] } {
  create_report_config -report_name impl_1_place_report_io_0 -report_type report_io:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0]
if { $obj != "" } {

}
# Create 'impl_1_place_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0] "" ] } {
  create_report_config -report_name impl_1_place_report_utilization_0 -report_type report_utilization:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0]
if { $obj != "" } {

}
# Create 'impl_1_place_report_control_sets_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0] "" ] } {
  create_report_config -report_name impl_1_place_report_control_sets_0 -report_type report_control_sets:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0]
if { $obj != "" } {
set_property -name "options.verbose" -value "1" -objects $obj

}
# Create 'impl_1_place_report_incremental_reuse_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0] "" ] } {
  create_report_config -report_name impl_1_place_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj

}
# Create 'impl_1_place_report_incremental_reuse_1' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1] "" ] } {
  create_report_config -report_name impl_1_place_report_incremental_reuse_1 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj

}
# Create 'impl_1_place_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_place_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.report_unconstrained" -value "1" -objects $obj

}
# Create 'impl_1_post_place_power_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_post_place_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_place_power_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.report_unconstrained" -value "1" -objects $obj

}
# Create 'impl_1_phys_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.report_unconstrained" -value "1" -objects $obj

}
# Create 'impl_1_route_report_drc_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0] "" ] } {
  create_report_config -report_name impl_1_route_report_drc_0 -report_type report_drc:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_methodology_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0] "" ] } {
  create_report_config -report_name impl_1_route_report_methodology_0 -report_type report_methodology:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_power_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0] "" ] } {
  create_report_config -report_name impl_1_route_report_power_0 -report_type report_power:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_route_status_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0] "" ] } {
  create_report_config -report_name impl_1_route_report_route_status_0 -report_type report_route_status:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_route_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0]
if { $obj != "" } {
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.report_unconstrained" -value "1" -objects $obj

}
# Create 'impl_1_route_report_incremental_reuse_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0] "" ] } {
  create_report_config -report_name impl_1_route_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_clock_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0] "" ] } {
  create_report_config -report_name impl_1_route_report_clock_utilization_0 -report_type report_clock_utilization:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_bus_skew_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_bus_skew_0] "" ] } {
  create_report_config -report_name impl_1_route_report_bus_skew_0 -report_type report_bus_skew:1.1 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_bus_skew_0]
if { $obj != "" } {
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
# Create 'impl_1_post_route_phys_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_post_route_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_route_phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.report_unconstrained" -value "1" -objects $obj
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
# Create 'impl_1_post_route_phys_opt_report_bus_skew_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_bus_skew_0] "" ] } {
  create_report_config -report_name impl_1_post_route_phys_opt_report_bus_skew_0 -report_type report_bus_skew:1.1 -steps post_route_phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_bus_skew_0]
if { $obj != "" } {
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
set obj [get_runs impl_1]
set_property -name "part" -value "xc7a35tcpg236-1" -objects $obj
set_property -name "strategy" -value "Vivado Implementation Defaults" -objects $obj
set_property -name "steps.write_bitstream.args.readback_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.verbose" -value "0" -objects $obj

# set the current impl run
current_run -implementation [get_runs impl_1]
catch {
 if { $idrFlowPropertiesConstraints != {} } {
   set_param runs.disableIDRFlowPropertyConstraints $idrFlowPropertiesConstraints
 }
}

# Change current directory to project folder
cd [file dirname [info script]]

puts "INFO: Project created:${_xil_proj_name_}"
# Create 'drc_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "drc_1" ] ] ""]} {
create_dashboard_gadget -name {drc_1} -type drc
}
set obj [get_dashboard_gadgets [ list "drc_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_drc_0" -objects $obj

# Create 'methodology_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "methodology_1" ] ] ""]} {
create_dashboard_gadget -name {methodology_1} -type methodology
}
set obj [get_dashboard_gadgets [ list "methodology_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_methodology_0" -objects $obj

# Create 'power_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "power_1" ] ] ""]} {
create_dashboard_gadget -name {power_1} -type power
}
set obj [get_dashboard_gadgets [ list "power_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_power_0" -objects $obj

# Create 'timing_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "timing_1" ] ] ""]} {
create_dashboard_gadget -name {timing_1} -type timing
}
set obj [get_dashboard_gadgets [ list "timing_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_timing_summary_0" -objects $obj

# Create 'utilization_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "utilization_1" ] ] ""]} {
create_dashboard_gadget -name {utilization_1} -type utilization
}
set obj [get_dashboard_gadgets [ list "utilization_1" ] ]
set_property -name "reports" -value "synth_1#synth_1_synth_report_utilization_0" -objects $obj
set_property -name "run.step" -value "synth_design" -objects $obj
set_property -name "run.type" -value "synthesis" -objects $obj

# Create 'utilization_2' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "utilization_2" ] ] ""]} {
create_dashboard_gadget -name {utilization_2} -type utilization
}
set obj [get_dashboard_gadgets [ list "utilization_2" ] ]
set_property -name "reports" -value "impl_1#impl_1_place_report_utilization_0" -objects $obj

move_dashboard_gadget -name {utilization_1} -row 0 -col 0
move_dashboard_gadget -name {power_1} -row 1 -col 0
move_dashboard_gadget -name {drc_1} -row 2 -col 0
move_dashboard_gadget -name {timing_1} -row 0 -col 1
move_dashboard_gadget -name {utilization_2} -row 1 -col 1
move_dashboard_gadget -name {methodology_1} -row 2 -col 1
