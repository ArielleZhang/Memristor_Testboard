vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/xil_defaultlib
vlib riviera/microblaze_v11_0_2
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/lib_pkg_v1_0_2
vlib riviera/lib_srl_fifo_v1_0_2
vlib riviera/lib_cdc_v1_0_2
vlib riviera/axi_uartlite_v2_0_24
vlib riviera/interrupt_control_v3_1_4
vlib riviera/axi_gpio_v2_0_22
vlib riviera/axi_bram_ctrl_v4_1_2
vlib riviera/lmb_v10_v3_0_10
vlib riviera/lmb_bram_if_cntlr_v4_0_17
vlib riviera/blk_mem_gen_v8_4_4
vlib riviera/mdm_v3_2_17
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/xlconstant_v1_1_6
vlib riviera/smartconnect_v1_0
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_register_slice_v2_1_20
vlib riviera/axi_vip_v1_1_6
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/fifo_generator_v13_2_5
vlib riviera/axi_data_fifo_v2_1_19
vlib riviera/axi_crossbar_v2_1_21
vlib riviera/gigantic_mux
vlib riviera/xlconcat_v2_1_3

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib
vmap microblaze_v11_0_2 riviera/microblaze_v11_0_2
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 riviera/lib_srl_fifo_v1_0_2
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap axi_uartlite_v2_0_24 riviera/axi_uartlite_v2_0_24
vmap interrupt_control_v3_1_4 riviera/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_22 riviera/axi_gpio_v2_0_22
vmap axi_bram_ctrl_v4_1_2 riviera/axi_bram_ctrl_v4_1_2
vmap lmb_v10_v3_0_10 riviera/lmb_v10_v3_0_10
vmap lmb_bram_if_cntlr_v4_0_17 riviera/lmb_bram_if_cntlr_v4_0_17
vmap blk_mem_gen_v8_4_4 riviera/blk_mem_gen_v8_4_4
vmap mdm_v3_2_17 riviera/mdm_v3_2_17
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap xlconstant_v1_1_6 riviera/xlconstant_v1_1_6
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_20 riviera/axi_register_slice_v2_1_20
vmap axi_vip_v1_1_6 riviera/axi_vip_v1_1_6
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_5 riviera/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_19 riviera/axi_data_fifo_v2_1_19
vmap axi_crossbar_v2_1_21 riviera/axi_crossbar_v2_1_21
vmap gigantic_mux riviera/gigantic_mux
vmap xlconcat_v2_1_3 riviera/xlconcat_v2_1_3

vlog -work xilinx_vip  -sv2k12 "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"D:/programs/Xilinx2019.2/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/programs/Xilinx2019.2/Vivado/2019.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/programs/Xilinx2019.2/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/programs/Xilinx2019.2/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_addr_decode.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_read.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_reg.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_reg_bank.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_top.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_write.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_ar_channel.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_aw_channel.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_b_channel.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_arbiter.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_fsm.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_translator.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_fifo.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_incr_cmd.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_r_channel.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_simple_fifo.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_wrap_cmd.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_wr_cmd_fsm.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_w_channel.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_axic_register_slice.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_axi_register_slice.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_axi_upsizer.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_a_upsizer.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_and.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_latch_and.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_latch_or.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_or.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_command_fifo.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator_sel.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator_sel_static.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_r_upsizer.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_w_upsizer.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_2_clk_ibuf.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_2_infrastructure.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_2_iodelay_ctrl.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_2_tempmon.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_arb_mux.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_arb_row_col.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_arb_select.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_cntrl.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_common.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_compare.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_mach.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_queue.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_state.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_col_mach.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_mc.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_rank_cntrl.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_rank_common.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_rank_mach.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_round_robin_arb.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_2_ecc_buf.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_2_ecc_dec_fix.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_2_ecc_gen.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_2_ecc_merge_enc.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_2_fi_xor.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/ip_top/mig_7series_v4_2_memc_ui_top_axi.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/ip_top/mig_7series_v4_2_mem_intfc.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_group_io.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_lane.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_calib_top.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_if_post_fifo.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy_wrapper.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_of_pre_fifo.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_4lanes.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ck_addr_cmd_delay.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal_hr.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_init.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_cntlr.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_data.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_edge.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_lim.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_mux.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_po_cntlr.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_samp.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_oclkdelay_cal.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_prbs_rdlvl.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_rdlvl.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_tempmon.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_top.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrcal.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl_off_delay.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_prbs_gen.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_skip_calib_tap.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_cc.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_edge_store.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_meta.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_pd.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_tap_base.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_top.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_2_ui_cmd.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_2_ui_rd_data.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_2_ui_top.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_2_ui_wr_data.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/Genesys_mig_7series_0_0_mig_sim.v" \
"e:/GenesysDDR/.Xil/Vivado-17824-LAPTOP-OFG8SEHU/coregen/Genesys_mig_7series_0_0/Genesys_mig_7series_0_0/user_design/rtl/Genesys_mig_7series_0_0.v" \

