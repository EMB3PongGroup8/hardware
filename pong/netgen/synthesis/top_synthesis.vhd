--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: top_synthesis.vhd
-- /___/   /\     Timestamp: Tue Mar 17 18:53:47 2015
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm top -w -dir netgen/synthesis -ofmt vhdl -sim top.ngc top_synthesis.vhd 
-- Device	: xc6slx45-3-fgg484
-- Input file	: top.ngc
-- Output file	: E:\Documents\GitHub\hardware\pong\netgen\synthesis\top_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: top
-- Xilinx	: E:\programmer\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity top is
  port (
    CLK200M_i : in STD_LOGIC := 'X'; 
    vga_vsync_i : in STD_LOGIC := 'X'; 
    vga_hsync_i : in STD_LOGIC := 'X'; 
    vga_vsync_o : out STD_LOGIC; 
    vga_hsync_o : out STD_LOGIC; 
    adc_red : in STD_LOGIC_VECTOR ( 9 downto 0 ); 
    adc_green : in STD_LOGIC_VECTOR ( 9 downto 0 ); 
    adc_blue : in STD_LOGIC_VECTOR ( 9 downto 0 ); 
    adc_clk : out STD_LOGIC_VECTOR ( 2 downto 0 ); 
    vga_red_o : out STD_LOGIC_VECTOR ( 2 downto 0 ); 
    vga_green_o : out STD_LOGIC_VECTOR ( 2 downto 0 ); 
    vga_blue_o : out STD_LOGIC_VECTOR ( 2 downto 0 ) 
  );
end top;

architecture Structure of top is
  signal CLK_pixel : STD_LOGIC; 
  signal Inst_vga_generator_Hsync_2 : STD_LOGIC; 
  signal Inst_vga_generator_Vsync_3 : STD_LOGIC; 
  signal N0 : STD_LOGIC; 
  signal pixel_clk_generator_clkfbout_buf : STD_LOGIC; 
  signal pixel_clk_generator_clkout0 : STD_LOGIC; 
  signal pixel_clk_generator_clkfbout : STD_LOGIC; 
  signal pixel_clk_generator_clkin1 : STD_LOGIC; 
  signal Inst_vga_generator_GND_9_o_Vcount_9_equal_12_o_9_1 : STD_LOGIC; 
  signal Inst_vga_generator_Result_9_1 : STD_LOGIC; 
  signal Inst_vga_generator_Result_8_1 : STD_LOGIC; 
  signal Inst_vga_generator_Result_7_1 : STD_LOGIC; 
  signal Inst_vga_generator_Result_6_1 : STD_LOGIC; 
  signal Inst_vga_generator_Result_5_1 : STD_LOGIC; 
  signal Inst_vga_generator_Result_4_1 : STD_LOGIC; 
  signal Inst_vga_generator_Result_3_1 : STD_LOGIC; 
  signal Inst_vga_generator_Result_2_1 : STD_LOGIC; 
  signal Inst_vga_generator_Result_1_1 : STD_LOGIC; 
  signal Inst_vga_generator_Result_0_1 : STD_LOGIC; 
  signal Inst_vga_generator_Hsync_inv : STD_LOGIC; 
  signal Inst_vga_generator_n0070 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal Inst_vga_generator_Hsync_glue_set_88 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Vcount_cy_8_rt_89 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Vcount_cy_7_rt_90 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Vcount_cy_6_rt_91 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Vcount_cy_5_rt_92 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Vcount_cy_4_rt_93 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Vcount_cy_3_rt_94 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Vcount_cy_2_rt_95 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Vcount_cy_1_rt_96 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Hcount_cy_8_rt_97 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Hcount_cy_7_rt_98 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Hcount_cy_6_rt_99 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Hcount_cy_5_rt_100 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Hcount_cy_4_rt_101 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Hcount_cy_3_rt_102 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Hcount_cy_2_rt_103 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Hcount_cy_1_rt_104 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Vcount_xor_9_rt_105 : STD_LOGIC; 
  signal Inst_vga_generator_Mcount_Hcount_xor_9_rt_106 : STD_LOGIC; 
  signal N10 : STD_LOGIC; 
  signal Inst_vga_generator_Vsync_rstpot_108 : STD_LOGIC; 
  signal Inst_vga_generator_Hcount_9_rstpot_109 : STD_LOGIC; 
  signal Inst_vga_generator_Hcount_8_rstpot_110 : STD_LOGIC; 
  signal Inst_vga_generator_Hcount_7_rstpot_111 : STD_LOGIC; 
  signal Inst_vga_generator_Hcount_6_rstpot_112 : STD_LOGIC; 
  signal Inst_vga_generator_Hcount_5_rstpot_113 : STD_LOGIC; 
  signal Inst_vga_generator_Hcount_4_rstpot_114 : STD_LOGIC; 
  signal Inst_vga_generator_Hcount_3_rstpot_115 : STD_LOGIC; 
  signal Inst_vga_generator_Hcount_2_rstpot_116 : STD_LOGIC; 
  signal Inst_vga_generator_Hcount_1_rstpot_117 : STD_LOGIC; 
  signal Inst_vga_generator_Hcount_0_rstpot_118 : STD_LOGIC; 
  signal Inst_vga_generator_Vcount_9_rstpot_119 : STD_LOGIC; 
  signal Inst_vga_generator_Vcount_8_rstpot_120 : STD_LOGIC; 
  signal Inst_vga_generator_Vcount_7_rstpot_121 : STD_LOGIC; 
  signal Inst_vga_generator_Vcount_6_rstpot_122 : STD_LOGIC; 
  signal Inst_vga_generator_Vcount_5_rstpot_123 : STD_LOGIC; 
  signal Inst_vga_generator_Vcount_4_rstpot_124 : STD_LOGIC; 
  signal Inst_vga_generator_Vcount_3_rstpot_125 : STD_LOGIC; 
  signal Inst_vga_generator_Vcount_2_rstpot_126 : STD_LOGIC; 
  signal Inst_vga_generator_Vcount_1_rstpot_127 : STD_LOGIC; 
  signal Inst_vga_generator_Vcount_0_rstpot_128 : STD_LOGIC; 
  signal Inst_vga_generator_Hsync_rstpot_129 : STD_LOGIC; 
  signal NLW_pixel_clk_generator_pll_base_inst_CLKOUT3_UNCONNECTED : STD_LOGIC; 
  signal NLW_pixel_clk_generator_pll_base_inst_CLKOUT1_UNCONNECTED : STD_LOGIC; 
  signal NLW_pixel_clk_generator_pll_base_inst_CLKOUT4_UNCONNECTED : STD_LOGIC; 
  signal NLW_pixel_clk_generator_pll_base_inst_CLKOUT5_UNCONNECTED : STD_LOGIC; 
  signal NLW_pixel_clk_generator_pll_base_inst_CLKOUT2_UNCONNECTED : STD_LOGIC; 
  signal NLW_pixel_clk_generator_pll_base_inst_LOCKED_UNCONNECTED : STD_LOGIC; 
  signal blue : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal Inst_vga_generator_Mcount_Vcount_cy : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal Inst_vga_generator_Mcount_Vcount_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal Inst_vga_generator_Mcount_Hcount_cy : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal Inst_vga_generator_Mcount_Hcount_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal Inst_vga_generator_Vcount : STD_LOGIC_VECTOR ( 9 downto 0 ); 
  signal Inst_vga_generator_Result : STD_LOGIC_VECTOR ( 9 downto 0 ); 
  signal Inst_vga_generator_Hcount : STD_LOGIC_VECTOR ( 9 downto 0 ); 
