set_db source_verbose true 
set_db partition_based_synthesis false

set_db init_lib_search_path /merledu1/pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/
set_db init_hdl_search_path /home/ranwar/RA/azadi_apr/src_updated/
read_libs /merledu1/pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_100C_1v80.lib

#read_hdl *.v

read_hdl -language sv {registers.svh fpnew_pkg.sv brq_pkg.sv cf_math_pkg.sv uart_reg_pkg.sv prim_pkg.sv  jtag_pkg.sv prim_util_pkg.sv spi_defines.sv i2c_master_defines.v rv_plic_reg_pkg.sv  tl_main_pkg.sv tl_periph_pkg.sv tlul_pkg.sv dm_pkg.sv rv_timer_reg_pkg.sv gpio_reg_pkg.sv defs_div_sqrt_mvp.sv azadi_soc_top.sv brq_core.sv brq_core_top.sv brq_counter.sv brq_csr.sv brq_cs_registers.sv brq_exu.sv brq_idu.sv brq_ifu_icache.sv brq_idu_controller.sv brq_ifu_prefetch_buffer.sv  brq_exu_alu.sv brq_exu_multdiv_fast.sv brq_exu_multdiv_slow.sv brq_fp_register_file_ff.sv brq_idu_decoder.sv brq_ifu.sv brq_ifu_compressed_decoder.sv brq_ifu_dummy_instr.sv brq_ifu_fifo.sv brq_lsu.sv brq_pmp.sv brq_register_file_ff.sv brq_wbu.sv control_mvp.sv data_mem.sv debug_rom.sv debug_rom_one_scratch.sv  div_sqrt_mvp_wrapper.sv div_sqrt_top_mvp.sv dm_csrs.sv dmi_cdc.sv dmi_jtag.sv dmi_jtag_tap.sv dm_mem.sv dm_obi_top.sv dm_sba.sv down_clocking_even.sv down_clocking_odd.sv fifo_async.sv fifo_sync.sv fpnew_cast_multi.sv fpnew_classifier.sv fpnew_divsqrt_multi.sv fpnew_fma.sv fpnew_fma_multi.sv fpnew_noncomp.sv fpnew_opgroup_block.sv fpnew_opgroup_fmt_slice.sv fpnew_opgroup_multifmt_slice.sv fpnew_rounding.sv fpnew_top.sv gpio.sv gpio_reg_top.sv instr_mem_top.sv iteration_div_sqrt_mvp.sv lzc.sv minus_one.sv norm_div_sqrt_mvp.sv nrbd_nrsc_mvp.sv preprocess_mvp.sv prim_arbiter_ppc.sv prim_clock_gating.sv prim_filter_ctr.sv prim_generic_clock_gating.sv prim_generic_clock_inv.sv prim_generic_clock_mux2.sv prim_generic_flop.sv prim_generic_flop_2sync.sv prim_intr_hw.sv prim_subreg.sv prim_subreg_arb.sv prim_subreg_ext.sv PWM.sv pwm_top.sv rr_arb_tree.sv rstmgr.sv rv_dm.sv rv_plic.sv rv_plic_gateway.sv rv_plic_reg_top.sv rv_plic_target.sv rv_timer.sv rv_timer_reg_top.sv spi_clgen.sv spi_core.sv spi_shift.sv spi_top.sv sram.sv timer_core.sv tlul_adapter_reg.sv tlul_err.sv tlul_socket_m1.sv uart_rx.sv tlul_err_resp.sv tlul_sram_adapter.sv uart_tx.sv tl_xbar_main.sv uart.sv uart_core.sv uart_reg_top.sv tlul_fifo_async.sv tlul_fifo_sync.sv tlul_host_adapter.sv tlul_socket_1n.sv xbar_periph.sv i2c_master_bit_ctrl.v i2c_master_core.v i2c_master_top.sv i2c_master_byte_ctrl.v  }
set_db hdl_preserve_unused_registers true
elaborate
suspend
#check_design -unresolved
read_sdc /home/ranwar/Trainings/counter_design_database_45nm/constraints/constraints_top.sdc

set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium

syn_generic
syn_map
syn_opt

generate reports
report_area 
report_power
report_design_rules
report_hierarchy
report_memory
report_messages
report_qor
report_timing
report_summary

write_netlist > Azadi.synthesis.v
write_hdl > Azazi_netlist.v
write_sdc > Azadi_sdc.sdc
write_sdf -timescale ns -nonegchecks -recrem split -edges check_edge  -setuphold split > delays.sdf