vcom -work microblaze_v11_0_2 -93 \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/f871/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Genesys/ip/Genesys_microblaze_0_0/sim/Genesys_microblaze_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_24 -93 \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/d8db/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Genesys/ip/Genesys_axi_uartlite_0_0/sim/Genesys_axi_uartlite_0_0.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_22 -93 \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/f71e/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Genesys/ip/Genesys_axi_gpio_0_0/sim/Genesys_axi_gpio_0_0.vhd" \

vcom -work axi_bram_ctrl_v4_1_2 -93 \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/a002/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Genesys/ip/Genesys_axi_bram_ctrl_0_0/sim/Genesys_axi_bram_ctrl_0_0.vhd" \

vcom -work lmb_v10_v3_0_10 -93 \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/2e88/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Genesys/ip/Genesys_dlmb_v10_0/sim/Genesys_dlmb_v10_0.vhd" \
"../../../bd/Genesys/ip/Genesys_ilmb_v10_0/sim/Genesys_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_17 -93 \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/db6f/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Genesys/ip/Genesys_dlmb_bram_if_cntlr_0/sim/Genesys_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/Genesys/ip/Genesys_ilmb_bram_if_cntlr_0/sim/Genesys_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/Genesys/ip/Genesys_lmb_bram_0/sim/Genesys_lmb_bram_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/Genesys/ip/Genesys_lmb_v10_0/sim/Genesys_lmb_v10_0.vhd" \

vcom -work mdm_v3_2_17 -93 \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/f9aa/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Genesys/ip/Genesys_mdm_1_0/sim/Genesys_mdm_1_0.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Genesys/ip/Genesys_rst_mig_7series_0_100M_0/sim/Genesys_rst_mig_7series_0_100M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/Genesys/ip/Genesys_axi_bram_ctrl_0_bram_0/sim/Genesys_axi_bram_ctrl_0_bram_0.v" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/sim/bd_9714.v" \

