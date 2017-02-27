
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name rhythmMaster -dir "E:/Courses/FPGA/LabEEfin/rhythmMaster/planAhead_run_5" -part xc3s100ecp132-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "freDiv.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {freDiv.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {beepDri.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top beepDri $srcset
add_files [list {freDiv.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s100ecp132-5