begin
  XST_VCC : VCC
    port map (
      P => N0
    );
  XST_GND : GND
    port map (
      G => blue(1)
    );
  pixel_clk_generator_clkout1_buf : BUFG
    port map (
      O => CLK_pixel,
      I => pixel_clk_generator_clkout0
    );
  pixel_clk_generator_clkf_buf : BUFG
    port map (
      O => pixel_clk_generator_clkfbout_buf,
      I => pixel_clk_generator_clkfbout
    );
  pixel_clk_generator_clkin1_buf : IBUFG
    generic map(
      CAPACITANCE => "DONT_CARE",
      IBUF_DELAY_VALUE => "0",
      IBUF_LOW_PWR => TRUE,
      IOSTANDARD => "DEFAULT"
    )
    port map (
      I => CLK200M_i,
      O => pixel_clk_generator_clkin1
    );
  Inst_vga_generator_Mcount_Vcount_xor_9_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(8),
      LI => Inst_vga_generator_Mcount_Vcount_xor_9_rt_105,
      O => Inst_vga_generator_Result_9_1
    );
  Inst_vga_generator_Mcount_Vcount_xor_8_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(7),
      LI => Inst_vga_generator_Mcount_Vcount_cy_8_rt_89,
      O => Inst_vga_generator_Result_8_1
    );
  Inst_vga_generator_Mcount_Vcount_cy_8_Q : MUXCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(7),
      DI => blue(1),
      S => Inst_vga_generator_Mcount_Vcount_cy_8_rt_89,
      O => Inst_vga_generator_Mcount_Vcount_cy(8)
    );
  Inst_vga_generator_Mcount_Vcount_xor_7_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(6),
      LI => Inst_vga_generator_Mcount_Vcount_cy_7_rt_90,
      O => Inst_vga_generator_Result_7_1
    );
  Inst_vga_generator_Mcount_Vcount_cy_7_Q : MUXCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(6),
      DI => blue(1),
      S => Inst_vga_generator_Mcount_Vcount_cy_7_rt_90,
      O => Inst_vga_generator_Mcount_Vcount_cy(7)
    );
  Inst_vga_generator_Mcount_Vcount_xor_6_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(5),
      LI => Inst_vga_generator_Mcount_Vcount_cy_6_rt_91,
      O => Inst_vga_generator_Result_6_1
    );
  Inst_vga_generator_Mcount_Vcount_cy_6_Q : MUXCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(5),
      DI => blue(1),
      S => Inst_vga_generator_Mcount_Vcount_cy_6_rt_91,
      O => Inst_vga_generator_Mcount_Vcount_cy(6)
    );
  Inst_vga_generator_Mcount_Vcount_xor_5_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(4),
      LI => Inst_vga_generator_Mcount_Vcount_cy_5_rt_92,
      O => Inst_vga_generator_Result_5_1
    );
  Inst_vga_generator_Mcount_Vcount_cy_5_Q : MUXCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(4),
      DI => blue(1),
      S => Inst_vga_generator_Mcount_Vcount_cy_5_rt_92,
      O => Inst_vga_generator_Mcount_Vcount_cy(5)
    );
  Inst_vga_generator_Mcount_Vcount_xor_4_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(3),
      LI => Inst_vga_generator_Mcount_Vcount_cy_4_rt_93,
      O => Inst_vga_generator_Result_4_1
    );
  Inst_vga_generator_Mcount_Vcount_cy_4_Q : MUXCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(3),
      DI => blue(1),
      S => Inst_vga_generator_Mcount_Vcount_cy_4_rt_93,
      O => Inst_vga_generator_Mcount_Vcount_cy(4)
    );
  Inst_vga_generator_Mcount_Vcount_xor_3_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(2),
      LI => Inst_vga_generator_Mcount_Vcount_cy_3_rt_94,
      O => Inst_vga_generator_Result_3_1
    );
  Inst_vga_generator_Mcount_Vcount_cy_3_Q : MUXCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(2),
      DI => blue(1),
      S => Inst_vga_generator_Mcount_Vcount_cy_3_rt_94,
      O => Inst_vga_generator_Mcount_Vcount_cy(3)
    );
  Inst_vga_generator_Mcount_Vcount_xor_2_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(1),
      LI => Inst_vga_generator_Mcount_Vcount_cy_2_rt_95,
      O => Inst_vga_generator_Result_2_1
    );
  Inst_vga_generator_Mcount_Vcount_cy_2_Q : MUXCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(1),
      DI => blue(1),
      S => Inst_vga_generator_Mcount_Vcount_cy_2_rt_95,
      O => Inst_vga_generator_Mcount_Vcount_cy(2)
    );
  Inst_vga_generator_Mcount_Vcount_xor_1_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(0),
      LI => Inst_vga_generator_Mcount_Vcount_cy_1_rt_96,
      O => Inst_vga_generator_Result_1_1
    );
  Inst_vga_generator_Mcount_Vcount_cy_1_Q : MUXCY
    port map (
      CI => Inst_vga_generator_Mcount_Vcount_cy(0),
      DI => blue(1),
      S => Inst_vga_generator_Mcount_Vcount_cy_1_rt_96,
      O => Inst_vga_generator_Mcount_Vcount_cy(1)
    );
  Inst_vga_generator_Mcount_Vcount_xor_0_Q : XORCY
    port map (
      CI => blue(1),
      LI => Inst_vga_generator_Mcount_Vcount_lut(0),
      O => Inst_vga_generator_Result_0_1
    );
  Inst_vga_generator_Mcount_Vcount_cy_0_Q : MUXCY
    port map (
      CI => blue(1),
      DI => N0,
      S => Inst_vga_generator_Mcount_Vcount_lut(0),
      O => Inst_vga_generator_Mcount_Vcount_cy(0)
    );
  Inst_vga_generator_Mcount_Hcount_xor_9_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(8),
      LI => Inst_vga_generator_Mcount_Hcount_xor_9_rt_106,
      O => Inst_vga_generator_Result(9)
    );
  Inst_vga_generator_Mcount_Hcount_xor_8_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(7),
      LI => Inst_vga_generator_Mcount_Hcount_cy_8_rt_97,
      O => Inst_vga_generator_Result(8)
    );
  Inst_vga_generator_Mcount_Hcount_cy_8_Q : MUXCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(7),
      DI => blue(1),
      S => Inst_vga_generator_Mcount_Hcount_cy_8_rt_97,
      O => Inst_vga_generator_Mcount_Hcount_cy(8)
    );
  Inst_vga_generator_Mcount_Hcount_xor_7_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(6),
      LI => Inst_vga_generator_Mcount_Hcount_cy_7_rt_98,
      O => Inst_vga_generator_Result(7)
    );
  Inst_vga_generator_Mcount_Hcount_cy_7_Q : MUXCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(6),
      DI => blue(1),
      S => Inst_vga_generator_Mcount_Hcount_cy_7_rt_98,
      O => Inst_vga_generator_Mcount_Hcount_cy(7)
    );
  Inst_vga_generator_Mcount_Hcount_xor_6_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(5),
      LI => Inst_vga_generator_Mcount_Hcount_cy_6_rt_99,
      O => Inst_vga_generator_Result(6)
    );
  Inst_vga_generator_Mcount_Hcount_cy_6_Q : MUXCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(5),
      DI => blue(1),
      S => Inst_vga_generator_Mcount_Hcount_cy_6_rt_99,
      O => Inst_vga_generator_Mcount_Hcount_cy(6)
    );
  Inst_vga_generator_Mcount_Hcount_xor_5_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(4),
      LI => Inst_vga_generator_Mcount_Hcount_cy_5_rt_100,
      O => Inst_vga_generator_Result(5)
    );
  Inst_vga_generator_Mcount_Hcount_cy_5_Q : MUXCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(4),
      DI => blue(1),
      S => Inst_vga_generator_Mcount_Hcount_cy_5_rt_100,
      O => Inst_vga_generator_Mcount_Hcount_cy(5)
    );
  Inst_vga_generator_Mcount_Hcount_xor_4_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(3),
      LI => Inst_vga_generator_Mcount_Hcount_cy_4_rt_101,
      O => Inst_vga_generator_Result(4)
    );
  Inst_vga_generator_Mcount_Hcount_cy_4_Q : MUXCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(3),
      DI => blue(1),
      S => Inst_vga_generator_Mcount_Hcount_cy_4_rt_101,
      O => Inst_vga_generator_Mcount_Hcount_cy(4)
    );
  Inst_vga_generator_Mcount_Hcount_xor_3_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(2),
      LI => Inst_vga_generator_Mcount_Hcount_cy_3_rt_102,
      O => Inst_vga_generator_Result(3)
    );
  Inst_vga_generator_Mcount_Hcount_cy_3_Q : MUXCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(2),
      DI => blue(1),
      S => Inst_vga_generator_Mcount_Hcount_cy_3_rt_102,
      O => Inst_vga_generator_Mcount_Hcount_cy(3)
    );
  Inst_vga_generator_Mcount_Hcount_xor_2_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(1),
      LI => Inst_vga_generator_Mcount_Hcount_cy_2_rt_103,
      O => Inst_vga_generator_Result(2)
    );
  Inst_vga_generator_Mcount_Hcount_cy_2_Q : MUXCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(1),
      DI => blue(1),
      S => Inst_vga_generator_Mcount_Hcount_cy_2_rt_103,
      O => Inst_vga_generator_Mcount_Hcount_cy(2)
    );
  Inst_vga_generator_Mcount_Hcount_xor_1_Q : XORCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(0),
      LI => Inst_vga_generator_Mcount_Hcount_cy_1_rt_104,
      O => Inst_vga_generator_Result(1)
    );
  Inst_vga_generator_Mcount_Hcount_cy_1_Q : MUXCY
    port map (
      CI => Inst_vga_generator_Mcount_Hcount_cy(0),
      DI => blue(1),
      S => Inst_vga_generator_Mcount_Hcount_cy_1_rt_104,
      O => Inst_vga_generator_Mcount_Hcount_cy(1)
    );
  Inst_vga_generator_Mcount_Hcount_xor_0_Q : XORCY
    port map (
      CI => blue(1),
      LI => Inst_vga_generator_Mcount_Hcount_lut(0),
      O => Inst_vga_generator_Result(0)
    );
  Inst_vga_generator_Mcount_Hcount_cy_0_Q : MUXCY
    port map (
      CI => blue(1),
      DI => N0,
      S => Inst_vga_generator_Mcount_Hcount_lut(0),
      O => Inst_vga_generator_Mcount_Hcount_cy(0)
    );
  Inst_vga_generator_GND_9_o_Vcount_9_equal_12_o_9_11 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(1),
      I1 => Inst_vga_generator_Vcount(4),
      I2 => Inst_vga_generator_Vcount(5),
      I3 => Inst_vga_generator_Vcount(7),
      I4 => Inst_vga_generator_Vcount(6),
      I5 => Inst_vga_generator_Vcount(8),
      O => Inst_vga_generator_GND_9_o_Vcount_9_equal_12_o_9_1
    );
  Inst_vga_generator_GND_9_o_Hcount_9_equal_2_o_SW0 : LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
    port map (
      I0 => Inst_vga_generator_Hcount(2),
      I1 => Inst_vga_generator_Hcount(1),
      I2 => Inst_vga_generator_Hcount(4),
      I3 => Inst_vga_generator_Hcount(3),
      I4 => Inst_vga_generator_Hcount(5),
      O => N2
    );
  Inst_vga_generator_n00701 : LUT6
    generic map(
      INIT => X"0000000000000080"
    )
    port map (
      I0 => Inst_vga_generator_Hcount(9),
      I1 => Inst_vga_generator_Hcount(0),
      I2 => Inst_vga_generator_Hcount(8),
      I3 => Inst_vga_generator_Hcount(7),
      I4 => Inst_vga_generator_Hcount(6),
      I5 => N2,
      O => Inst_vga_generator_n0070
    );
  adc_clk_2_OBUF : OBUF
    port map (
      I => CLK_pixel,
      O => adc_clk(2)
    );
  adc_clk_1_OBUF : OBUF
    port map (
      I => CLK_pixel,
      O => adc_clk(1)
    );
  adc_clk_0_OBUF : OBUF
    port map (
      I => CLK_pixel,
      O => adc_clk(0)
    );
  vga_red_o_2_OBUF : OBUF
    port map (
      I => blue(1),
      O => vga_red_o(2)
    );
  vga_red_o_1_OBUF : OBUF
    port map (
      I => blue(1),
      O => vga_red_o(1)
    );
  vga_red_o_0_OBUF : OBUF
    port map (
      I => blue(1),
      O => vga_red_o(0)
    );
  vga_green_o_2_OBUF : OBUF
    port map (
      I => blue(1),
      O => vga_green_o(2)
    );
  vga_green_o_1_OBUF : OBUF
    port map (
      I => blue(1),
      O => vga_green_o(1)
    );
  vga_green_o_0_OBUF : OBUF
    port map (
      I => blue(1),
      O => vga_green_o(0)
    );
  vga_blue_o_2_OBUF : OBUF
    port map (
      I => blue(1),
      O => vga_blue_o(2)
    );
  vga_blue_o_1_OBUF : OBUF
    port map (
      I => blue(1),
      O => vga_blue_o(1)
    );
  vga_blue_o_0_OBUF : OBUF
    port map (
      I => blue(1),
      O => vga_blue_o(0)
    );
  vga_vsync_o_OBUF : OBUF
    port map (
      I => Inst_vga_generator_Vsync_3,
      O => vga_vsync_o
    );
  vga_hsync_o_OBUF : OBUF
    port map (
      I => Inst_vga_generator_Hsync_2,
      O => vga_hsync_o
    );
  Inst_vga_generator_Mcount_Vcount_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(8),
      O => Inst_vga_generator_Mcount_Vcount_cy_8_rt_89
    );
  Inst_vga_generator_Mcount_Vcount_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(7),
      O => Inst_vga_generator_Mcount_Vcount_cy_7_rt_90
    );
  Inst_vga_generator_Mcount_Vcount_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(6),
      O => Inst_vga_generator_Mcount_Vcount_cy_6_rt_91
    );
  Inst_vga_generator_Mcount_Vcount_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(5),
      O => Inst_vga_generator_Mcount_Vcount_cy_5_rt_92
    );
  Inst_vga_generator_Mcount_Vcount_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(4),
      O => Inst_vga_generator_Mcount_Vcount_cy_4_rt_93
    );
  Inst_vga_generator_Mcount_Vcount_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(3),
      O => Inst_vga_generator_Mcount_Vcount_cy_3_rt_94
    );
  Inst_vga_generator_Mcount_Vcount_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(2),
      O => Inst_vga_generator_Mcount_Vcount_cy_2_rt_95
    );
  Inst_vga_generator_Mcount_Vcount_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(1),
      O => Inst_vga_generator_Mcount_Vcount_cy_1_rt_96
    );
  Inst_vga_generator_Mcount_Hcount_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Hcount(8),
      O => Inst_vga_generator_Mcount_Hcount_cy_8_rt_97
    );
  Inst_vga_generator_Mcount_Hcount_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Hcount(7),
      O => Inst_vga_generator_Mcount_Hcount_cy_7_rt_98
    );
  Inst_vga_generator_Mcount_Hcount_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Hcount(6),
      O => Inst_vga_generator_Mcount_Hcount_cy_6_rt_99
    );
  Inst_vga_generator_Mcount_Hcount_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Hcount(5),
      O => Inst_vga_generator_Mcount_Hcount_cy_5_rt_100
    );
  Inst_vga_generator_Mcount_Hcount_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Hcount(4),
      O => Inst_vga_generator_Mcount_Hcount_cy_4_rt_101
    );
  Inst_vga_generator_Mcount_Hcount_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Hcount(3),
      O => Inst_vga_generator_Mcount_Hcount_cy_3_rt_102
    );
  Inst_vga_generator_Mcount_Hcount_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Hcount(2),
      O => Inst_vga_generator_Mcount_Hcount_cy_2_rt_103
    );
  Inst_vga_generator_Mcount_Hcount_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Hcount(1),
      O => Inst_vga_generator_Mcount_Hcount_cy_1_rt_104
    );
  Inst_vga_generator_Mcount_Vcount_xor_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(9),
      O => Inst_vga_generator_Mcount_Vcount_xor_9_rt_105
    );
  Inst_vga_generator_Mcount_Hcount_xor_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Hcount(9),
      O => Inst_vga_generator_Mcount_Hcount_xor_9_rt_106
    );
  Inst_vga_generator_GND_9_o_Hcount_9_equal_2_o_SW1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => Inst_vga_generator_Hcount(6),
      I1 => Inst_vga_generator_Hcount(0),
      O => N10
    );
  Inst_vga_generator_Hsync_glue_set : LUT6
    generic map(
      INIT => X"FF00FF00FF01FF00"
    )
    port map (
      I0 => Inst_vga_generator_Hcount(7),
      I1 => Inst_vga_generator_Hcount(8),
      I2 => Inst_vga_generator_Hcount(9),
      I3 => Inst_vga_generator_Hsync_2,
      I4 => N10,
      I5 => N2,
      O => Inst_vga_generator_Hsync_glue_set_88
    );
  Inst_vga_generator_Vsync : FD_1
    port map (
      C => Inst_vga_generator_Hsync_2,
      D => Inst_vga_generator_Vsync_rstpot_108,
      Q => Inst_vga_generator_Vsync_3
    );
  Inst_vga_generator_Vsync_rstpot : LUT6
    generic map(
      INIT => X"A2AAAABAAAAAAAAA"
    )
    port map (
      I0 => Inst_vga_generator_Vsync_3,
      I1 => Inst_vga_generator_Vcount(2),
      I2 => Inst_vga_generator_Vcount(0),
      I3 => Inst_vga_generator_Vcount(3),
      I4 => Inst_vga_generator_Vcount(9),
      I5 => Inst_vga_generator_GND_9_o_Vcount_9_equal_12_o_9_1,
      O => Inst_vga_generator_Vsync_rstpot_108
    );
  Inst_vga_generator_Hcount_9_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Result(9),
      I1 => Inst_vga_generator_n0070,
      O => Inst_vga_generator_Hcount_9_rstpot_109
    );
  Inst_vga_generator_Hcount_9 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_pixel,
      D => Inst_vga_generator_Hcount_9_rstpot_109,
      Q => Inst_vga_generator_Hcount(9)
    );
  Inst_vga_generator_Hcount_8_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Result(8),
      I1 => Inst_vga_generator_n0070,
      O => Inst_vga_generator_Hcount_8_rstpot_110
    );
  Inst_vga_generator_Hcount_8 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_pixel,
      D => Inst_vga_generator_Hcount_8_rstpot_110,
      Q => Inst_vga_generator_Hcount(8)
    );
  Inst_vga_generator_Hcount_7_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Result(7),
      I1 => Inst_vga_generator_n0070,
      O => Inst_vga_generator_Hcount_7_rstpot_111
    );
  Inst_vga_generator_Hcount_7 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_pixel,
      D => Inst_vga_generator_Hcount_7_rstpot_111,
      Q => Inst_vga_generator_Hcount(7)
    );
  Inst_vga_generator_Hcount_6_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Result(6),
      I1 => Inst_vga_generator_n0070,
      O => Inst_vga_generator_Hcount_6_rstpot_112
    );
  Inst_vga_generator_Hcount_6 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_pixel,
      D => Inst_vga_generator_Hcount_6_rstpot_112,
      Q => Inst_vga_generator_Hcount(6)
    );
  Inst_vga_generator_Hcount_5_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Result(5),
      I1 => Inst_vga_generator_n0070,
      O => Inst_vga_generator_Hcount_5_rstpot_113
    );
  Inst_vga_generator_Hcount_5 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_pixel,
      D => Inst_vga_generator_Hcount_5_rstpot_113,
      Q => Inst_vga_generator_Hcount(5)
    );
  Inst_vga_generator_Hcount_4_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Result(4),
      I1 => Inst_vga_generator_n0070,
      O => Inst_vga_generator_Hcount_4_rstpot_114
    );
  Inst_vga_generator_Hcount_4 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_pixel,
      D => Inst_vga_generator_Hcount_4_rstpot_114,
      Q => Inst_vga_generator_Hcount(4)
    );
  Inst_vga_generator_Hcount_3_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Result(3),
      I1 => Inst_vga_generator_n0070,
      O => Inst_vga_generator_Hcount_3_rstpot_115
    );
  Inst_vga_generator_Hcount_3 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_pixel,
      D => Inst_vga_generator_Hcount_3_rstpot_115,
      Q => Inst_vga_generator_Hcount(3)
    );
  Inst_vga_generator_Hcount_2_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Result(2),
      I1 => Inst_vga_generator_n0070,
      O => Inst_vga_generator_Hcount_2_rstpot_116
    );
  Inst_vga_generator_Hcount_2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_pixel,
      D => Inst_vga_generator_Hcount_2_rstpot_116,
      Q => Inst_vga_generator_Hcount(2)
    );
  Inst_vga_generator_Hcount_1_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Result(1),
      I1 => Inst_vga_generator_n0070,
      O => Inst_vga_generator_Hcount_1_rstpot_117
    );
  Inst_vga_generator_Hcount_1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_pixel,
      D => Inst_vga_generator_Hcount_1_rstpot_117,
      Q => Inst_vga_generator_Hcount(1)
    );
  Inst_vga_generator_Hcount_0_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Result(0),
      I1 => Inst_vga_generator_n0070,
      O => Inst_vga_generator_Hcount_0_rstpot_118
    );
  Inst_vga_generator_Hcount_0 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_pixel,
      D => Inst_vga_generator_Hcount_0_rstpot_118,
      Q => Inst_vga_generator_Hcount(0)
    );
  Inst_vga_generator_Vcount_9 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Inst_vga_generator_Hsync_inv,
      D => Inst_vga_generator_Vcount_9_rstpot_119,
      Q => Inst_vga_generator_Vcount(9)
    );
  Inst_vga_generator_Vcount_8 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Inst_vga_generator_Hsync_inv,
      D => Inst_vga_generator_Vcount_8_rstpot_120,
      Q => Inst_vga_generator_Vcount(8)
    );
  Inst_vga_generator_Vcount_7 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Inst_vga_generator_Hsync_inv,
      D => Inst_vga_generator_Vcount_7_rstpot_121,
      Q => Inst_vga_generator_Vcount(7)
    );
  Inst_vga_generator_Vcount_6 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Inst_vga_generator_Hsync_inv,
      D => Inst_vga_generator_Vcount_6_rstpot_122,
      Q => Inst_vga_generator_Vcount(6)
    );
  Inst_vga_generator_Vcount_5 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Inst_vga_generator_Hsync_inv,
      D => Inst_vga_generator_Vcount_5_rstpot_123,
      Q => Inst_vga_generator_Vcount(5)
    );
  Inst_vga_generator_Vcount_4 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Inst_vga_generator_Hsync_inv,
      D => Inst_vga_generator_Vcount_4_rstpot_124,
      Q => Inst_vga_generator_Vcount(4)
    );
  Inst_vga_generator_Vcount_3 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Inst_vga_generator_Hsync_inv,
      D => Inst_vga_generator_Vcount_3_rstpot_125,
      Q => Inst_vga_generator_Vcount(3)
    );
  Inst_vga_generator_Vcount_2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Inst_vga_generator_Hsync_inv,
      D => Inst_vga_generator_Vcount_2_rstpot_126,
      Q => Inst_vga_generator_Vcount(2)
    );
  Inst_vga_generator_Vcount_1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Inst_vga_generator_Hsync_inv,
      D => Inst_vga_generator_Vcount_1_rstpot_127,
      Q => Inst_vga_generator_Vcount(1)
    );
  Inst_vga_generator_Vcount_0 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Inst_vga_generator_Hsync_inv,
      D => Inst_vga_generator_Vcount_0_rstpot_128,
      Q => Inst_vga_generator_Vcount(0)
    );
  Inst_vga_generator_Hsync_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_vga_generator_Hsync_glue_set_88,
      I1 => Inst_vga_generator_n0070,
      O => Inst_vga_generator_Hsync_rstpot_129
    );
  Inst_vga_generator_Hsync : FD
    port map (
      C => CLK_pixel,
      D => Inst_vga_generator_Hsync_rstpot_129,
      Q => Inst_vga_generator_Hsync_2
    );
  Inst_vga_generator_Vcount_0_rstpot : LUT6
    generic map(
      INIT => X"BFFF0000FFFF0000"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(0),
      I1 => Inst_vga_generator_Vcount(9),
      I2 => Inst_vga_generator_Vcount(3),
      I3 => Inst_vga_generator_Vcount(2),
      I4 => Inst_vga_generator_Result_0_1,
      I5 => Inst_vga_generator_GND_9_o_Vcount_9_equal_12_o_9_1,
      O => Inst_vga_generator_Vcount_0_rstpot_128
    );
  Inst_vga_generator_Vcount_1_rstpot : LUT6
    generic map(
      INIT => X"BFFF0000FFFF0000"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(0),
      I1 => Inst_vga_generator_Vcount(9),
      I2 => Inst_vga_generator_Vcount(3),
      I3 => Inst_vga_generator_Vcount(2),
      I4 => Inst_vga_generator_Result_1_1,
      I5 => Inst_vga_generator_GND_9_o_Vcount_9_equal_12_o_9_1,
      O => Inst_vga_generator_Vcount_1_rstpot_127
    );
  Inst_vga_generator_Vcount_2_rstpot : LUT6
    generic map(
      INIT => X"BFFF0000FFFF0000"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(0),
      I1 => Inst_vga_generator_Vcount(9),
      I2 => Inst_vga_generator_Vcount(3),
      I3 => Inst_vga_generator_Vcount(2),
      I4 => Inst_vga_generator_Result_2_1,
      I5 => Inst_vga_generator_GND_9_o_Vcount_9_equal_12_o_9_1,
      O => Inst_vga_generator_Vcount_2_rstpot_126
    );
  Inst_vga_generator_Vcount_3_rstpot : LUT6
    generic map(
      INIT => X"BFFFFFFF00000000"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(0),
      I1 => Inst_vga_generator_Vcount(9),
      I2 => Inst_vga_generator_Vcount(3),
      I3 => Inst_vga_generator_Vcount(2),
      I4 => Inst_vga_generator_GND_9_o_Vcount_9_equal_12_o_9_1,
      I5 => Inst_vga_generator_Result_3_1,
      O => Inst_vga_generator_Vcount_3_rstpot_125
    );
  Inst_vga_generator_Vcount_4_rstpot : LUT6
    generic map(
      INIT => X"BFFFFFFF00000000"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(0),
      I1 => Inst_vga_generator_Vcount(9),
      I2 => Inst_vga_generator_Vcount(3),
      I3 => Inst_vga_generator_Vcount(2),
      I4 => Inst_vga_generator_GND_9_o_Vcount_9_equal_12_o_9_1,
      I5 => Inst_vga_generator_Result_4_1,
      O => Inst_vga_generator_Vcount_4_rstpot_124
    );
  Inst_vga_generator_Vcount_5_rstpot : LUT6
    generic map(
      INIT => X"BFFFFFFF00000000"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(0),
      I1 => Inst_vga_generator_Vcount(9),
      I2 => Inst_vga_generator_Vcount(3),
      I3 => Inst_vga_generator_Vcount(2),
      I4 => Inst_vga_generator_GND_9_o_Vcount_9_equal_12_o_9_1,
      I5 => Inst_vga_generator_Result_5_1,
      O => Inst_vga_generator_Vcount_5_rstpot_123
    );
  Inst_vga_generator_Vcount_6_rstpot : LUT6
    generic map(
      INIT => X"BFFFFFFF00000000"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(0),
      I1 => Inst_vga_generator_Vcount(9),
      I2 => Inst_vga_generator_Vcount(3),
      I3 => Inst_vga_generator_Vcount(2),
      I4 => Inst_vga_generator_GND_9_o_Vcount_9_equal_12_o_9_1,
      I5 => Inst_vga_generator_Result_6_1,
      O => Inst_vga_generator_Vcount_6_rstpot_122
    );
  Inst_vga_generator_Vcount_7_rstpot : LUT6
    generic map(
      INIT => X"BFFFFFFF00000000"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(0),
      I1 => Inst_vga_generator_Vcount(9),
      I2 => Inst_vga_generator_Vcount(3),
      I3 => Inst_vga_generator_Vcount(2),
      I4 => Inst_vga_generator_GND_9_o_Vcount_9_equal_12_o_9_1,
      I5 => Inst_vga_generator_Result_7_1,
      O => Inst_vga_generator_Vcount_7_rstpot_121
    );
  Inst_vga_generator_Vcount_8_rstpot : LUT6
    generic map(
      INIT => X"BFFFFFFF00000000"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(0),
      I1 => Inst_vga_generator_Vcount(9),
      I2 => Inst_vga_generator_Vcount(3),
      I3 => Inst_vga_generator_Vcount(2),
      I4 => Inst_vga_generator_GND_9_o_Vcount_9_equal_12_o_9_1,
      I5 => Inst_vga_generator_Result_8_1,
      O => Inst_vga_generator_Vcount_8_rstpot_120
    );
  Inst_vga_generator_Vcount_9_rstpot : LUT6
    generic map(
      INIT => X"BFFFFFFF00000000"
    )
    port map (
      I0 => Inst_vga_generator_Vcount(0),
      I1 => Inst_vga_generator_Vcount(9),
      I2 => Inst_vga_generator_Vcount(3),
      I3 => Inst_vga_generator_Vcount(2),
      I4 => Inst_vga_generator_GND_9_o_Vcount_9_equal_12_o_9_1,
      I5 => Inst_vga_generator_Result_9_1,
      O => Inst_vga_generator_Vcount_9_rstpot_119
    );
  Inst_vga_generator_Mcount_Vcount_lut_0_INV_0 : INV
    port map (
      I => Inst_vga_generator_Vcount(0),
      O => Inst_vga_generator_Mcount_Vcount_lut(0)
    );
  Inst_vga_generator_Mcount_Hcount_lut_0_INV_0 : INV
    port map (
      I => Inst_vga_generator_Hcount(0),
      O => Inst_vga_generator_Mcount_Hcount_lut(0)
    );
  Inst_vga_generator_Hsync_inv1_INV_0 : INV
    port map (
      I => Inst_vga_generator_Hsync_2,
      O => Inst_vga_generator_Hsync_inv
    );
  pixel_clk_generator_pll_base_inst : PLL_BASE
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT => 37,
      CLKFBOUT_PHASE => 0.000000,
      CLKIN_PERIOD => 5.000000,
      CLKOUT0_DIVIDE => 42,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT1_DIVIDE => 1,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLK_FEEDBACK => "CLKFBOUT",
      COMPENSATION => "SYSTEM_SYNCHRONOUS",
      DIVCLK_DIVIDE => 7,
      REF_JITTER => 0.010000,
      RESET_ON_LOSS_OF_LOCK => FALSE
    )
    port map (
      CLKIN => pixel_clk_generator_clkin1,
      CLKFBIN => pixel_clk_generator_clkfbout_buf,
      CLKOUT0 => pixel_clk_generator_clkout0,
      CLKFBOUT => pixel_clk_generator_clkfbout,
      RST => blue(1),
      CLKOUT3 => NLW_pixel_clk_generator_pll_base_inst_CLKOUT3_UNCONNECTED,
      CLKOUT1 => NLW_pixel_clk_generator_pll_base_inst_CLKOUT1_UNCONNECTED,
      CLKOUT4 => NLW_pixel_clk_generator_pll_base_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_pixel_clk_generator_pll_base_inst_CLKOUT5_UNCONNECTED,
      CLKOUT2 => NLW_pixel_clk_generator_pll_base_inst_CLKOUT2_UNCONNECTED,
      LOCKED => NLW_pixel_clk_generator_pll_base_inst_LOCKED_UNCONNECTED
    );

end Structure;