vlog -work xlconstant_v1_1_6  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/34f7/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_0/sim/bd_9714_one_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_1/sim/bd_9714_psr0_0.vhd" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_2/sim/bd_9714_psr_aclk_0.vhd" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_3/sim/bd_9714_psr_aclk1_0.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_4/sim/bd_9714_arsw_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_5/sim/bd_9714_rsw_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_6/sim/bd_9714_awsw_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_7/sim/bd_9714_wsw_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_8/sim/bd_9714_bsw_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/2508/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_9/sim/bd_9714_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_10/sim/bd_9714_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/9d43/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_11/sim/bd_9714_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_12/sim/bd_9714_s00a2s_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_13/sim/bd_9714_sarn_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_14/sim/bd_9714_srn_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_15/sim/bd_9714_sawn_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_16/sim/bd_9714_swn_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_17/sim/bd_9714_sbn_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_18/sim/bd_9714_s01mmu_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_19/sim/bd_9714_s01tr_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_20/sim/bd_9714_s01sic_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_21/sim/bd_9714_s01a2s_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_22/sim/bd_9714_sarn_1.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_23/sim/bd_9714_srn_1.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_24/sim/bd_9714_s02mmu_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_25/sim/bd_9714_s02tr_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_26/sim/bd_9714_s02sic_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_27/sim/bd_9714_s02a2s_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_28/sim/bd_9714_sarn_2.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_29/sim/bd_9714_srn_2.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_30/sim/bd_9714_sawn_1.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_31/sim/bd_9714_swn_1.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_32/sim/bd_9714_sbn_1.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_33/sim/bd_9714_m00s2a_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_34/sim/bd_9714_m00arn_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_35/sim/bd_9714_m00rn_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_36/sim/bd_9714_m00awn_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_37/sim/bd_9714_m00wn_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_38/sim/bd_9714_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/901a/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_39/sim/bd_9714_m00e_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_40/sim/bd_9714_m01s2a_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_41/sim/bd_9714_m01arn_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_42/sim/bd_9714_m01rn_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_43/sim/bd_9714_m01awn_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_44/sim/bd_9714_m01wn_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_45/sim/bd_9714_m01bn_0.sv" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/bd_0/ip/ip_46/sim/bd_9714_m01e_0.sv" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_20  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_6  -sv2k12 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/dc12/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/Genesys/ip/Genesys_axi_smc_0/sim/Genesys_axi_smc_0.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_19  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/60de/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_21  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/6b0d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/Genesys/ip/Genesys_xbar_0/sim/Genesys_xbar_0.v" \
"../../../bd/Genesys/ip/Genesys_system_ila_0/bd_0/sim/bd_c0ef.v" \
"../../../bd/Genesys/ip/Genesys_system_ila_0/bd_0/ip/ip_0/sim/bd_c0ef_ila_lib_0.v" \

vlog -work gigantic_mux  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/d322/hdl/gigantic_mux_v1_0_cntr.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/Genesys/ip/Genesys_system_ila_0/bd_0/ip/ip_1/bd_c0ef_g_inst_0_gigantic_mux.v" \
"../../../bd/Genesys/ip/Genesys_system_ila_0/bd_0/ip/ip_1/sim/bd_c0ef_g_inst_0.v" \

vlog -work xlconcat_v2_1_3  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/Genesys/ip/Genesys_system_ila_0/bd_0/ip/ip_2/sim/bd_c0ef_slot_0_aw_0.v" \
"../../../bd/Genesys/ip/Genesys_system_ila_0/bd_0/ip/ip_3/sim/bd_c0ef_slot_0_w_0.v" \
"../../../bd/Genesys/ip/Genesys_system_ila_0/bd_0/ip/ip_4/sim/bd_c0ef_slot_0_b_0.v" \
"../../../bd/Genesys/ip/Genesys_system_ila_0/bd_0/ip/ip_5/sim/bd_c0ef_slot_0_ar_0.v" \
"../../../bd/Genesys/ip/Genesys_system_ila_0/bd_0/ip/ip_6/sim/bd_c0ef_slot_0_r_0.v" \
"../../../bd/Genesys/ip/Genesys_system_ila_0/sim/Genesys_system_ila_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/Genesys/ip/Genesys_rst_mig_7series_0_225M_0/sim/Genesys_rst_mig_7series_0_225M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1ddd/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b2d0/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/ec67/hdl" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/1b7e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/122e/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/b205/hdl/verilog" "+incdir+../../../../Genesys.srcs/sources_1/bd/Genesys/ipshared/8f82/hdl/verilog" "+incdir+D:/programs/Xilinx2019.2/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/Genesys/sim/Genesys.v" \
"../../../bd/Genesys/ipshared/f72d/hdl/pingpong_clk_v1_0_S00_AXI.v" \
"../../../bd/Genesys/ipshared/f72d/hdl/pingpong_clk_v1_0.v" \
"../../../bd/Genesys/ip/Genesys_pingpong_clk_0_1/sim/Genesys_pingpong_clk_0_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

