//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Fri Jul 30 19:17:27 2021
//Host        : LAPTOP-OFG8SEHU running 64-bit major release  (build 9200)
//Command     : generate_target Genesys_wrapper.bd
//Design      : Genesys_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Genesys_wrapper
   (clk_dac_0,
    clk_dac_1,
    dac_sync_1,
    data_out_0,
    data_out_1,
    ddr3_sdram_addr,
    ddr3_sdram_ba,
    ddr3_sdram_cas_n,
    ddr3_sdram_ck_n,
    ddr3_sdram_ck_p,
    ddr3_sdram_cke,
    ddr3_sdram_cs_n,
    ddr3_sdram_dm,
    ddr3_sdram_dq,
    ddr3_sdram_dqs_n,
    ddr3_sdram_dqs_p,
    ddr3_sdram_odt,
    ddr3_sdram_ras_n,
    ddr3_sdram_reset_n,
    ddr3_sdram_we_n,
    led_0,
    load_0,
    load_1,
    pingpong_clk_1,
    reset,
    resetdac_0,
    resetout_0,
    rst_0,
    rst_1,
    rst_2,
    sys_diff_clock_clk_n,
    sys_diff_clock_clk_p,
    usb_uart_rxd,
    usb_uart_txd);
  output clk_dac_0;
  output clk_dac_1;
  output dac_sync_1;
  output data_out_0;
  output data_out_1;
  output [14:0]ddr3_sdram_addr;
  output [2:0]ddr3_sdram_ba;
  output ddr3_sdram_cas_n;
  output [0:0]ddr3_sdram_ck_n;
  output [0:0]ddr3_sdram_ck_p;
  output [0:0]ddr3_sdram_cke;
  output [0:0]ddr3_sdram_cs_n;
  output [3:0]ddr3_sdram_dm;
  inout [31:0]ddr3_sdram_dq;
  inout [3:0]ddr3_sdram_dqs_n;
  inout [3:0]ddr3_sdram_dqs_p;
  output [0:0]ddr3_sdram_odt;
  output ddr3_sdram_ras_n;
  output ddr3_sdram_reset_n;
  output ddr3_sdram_we_n;
  output [7:0]led_0;
  input load_0;
  input load_1;
  output pingpong_clk_1;
  input reset;
  input resetdac_0;
  output resetout_0;
  input rst_0;
  input rst_1;
  input rst_2;
  input sys_diff_clock_clk_n;
  input sys_diff_clock_clk_p;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire clk_dac_0;
  wire clk_dac_1;
  wire dac_sync_1;
  wire data_out_0;
  wire data_out_1;
  wire [14:0]ddr3_sdram_addr;
  wire [2:0]ddr3_sdram_ba;
  wire ddr3_sdram_cas_n;
  wire [0:0]ddr3_sdram_ck_n;
  wire [0:0]ddr3_sdram_ck_p;
  wire [0:0]ddr3_sdram_cke;
  wire [0:0]ddr3_sdram_cs_n;
  wire [3:0]ddr3_sdram_dm;
  wire [31:0]ddr3_sdram_dq;
  wire [3:0]ddr3_sdram_dqs_n;
  wire [3:0]ddr3_sdram_dqs_p;
  wire [0:0]ddr3_sdram_odt;
  wire ddr3_sdram_ras_n;
  wire ddr3_sdram_reset_n;
  wire ddr3_sdram_we_n;
  wire [7:0]led_0;
  wire load_0;
  wire load_1;
  wire pingpong_clk_1;
  wire reset;
  wire resetdac_0;
  wire resetout_0;
  wire rst_0;
  wire rst_1;
  wire rst_2;
  wire sys_diff_clock_clk_n;
  wire sys_diff_clock_clk_p;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  Genesys Genesys_i
       (.clk_dac_0(clk_dac_0),
        .clk_dac_1(clk_dac_1),
        .dac_sync_1(dac_sync_1),
        .data_out_0(data_out_0),
        .data_out_1(data_out_1),
        .ddr3_sdram_addr(ddr3_sdram_addr),
        .ddr3_sdram_ba(ddr3_sdram_ba),
        .ddr3_sdram_cas_n(ddr3_sdram_cas_n),
        .ddr3_sdram_ck_n(ddr3_sdram_ck_n),
        .ddr3_sdram_ck_p(ddr3_sdram_ck_p),
        .ddr3_sdram_cke(ddr3_sdram_cke),
        .ddr3_sdram_cs_n(ddr3_sdram_cs_n),
        .ddr3_sdram_dm(ddr3_sdram_dm),
        .ddr3_sdram_dq(ddr3_sdram_dq),
        .ddr3_sdram_dqs_n(ddr3_sdram_dqs_n),
        .ddr3_sdram_dqs_p(ddr3_sdram_dqs_p),
        .ddr3_sdram_odt(ddr3_sdram_odt),
        .ddr3_sdram_ras_n(ddr3_sdram_ras_n),
        .ddr3_sdram_reset_n(ddr3_sdram_reset_n),
        .ddr3_sdram_we_n(ddr3_sdram_we_n),
        .led_0(led_0),
        .load_0(load_0),
        .load_1(load_1),
        .pingpong_clk_1(pingpong_clk_1),
        .reset(reset),
        .resetdac_0(resetdac_0),
        .resetout_0(resetout_0),
        .rst_0(rst_0),
        .rst_1(rst_1),
        .rst_2(rst_2),
        .sys_diff_clock_clk_n(sys_diff_clock_clk_n),
        .sys_diff_clock_clk_p(sys_diff_clock_clk_p),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
endmodule
