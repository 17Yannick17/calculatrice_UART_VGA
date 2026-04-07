-- Copyright (C) 2025  Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Altera and sold by Altera or its authorized distributors.  Please
-- refer to the Altera Software License Subscription Agreements 
-- on the Quartus Prime software download page.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 25.1std.0 Build 1129 10/21/2025 SC Lite Edition"

-- DATE "04/07/2026 09:06:55"

-- 
-- Device: Altera 10M50DAF484C6GES Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Altera FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Text_screen_test IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(1 DOWNTO 0);
	VGA_R : BUFFER std_logic_vector(3 DOWNTO 0);
	VGA_G : BUFFER std_logic_vector(3 DOWNTO 0);
	VGA_B : BUFFER std_logic_vector(3 DOWNTO 0);
	VGA_HS : BUFFER std_logic;
	VGA_VS : BUFFER std_logic
	);
END Text_screen_test;

-- Design Ports Information
-- KEY[1]	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- VGA_R[0]	=>  Location: PIN_AA1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_R[1]	=>  Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_R[2]	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_R[3]	=>  Location: PIN_Y1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_G[0]	=>  Location: PIN_W1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_G[1]	=>  Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_G[2]	=>  Location: PIN_R2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_G[3]	=>  Location: PIN_R1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_B[0]	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_B[1]	=>  Location: PIN_T1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_B[2]	=>  Location: PIN_P4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_B[3]	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_HS	=>  Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_VS	=>  Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- KEY[0]	=>  Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_P11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF Text_screen_test IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_VGA_R : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_VGA_G : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_VGA_B : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_VGA_HS : std_logic;
SIGNAL ww_VGA_VS : std_logic;
SIGNAL \vga|font_table|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \vga|font_table|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \vga|pll|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \vga|pll|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a1_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a1_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a1_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a2_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a2_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a2_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a3_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a3_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a3_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a4_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a5_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a5_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a5_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a6_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a6_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a6_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_TDO~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \~ALTERA_TDO~~obuf_o\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \vga|pll|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \vga|Add1~0_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:hcount[0]~q\ : std_logic;
SIGNAL \vga|Add1~1\ : std_logic;
SIGNAL \vga|Add1~2_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:hcount[1]~q\ : std_logic;
SIGNAL \vga|Add1~3\ : std_logic;
SIGNAL \vga|Add1~4_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:hcount[2]~q\ : std_logic;
SIGNAL \vga|Add1~5\ : std_logic;
SIGNAL \vga|Add1~6_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:hcount[3]~q\ : std_logic;
SIGNAL \vga|Add1~7\ : std_logic;
SIGNAL \vga|Add1~8_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:hcount[4]~q\ : std_logic;
SIGNAL \vga|Add1~9\ : std_logic;
SIGNAL \vga|Add1~10_combout\ : std_logic;
SIGNAL \vga|hcount~2_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:hcount[5]~q\ : std_logic;
SIGNAL \vga|Add1~11\ : std_logic;
SIGNAL \vga|Add1~12_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:hcount[6]~q\ : std_logic;
SIGNAL \vga|Add1~13\ : std_logic;
SIGNAL \vga|Add1~14_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:hcount[7]~q\ : std_logic;
SIGNAL \vga|Add1~15\ : std_logic;
SIGNAL \vga|Add1~16_combout\ : std_logic;
SIGNAL \vga|hcount~1_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:hcount[8]~q\ : std_logic;
SIGNAL \vga|Equal0~0_combout\ : std_logic;
SIGNAL \vga|Equal0~1_combout\ : std_logic;
SIGNAL \vga|Equal0~2_combout\ : std_logic;
SIGNAL \vga|Add1~17\ : std_logic;
SIGNAL \vga|Add1~18_combout\ : std_logic;
SIGNAL \vga|hcount~0_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:hcount[9]~q\ : std_logic;
SIGNAL \vga|Add0~0_combout\ : std_logic;
SIGNAL \vga|Equal1~2_combout\ : std_logic;
SIGNAL \vga|Equal1~1_combout\ : std_logic;
SIGNAL \vga|Equal1~0_combout\ : std_logic;
SIGNAL \vga|vcount~4_combout\ : std_logic;
SIGNAL \vga|vcount~10_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:vcount[0]~q\ : std_logic;
SIGNAL \vga|Add0~1\ : std_logic;
SIGNAL \vga|Add0~2_combout\ : std_logic;
SIGNAL \vga|vcount~9_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:vcount[1]~q\ : std_logic;
SIGNAL \vga|Add0~3\ : std_logic;
SIGNAL \vga|Add0~4_combout\ : std_logic;
SIGNAL \vga|vcount~8_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:vcount[2]~q\ : std_logic;
SIGNAL \vga|Add0~5\ : std_logic;
SIGNAL \vga|Add0~6_combout\ : std_logic;
SIGNAL \vga|vcount~7_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:vcount[3]~q\ : std_logic;
SIGNAL \vga|Add0~7\ : std_logic;
SIGNAL \vga|Add0~8_combout\ : std_logic;
SIGNAL \vga|vcount~6_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:vcount[4]~q\ : std_logic;
SIGNAL \vga|Add0~9\ : std_logic;
SIGNAL \vga|Add0~10_combout\ : std_logic;
SIGNAL \vga|vcount~3_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:vcount[5]~q\ : std_logic;
SIGNAL \vga|Add0~11\ : std_logic;
SIGNAL \vga|Add0~12_combout\ : std_logic;
SIGNAL \vga|vcount~1_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:vcount[6]~q\ : std_logic;
SIGNAL \vga|Add0~13\ : std_logic;
SIGNAL \vga|Add0~14_combout\ : std_logic;
SIGNAL \vga|vcount~2_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:vcount[7]~q\ : std_logic;
SIGNAL \vga|Add0~15\ : std_logic;
SIGNAL \vga|Add0~16_combout\ : std_logic;
SIGNAL \vga|vcount~0_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:vcount[8]~q\ : std_logic;
SIGNAL \vga|Add0~17\ : std_logic;
SIGNAL \vga|Add0~18_combout\ : std_logic;
SIGNAL \vga|vcount~5_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit:vcount[9]~q\ : std_logic;
SIGNAL \vga|Timing_Circuit~17_combout\ : std_logic;
SIGNAL \vga|LessThan3~0_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~18_combout\ : std_logic;
SIGNAL \vga|b1~q\ : std_logic;
SIGNAL \vga|b2~feeder_combout\ : std_logic;
SIGNAL \vga|b2~q\ : std_logic;
SIGNAL \vga|blank~q\ : std_logic;
SIGNAL \vga|X[9]~0_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~8_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~9_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~3_combout\ : std_logic;
SIGNAL \vga|LessThan22~0_combout\ : std_logic;
SIGNAL \vga|LessThan17~0_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~6_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~7_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~10_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~2_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~11_combout\ : std_logic;
SIGNAL \vga|r[0]~13_combout\ : std_logic;
SIGNAL \vga|LessThan21~0_combout\ : std_logic;
SIGNAL \vga|LessThan19~0_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~4_combout\ : std_logic;
SIGNAL \vga|LessThan17~1_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~5_combout\ : std_logic;
SIGNAL \vga|X[1]~feeder_combout\ : std_logic;
SIGNAL \vga|FX1[1]~feeder_combout\ : std_logic;
SIGNAL \vga|Y[0]~feeder_combout\ : std_logic;
SIGNAL \vga|FY[0]~feeder_combout\ : std_logic;
SIGNAL \vga|Y[1]~feeder_combout\ : std_logic;
SIGNAL \vga|FY[1]~feeder_combout\ : std_logic;
SIGNAL \vga|Y[2]~feeder_combout\ : std_logic;
SIGNAL \vga|FY[2]~feeder_combout\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \x[0]~7_combout\ : std_logic;
SIGNAL \x[0]~9_combout\ : std_logic;
SIGNAL \x[0]~8\ : std_logic;
SIGNAL \x[1]~10_combout\ : std_logic;
SIGNAL \x[1]~11\ : std_logic;
SIGNAL \x[2]~12_combout\ : std_logic;
SIGNAL \x[2]~13\ : std_logic;
SIGNAL \x[3]~14_combout\ : std_logic;
SIGNAL \x[3]~15\ : std_logic;
SIGNAL \x[4]~16_combout\ : std_logic;
SIGNAL \x[4]~17\ : std_logic;
SIGNAL \x[5]~18_combout\ : std_logic;
SIGNAL \x[5]~19\ : std_logic;
SIGNAL \x[6]~20_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \SV.clean3~q\ : std_logic;
SIGNAL \y[0]~5_combout\ : std_logic;
SIGNAL \y[1]~6_combout\ : std_logic;
SIGNAL \y[1]~7\ : std_logic;
SIGNAL \y[2]~8_combout\ : std_logic;
SIGNAL \y[2]~9\ : std_logic;
SIGNAL \y[3]~10_combout\ : std_logic;
SIGNAL \y[3]~11\ : std_logic;
SIGNAL \y[4]~12_combout\ : std_logic;
SIGNAL \y[4]~13\ : std_logic;
SIGNAL \y[5]~14_combout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \x[0]~22_combout\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \SV.clean0~q\ : std_logic;
SIGNAL \SV.clean1~0_combout\ : std_logic;
SIGNAL \SV.clean1~q\ : std_logic;
SIGNAL \SV.clean2~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \mem_wr~q\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \vga|X[3]~feeder_combout\ : std_logic;
SIGNAL \Equal18~2_combout\ : std_logic;
SIGNAL \Equal19~2_combout\ : std_logic;
SIGNAL \Equal23~1_combout\ : std_logic;
SIGNAL \screen_test~17_combout\ : std_logic;
SIGNAL \screen_test~18_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \Equal24~4_combout\ : std_logic;
SIGNAL \Equal16~0_combout\ : std_logic;
SIGNAL \screen_test~19_combout\ : std_logic;
SIGNAL \screen_test~8_combout\ : std_logic;
SIGNAL \Equal20~0_combout\ : std_logic;
SIGNAL \screen_test~7_combout\ : std_logic;
SIGNAL \screen_test~9_combout\ : std_logic;
SIGNAL \Equal21~2_combout\ : std_logic;
SIGNAL \screen_test~10_combout\ : std_logic;
SIGNAL \Mux26~0_combout\ : std_logic;
SIGNAL \screen_test~11_combout\ : std_logic;
SIGNAL \screen_test~12_combout\ : std_logic;
SIGNAL \screen_test~1_combout\ : std_logic;
SIGNAL \screen_test~2_combout\ : std_logic;
SIGNAL \screen_test~13_combout\ : std_logic;
SIGNAL \screen_test~14_combout\ : std_logic;
SIGNAL \screen_test~15_combout\ : std_logic;
SIGNAL \Equal23~0_combout\ : std_logic;
SIGNAL \screen_test~3_combout\ : std_logic;
SIGNAL \screen_test~0_combout\ : std_logic;
SIGNAL \screen_test~4_combout\ : std_logic;
SIGNAL \screen_test~5_combout\ : std_logic;
SIGNAL \screen_test~6_combout\ : std_logic;
SIGNAL \screen_test~16_combout\ : std_logic;
SIGNAL \screen_test~20_combout\ : std_logic;
SIGNAL \screen_test~30_combout\ : std_logic;
SIGNAL \screen_test~31_combout\ : std_logic;
SIGNAL \Equal21~5_combout\ : std_logic;
SIGNAL \Equal21~6_combout\ : std_logic;
SIGNAL \Equal14~0_combout\ : std_logic;
SIGNAL \Equal14~1_combout\ : std_logic;
SIGNAL \screen_test~32_combout\ : std_logic;
SIGNAL \Equal21~3_combout\ : std_logic;
SIGNAL \Equal21~4_combout\ : std_logic;
SIGNAL \Equal18~3_combout\ : std_logic;
SIGNAL \Equal18~4_combout\ : std_logic;
SIGNAL \Equal20~1_combout\ : std_logic;
SIGNAL \Equal17~0_combout\ : std_logic;
SIGNAL \Equal17~1_combout\ : std_logic;
SIGNAL \mem_in~11_combout\ : std_logic;
SIGNAL \LessThan21~0_combout\ : std_logic;
SIGNAL \screen_test~24_combout\ : std_logic;
SIGNAL \Equal22~0_combout\ : std_logic;
SIGNAL \mem_in~12_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \screen_test~26_combout\ : std_logic;
SIGNAL \screen_test~38_combout\ : std_logic;
SIGNAL \screen_test~39_combout\ : std_logic;
SIGNAL \screen_test~40_combout\ : std_logic;
SIGNAL \Equal19~3_combout\ : std_logic;
SIGNAL \Equal19~4_combout\ : std_logic;
SIGNAL \Equal16~1_combout\ : std_logic;
SIGNAL \Equal16~2_combout\ : std_logic;
SIGNAL \mem_in~19_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \screen_test~36_combout\ : std_logic;
SIGNAL \screen_test~37_combout\ : std_logic;
SIGNAL \mem_in~20_combout\ : std_logic;
SIGNAL \mem_in~21_combout\ : std_logic;
SIGNAL \Equal24~5_combout\ : std_logic;
SIGNAL \screen_test~25_combout\ : std_logic;
SIGNAL \mem_in~23_combout\ : std_logic;
SIGNAL \LessThan18~0_combout\ : std_logic;
SIGNAL \screen_test~33_combout\ : std_logic;
SIGNAL \mem_in~81_combout\ : std_logic;
SIGNAL \screen_test~34_combout\ : std_logic;
SIGNAL \screen_test~35_combout\ : std_logic;
SIGNAL \screen_test~27_combout\ : std_logic;
SIGNAL \screen_test~28_combout\ : std_logic;
SIGNAL \Equal14~2_combout\ : std_logic;
SIGNAL \screen_test~29_combout\ : std_logic;
SIGNAL \Mux36~2_combout\ : std_logic;
SIGNAL \Mux36~3_combout\ : std_logic;
SIGNAL \Mux26~2_combout\ : std_logic;
SIGNAL \Mux26~3_combout\ : std_logic;
SIGNAL \Mux26~4_combout\ : std_logic;
SIGNAL \Mux26~1_combout\ : std_logic;
SIGNAL \Mux26~5_combout\ : std_logic;
SIGNAL \mem_in~22_combout\ : std_logic;
SIGNAL \mem_in~24_combout\ : std_logic;
SIGNAL \Mux14~8_combout\ : std_logic;
SIGNAL \Mux14~5_combout\ : std_logic;
SIGNAL \Mux14~4_combout\ : std_logic;
SIGNAL \Mux14~6_combout\ : std_logic;
SIGNAL \mem_in~25_combout\ : std_logic;
SIGNAL \Equal24~6_combout\ : std_logic;
SIGNAL \mem_in~13_combout\ : std_logic;
SIGNAL \mem_in~14_combout\ : std_logic;
SIGNAL \mem_in~6_combout\ : std_logic;
SIGNAL \screen_test~21_combout\ : std_logic;
SIGNAL \screen_test~22_combout\ : std_logic;
SIGNAL \Equal23~2_combout\ : std_logic;
SIGNAL \mem_in~15_combout\ : std_logic;
SIGNAL \mem_in~16_combout\ : std_logic;
SIGNAL \mem_in~17_combout\ : std_logic;
SIGNAL \mem_in~8_combout\ : std_logic;
SIGNAL \mem_in~9_combout\ : std_logic;
SIGNAL \mem_in~10_combout\ : std_logic;
SIGNAL \mem_in~18_combout\ : std_logic;
SIGNAL \Mux18~0_combout\ : std_logic;
SIGNAL \Mux18~1_combout\ : std_logic;
SIGNAL \mem_in~7_combout\ : std_logic;
SIGNAL \mem_in~80_combout\ : std_logic;
SIGNAL \mem_in~26_combout\ : std_logic;
SIGNAL \Mux26~6_combout\ : std_logic;
SIGNAL \mem_in~27_combout\ : std_logic;
SIGNAL \mem_in~28_combout\ : std_logic;
SIGNAL \mem_in~34_combout\ : std_logic;
SIGNAL \mem_in~35_combout\ : std_logic;
SIGNAL \mem_in~36_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \mem_in~37_combout\ : std_logic;
SIGNAL \mem_in~32_combout\ : std_logic;
SIGNAL \mem_in~33_combout\ : std_logic;
SIGNAL \mem_in~38_combout\ : std_logic;
SIGNAL \Equal18~5_combout\ : std_logic;
SIGNAL \mem_in[4]~29_combout\ : std_logic;
SIGNAL \mem_in~82_combout\ : std_logic;
SIGNAL \Mux42~0_combout\ : std_logic;
SIGNAL \mem_in~30_combout\ : std_logic;
SIGNAL \mem_in~31_combout\ : std_logic;
SIGNAL \mem_in~39_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \mem_in~42_combout\ : std_logic;
SIGNAL \Mux24~1_combout\ : std_logic;
SIGNAL \Mux24~2_combout\ : std_logic;
SIGNAL \Mux24~0_combout\ : std_logic;
SIGNAL \Mux24~3_combout\ : std_logic;
SIGNAL \mem_in~40_combout\ : std_logic;
SIGNAL \mem_in~41_combout\ : std_logic;
SIGNAL \mem_in~43_combout\ : std_logic;
SIGNAL \mem_in~44_combout\ : std_logic;
SIGNAL \screen_test~23_combout\ : std_logic;
SIGNAL \mem_in~45_combout\ : std_logic;
SIGNAL \mem_in~46_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \mem_in~47_combout\ : std_logic;
SIGNAL \mem_in~48_combout\ : std_logic;
SIGNAL \mem_in~49_combout\ : std_logic;
SIGNAL \mem_in~50_combout\ : std_logic;
SIGNAL \mem_in~51_combout\ : std_logic;
SIGNAL \Equal19~5_combout\ : std_logic;
SIGNAL \mem_in~56_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \mem_in~53_combout\ : std_logic;
SIGNAL \Mux23~0_combout\ : std_logic;
SIGNAL \mem_in~54_combout\ : std_logic;
SIGNAL \Mux14~7_combout\ : std_logic;
SIGNAL \mem_in~55_combout\ : std_logic;
SIGNAL \mem_in~52_combout\ : std_logic;
SIGNAL \mem_in~57_combout\ : std_logic;
SIGNAL \mem_in~63_combout\ : std_logic;
SIGNAL \Mux22~0_combout\ : std_logic;
SIGNAL \mem_in~65_combout\ : std_logic;
SIGNAL \mem_in~64_combout\ : std_logic;
SIGNAL \mem_in~66_combout\ : std_logic;
SIGNAL \Mux40~2_combout\ : std_logic;
SIGNAL \Mux40~3_combout\ : std_logic;
SIGNAL \mem_in~60_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \mem_in~59_combout\ : std_logic;
SIGNAL \mem_in~61_combout\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \mem_in~58_combout\ : std_logic;
SIGNAL \mem_in~62_combout\ : std_logic;
SIGNAL \mem_in~67_combout\ : std_logic;
SIGNAL \mem_in~68_combout\ : std_logic;
SIGNAL \mem_in~69_combout\ : std_logic;
SIGNAL \mem_in~72_combout\ : std_logic;
SIGNAL \mem_in~74_combout\ : std_logic;
SIGNAL \mem_in~75_combout\ : std_logic;
SIGNAL \mem_in~73_combout\ : std_logic;
SIGNAL \mem_in~76_combout\ : std_logic;
SIGNAL \mem_in~70_combout\ : std_logic;
SIGNAL \Mux28~0_combout\ : std_logic;
SIGNAL \mem_in~71_combout\ : std_logic;
SIGNAL \mem_in~77_combout\ : std_logic;
SIGNAL \mem_in~78_combout\ : std_logic;
SIGNAL \mem_in[5]~_wirecell_combout\ : std_logic;
SIGNAL \mem_in~79_combout\ : std_logic;
SIGNAL \vga|X[0]~feeder_combout\ : std_logic;
SIGNAL \vga|FX1[0]~feeder_combout\ : std_logic;
SIGNAL \vga|Mux0~2_combout\ : std_logic;
SIGNAL \vga|Mux0~3_combout\ : std_logic;
SIGNAL \vga|X[2]~feeder_combout\ : std_logic;
SIGNAL \vga|FX1[2]~feeder_combout\ : std_logic;
SIGNAL \vga|Mux0~0_combout\ : std_logic;
SIGNAL \vga|Mux0~1_combout\ : std_logic;
SIGNAL \vga|Mux0~4_combout\ : std_logic;
SIGNAL \vga|r~3_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~16_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~15_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~14_combout\ : std_logic;
SIGNAL \vga|g~0_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~12_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~13_combout\ : std_logic;
SIGNAL \vga|r~4_combout\ : std_logic;
SIGNAL \vga|r~2_combout\ : std_logic;
SIGNAL \vga|Timing_Circuit~19_combout\ : std_logic;
SIGNAL \vga|r~5_combout\ : std_logic;
SIGNAL \vga|r~7_combout\ : std_logic;
SIGNAL \vga|r~6_combout\ : std_logic;
SIGNAL \vga|g~1_combout\ : std_logic;
SIGNAL \vga|r~8_combout\ : std_logic;
SIGNAL \vga|r~9_combout\ : std_logic;
SIGNAL \vga|r~10_combout\ : std_logic;
SIGNAL \vga|r~11_combout\ : std_logic;
SIGNAL \vga|r[3]~feeder_combout\ : std_logic;
SIGNAL \vga|g[0]~feeder_combout\ : std_logic;
SIGNAL \vga|g~2_combout\ : std_logic;
SIGNAL \vga|g[3]~feeder_combout\ : std_logic;
SIGNAL \vga|b~0_combout\ : std_logic;
SIGNAL \vga|b~1_combout\ : std_logic;
SIGNAL \vga|b~2_combout\ : std_logic;
SIGNAL \vga|b~3_combout\ : std_logic;
SIGNAL \vga|r[0]~12_combout\ : std_logic;
SIGNAL \vga|b~4_combout\ : std_logic;
SIGNAL \vga|Equal2~0_combout\ : std_logic;
SIGNAL \vga|Equal2~1_combout\ : std_logic;
SIGNAL \vga|Equal2~2_combout\ : std_logic;
SIGNAL \vga|hs1~0_combout\ : std_logic;
SIGNAL \vga|hs1~q\ : std_logic;
SIGNAL \vga|hs2~feeder_combout\ : std_logic;
SIGNAL \vga|hs2~q\ : std_logic;
SIGNAL \vga|hs3~feeder_combout\ : std_logic;
SIGNAL \vga|hs3~q\ : std_logic;
SIGNAL \vga|vga_hs~0_combout\ : std_logic;
SIGNAL \vga|vga_hs~q\ : std_logic;
SIGNAL \vga|Equal4~0_combout\ : std_logic;
SIGNAL \vga|Equal4~1_combout\ : std_logic;
SIGNAL \vga|Equal4~2_combout\ : std_logic;
SIGNAL \vga|vs1~0_combout\ : std_logic;
SIGNAL \vga|vs1~q\ : std_logic;
SIGNAL \vga|vs2~feeder_combout\ : std_logic;
SIGNAL \vga|vs2~q\ : std_logic;
SIGNAL \vga|vs3~feeder_combout\ : std_logic;
SIGNAL \vga|vs3~q\ : std_logic;
SIGNAL \vga|vga_vs~0_combout\ : std_logic;
SIGNAL \vga|vga_vs~q\ : std_logic;
SIGNAL \vga|g\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \vga|font_table|altsyncram_component|auto_generated|q_a\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \vga|FX2\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \vga|pll|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL y : std_logic_vector(5 DOWNTO 0);
SIGNAL \vga|Video_RAM|altsyncram_component|auto_generated|q_a\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \vga|r\ : std_logic_vector(3 DOWNTO 0);
SIGNAL x : std_logic_vector(6 DOWNTO 0);
SIGNAL \vga|b\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \vga|Y\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \vga|X\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \vga|FY\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \vga|FX1\ : std_logic_vector(2 DOWNTO 0);
SIGNAL mem_in : std_logic_vector(6 DOWNTO 0);
SIGNAL \vga|ALT_INV_vga_hs~q\ : std_logic;
SIGNAL \vga|ALT_INV_vga_vs~q\ : std_logic;
SIGNAL \ALT_INV_SV.clean0~q\ : std_logic;
SIGNAL \ALT_INV_KEY[0]~input_o\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
VGA_R <= ww_VGA_R;
VGA_G <= ww_VGA_G;
VGA_B <= ww_VGA_B;
VGA_HS <= ww_VGA_HS;
VGA_VS <= ww_VGA_VS;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\vga|font_table|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\vga|Video_RAM|altsyncram_component|auto_generated|q_a\(6) & \vga|Video_RAM|altsyncram_component|auto_generated|q_a\(5) & 
\vga|Video_RAM|altsyncram_component|auto_generated|q_a\(4) & \vga|Video_RAM|altsyncram_component|auto_generated|q_a\(3) & \vga|Video_RAM|altsyncram_component|auto_generated|q_a\(2) & \vga|Video_RAM|altsyncram_component|auto_generated|q_a\(1) & 
\vga|Video_RAM|altsyncram_component|auto_generated|q_a\(0) & \vga|FY\(2) & \vga|FY\(1) & \vga|FY\(0));

\vga|font_table|altsyncram_component|auto_generated|q_a\(0) <= \vga|font_table|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\vga|font_table|altsyncram_component|auto_generated|q_a\(1) <= \vga|font_table|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\vga|font_table|altsyncram_component|auto_generated|q_a\(2) <= \vga|font_table|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\vga|font_table|altsyncram_component|auto_generated|q_a\(3) <= \vga|font_table|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\vga|font_table|altsyncram_component|auto_generated|q_a\(4) <= \vga|font_table|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\vga|font_table|altsyncram_component|auto_generated|q_a\(5) <= \vga|font_table|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\vga|font_table|altsyncram_component|auto_generated|q_a\(6) <= \vga|font_table|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\vga|font_table|altsyncram_component|auto_generated|q_a\(7) <= \vga|font_table|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);

\vga|pll|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \CLOCK_50~input_o\);

\vga|pll|altpll_component|auto_generated|wire_pll1_clk\(0) <= \vga|pll|altpll_component|auto_generated|pll1_CLK_bus\(0);
\vga|pll|altpll_component|auto_generated|wire_pll1_clk\(1) <= \vga|pll|altpll_component|auto_generated|pll1_CLK_bus\(1);
\vga|pll|altpll_component|auto_generated|wire_pll1_clk\(2) <= \vga|pll|altpll_component|auto_generated|pll1_CLK_bus\(2);
\vga|pll|altpll_component|auto_generated|wire_pll1_clk\(3) <= \vga|pll|altpll_component|auto_generated|pll1_CLK_bus\(3);
\vga|pll|altpll_component|auto_generated|wire_pll1_clk\(4) <= \vga|pll|altpll_component|auto_generated|pll1_CLK_bus\(4);

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\(0) <= \~GND~combout\;

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAIN_bus\(0) <= mem_in(0);

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\vga|Y\(8) & \vga|Y\(7) & \vga|Y\(6) & \vga|Y\(5) & \vga|Y\(4) & \vga|Y\(3) & \vga|X\(9) & \vga|X\(8) & \vga|X\(7) & \vga|X\(6) & \vga|X\(5) & 
\vga|X\(4) & \vga|X\(3));

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (y(5) & y(4) & y(3) & y(2) & y(1) & y(0) & x(6) & x(5) & x(4) & x(3) & x(2) & x(1) & x(0));

\vga|Video_RAM|altsyncram_component|auto_generated|q_a\(0) <= \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a1_PORTADATAIN_bus\(0) <= \~GND~combout\;

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a1_PORTBDATAIN_bus\(0) <= mem_in(1);

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\vga|Y\(8) & \vga|Y\(7) & \vga|Y\(6) & \vga|Y\(5) & \vga|Y\(4) & \vga|Y\(3) & \vga|X\(9) & \vga|X\(8) & \vga|X\(7) & \vga|X\(6) & \vga|X\(5) & 
\vga|X\(4) & \vga|X\(3));

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a1_PORTBADDR_bus\ <= (y(5) & y(4) & y(3) & y(2) & y(1) & y(0) & x(6) & x(5) & x(4) & x(3) & x(2) & x(1) & x(0));

\vga|Video_RAM|altsyncram_component|auto_generated|q_a\(1) <= \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\(0);

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a2_PORTADATAIN_bus\(0) <= \~GND~combout\;

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a2_PORTBDATAIN_bus\(0) <= mem_in(2);

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\vga|Y\(8) & \vga|Y\(7) & \vga|Y\(6) & \vga|Y\(5) & \vga|Y\(4) & \vga|Y\(3) & \vga|X\(9) & \vga|X\(8) & \vga|X\(7) & \vga|X\(6) & \vga|X\(5) & 
\vga|X\(4) & \vga|X\(3));

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a2_PORTBADDR_bus\ <= (y(5) & y(4) & y(3) & y(2) & y(1) & y(0) & x(6) & x(5) & x(4) & x(3) & x(2) & x(1) & x(0));

\vga|Video_RAM|altsyncram_component|auto_generated|q_a\(2) <= \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a3_PORTADATAIN_bus\(0) <= \~GND~combout\;

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a3_PORTBDATAIN_bus\(0) <= mem_in(3);

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\vga|Y\(8) & \vga|Y\(7) & \vga|Y\(6) & \vga|Y\(5) & \vga|Y\(4) & \vga|Y\(3) & \vga|X\(9) & \vga|X\(8) & \vga|X\(7) & \vga|X\(6) & \vga|X\(5) & 
\vga|X\(4) & \vga|X\(3));

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a3_PORTBADDR_bus\ <= (y(5) & y(4) & y(3) & y(2) & y(1) & y(0) & x(6) & x(5) & x(4) & x(3) & x(2) & x(1) & x(0));

\vga|Video_RAM|altsyncram_component|auto_generated|q_a\(3) <= \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\(0);

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\(0) <= \~GND~combout\;

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAIN_bus\(0) <= mem_in(4);

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\vga|Y\(8) & \vga|Y\(7) & \vga|Y\(6) & \vga|Y\(5) & \vga|Y\(4) & \vga|Y\(3) & \vga|X\(9) & \vga|X\(8) & \vga|X\(7) & \vga|X\(6) & \vga|X\(5) & 
\vga|X\(4) & \vga|X\(3));

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a4_PORTBADDR_bus\ <= (y(5) & y(4) & y(3) & y(2) & y(1) & y(0) & x(6) & x(5) & x(4) & x(3) & x(2) & x(1) & x(0));

\vga|Video_RAM|altsyncram_component|auto_generated|q_a\(4) <= \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a5_PORTADATAIN_bus\(0) <= \~GND~combout\;

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a5_PORTBDATAIN_bus\(0) <= \mem_in[5]~_wirecell_combout\;

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\vga|Y\(8) & \vga|Y\(7) & \vga|Y\(6) & \vga|Y\(5) & \vga|Y\(4) & \vga|Y\(3) & \vga|X\(9) & \vga|X\(8) & \vga|X\(7) & \vga|X\(6) & \vga|X\(5) & 
\vga|X\(4) & \vga|X\(3));

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a5_PORTBADDR_bus\ <= (y(5) & y(4) & y(3) & y(2) & y(1) & y(0) & x(6) & x(5) & x(4) & x(3) & x(2) & x(1) & x(0));

\vga|Video_RAM|altsyncram_component|auto_generated|q_a\(5) <= \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\(0);

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a6_PORTADATAIN_bus\(0) <= \~GND~combout\;

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a6_PORTBDATAIN_bus\(0) <= mem_in(6);

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\vga|Y\(8) & \vga|Y\(7) & \vga|Y\(6) & \vga|Y\(5) & \vga|Y\(4) & \vga|Y\(3) & \vga|X\(9) & \vga|X\(8) & \vga|X\(7) & \vga|X\(6) & \vga|X\(5) & 
\vga|X\(4) & \vga|X\(3));

\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a6_PORTBADDR_bus\ <= (y(5) & y(4) & y(3) & y(2) & y(1) & y(0) & x(6) & x(5) & x(4) & x(3) & x(2) & x(1) & x(0));

\vga|Video_RAM|altsyncram_component|auto_generated|q_a\(6) <= \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \vga|pll|altpll_component|auto_generated|wire_pll1_clk\(0));

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
\vga|ALT_INV_vga_hs~q\ <= NOT \vga|vga_hs~q\;
\vga|ALT_INV_vga_vs~q\ <= NOT \vga|vga_vs~q\;
\ALT_INV_SV.clean0~q\ <= NOT \SV.clean0~q\;
\ALT_INV_KEY[0]~input_o\ <= NOT \KEY[0]~input_o\;

-- Location: IOOBUF_X18_Y0_N30
\VGA_R[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|r\(0),
	devoe => ww_devoe,
	o => ww_VGA_R(0));

-- Location: IOOBUF_X0_Y12_N9
\VGA_R[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|r\(1),
	devoe => ww_devoe,
	o => ww_VGA_R(1));

-- Location: IOOBUF_X16_Y0_N16
\VGA_R[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|r\(2),
	devoe => ww_devoe,
	o => ww_VGA_R(2));

-- Location: IOOBUF_X16_Y0_N23
\VGA_R[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|r\(3),
	devoe => ww_devoe,
	o => ww_VGA_R(3));

-- Location: IOOBUF_X0_Y9_N2
\VGA_G[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|g\(0),
	devoe => ww_devoe,
	o => ww_VGA_G(0));

-- Location: IOOBUF_X0_Y15_N9
\VGA_G[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|g\(1),
	devoe => ww_devoe,
	o => ww_VGA_G(1));

-- Location: IOOBUF_X0_Y3_N9
\VGA_G[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|g\(2),
	devoe => ww_devoe,
	o => ww_VGA_G(2));

-- Location: IOOBUF_X0_Y3_N2
\VGA_G[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|g\(3),
	devoe => ww_devoe,
	o => ww_VGA_G(3));

-- Location: IOOBUF_X0_Y13_N2
\VGA_B[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|b\(0),
	devoe => ww_devoe,
	o => ww_VGA_B(0));

-- Location: IOOBUF_X0_Y15_N2
\VGA_B[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|b\(1),
	devoe => ww_devoe,
	o => ww_VGA_B(1));

-- Location: IOOBUF_X0_Y23_N2
\VGA_B[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|b\(2),
	devoe => ww_devoe,
	o => ww_VGA_B(2));

-- Location: IOOBUF_X0_Y18_N9
\VGA_B[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|b\(3),
	devoe => ww_devoe,
	o => ww_VGA_B(3));

-- Location: IOOBUF_X0_Y18_N2
\VGA_HS~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|ALT_INV_vga_hs~q\,
	devoe => ww_devoe,
	o => ww_VGA_HS);

-- Location: IOOBUF_X0_Y13_N9
\VGA_VS~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|ALT_INV_vga_vs~q\,
	devoe => ww_devoe,
	o => ww_VGA_VS);

-- Location: IOIBUF_X46_Y54_N29
\KEY[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: IOIBUF_X34_Y0_N29
\CLOCK_50~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: PLL_1
\vga|pll|altpll_component|auto_generated|pll1\ : fiftyfivenm_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 13,
	c0_initial => 1,
	c0_low => 12,
	c0_mode => "odd",
	c0_ph => 0,
	c1_high => 0,
	c1_initial => 0,
	c1_low => 0,
	c1_mode => "bypass",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c0",
	clk0_divide_by => 125,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 63,
	clk0_phase_shift => "0",
	clk1_counter => "unused",
	clk1_divide_by => 0,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 0,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 16,
	m => 63,
	m_initial => 1,
	m_ph => 0,
	n => 5,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	self_reset_on_loss_lock => "off",
	simulation_type => "functional",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 198,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	areset => \ALT_INV_KEY[0]~input_o\,
	fbin => \vga|pll|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \vga|pll|altpll_component|auto_generated|pll1_INCLK_bus\,
	fbout => \vga|pll|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \vga|pll|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_G18
\vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

-- Location: LCCOMB_X50_Y35_N4
\vga|Add1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add1~0_combout\ = \vga|Timing_Circuit:hcount[0]~q\ $ (VCC)
-- \vga|Add1~1\ = CARRY(\vga|Timing_Circuit:hcount[0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:hcount[0]~q\,
	datad => VCC,
	combout => \vga|Add1~0_combout\,
	cout => \vga|Add1~1\);

-- Location: FF_X50_Y35_N5
\vga|Timing_Circuit:hcount[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|Add1~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:hcount[0]~q\);

-- Location: LCCOMB_X50_Y35_N6
\vga|Add1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add1~2_combout\ = (\vga|Timing_Circuit:hcount[1]~q\ & (!\vga|Add1~1\)) # (!\vga|Timing_Circuit:hcount[1]~q\ & ((\vga|Add1~1\) # (GND)))
-- \vga|Add1~3\ = CARRY((!\vga|Add1~1\) # (!\vga|Timing_Circuit:hcount[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \vga|Timing_Circuit:hcount[1]~q\,
	datad => VCC,
	cin => \vga|Add1~1\,
	combout => \vga|Add1~2_combout\,
	cout => \vga|Add1~3\);

-- Location: FF_X50_Y35_N7
\vga|Timing_Circuit:hcount[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|Add1~2_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:hcount[1]~q\);

-- Location: LCCOMB_X50_Y35_N8
\vga|Add1~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add1~4_combout\ = (\vga|Timing_Circuit:hcount[2]~q\ & (\vga|Add1~3\ $ (GND))) # (!\vga|Timing_Circuit:hcount[2]~q\ & (!\vga|Add1~3\ & VCC))
-- \vga|Add1~5\ = CARRY((\vga|Timing_Circuit:hcount[2]~q\ & !\vga|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:hcount[2]~q\,
	datad => VCC,
	cin => \vga|Add1~3\,
	combout => \vga|Add1~4_combout\,
	cout => \vga|Add1~5\);

-- Location: FF_X50_Y35_N9
\vga|Timing_Circuit:hcount[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|Add1~4_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:hcount[2]~q\);

-- Location: LCCOMB_X50_Y35_N10
\vga|Add1~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add1~6_combout\ = (\vga|Timing_Circuit:hcount[3]~q\ & (!\vga|Add1~5\)) # (!\vga|Timing_Circuit:hcount[3]~q\ & ((\vga|Add1~5\) # (GND)))
-- \vga|Add1~7\ = CARRY((!\vga|Add1~5\) # (!\vga|Timing_Circuit:hcount[3]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:hcount[3]~q\,
	datad => VCC,
	cin => \vga|Add1~5\,
	combout => \vga|Add1~6_combout\,
	cout => \vga|Add1~7\);

-- Location: FF_X50_Y35_N11
\vga|Timing_Circuit:hcount[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|Add1~6_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:hcount[3]~q\);

-- Location: LCCOMB_X50_Y35_N12
\vga|Add1~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add1~8_combout\ = (\vga|Timing_Circuit:hcount[4]~q\ & (\vga|Add1~7\ $ (GND))) # (!\vga|Timing_Circuit:hcount[4]~q\ & (!\vga|Add1~7\ & VCC))
-- \vga|Add1~9\ = CARRY((\vga|Timing_Circuit:hcount[4]~q\ & !\vga|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \vga|Timing_Circuit:hcount[4]~q\,
	datad => VCC,
	cin => \vga|Add1~7\,
	combout => \vga|Add1~8_combout\,
	cout => \vga|Add1~9\);

-- Location: FF_X50_Y35_N13
\vga|Timing_Circuit:hcount[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|Add1~8_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:hcount[4]~q\);

-- Location: LCCOMB_X50_Y35_N14
\vga|Add1~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add1~10_combout\ = (\vga|Timing_Circuit:hcount[5]~q\ & (!\vga|Add1~9\)) # (!\vga|Timing_Circuit:hcount[5]~q\ & ((\vga|Add1~9\) # (GND)))
-- \vga|Add1~11\ = CARRY((!\vga|Add1~9\) # (!\vga|Timing_Circuit:hcount[5]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:hcount[5]~q\,
	datad => VCC,
	cin => \vga|Add1~9\,
	combout => \vga|Add1~10_combout\,
	cout => \vga|Add1~11\);

-- Location: LCCOMB_X46_Y33_N24
\vga|hcount~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|hcount~2_combout\ = (!\vga|Equal0~2_combout\ & \vga|Add1~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Equal0~2_combout\,
	datad => \vga|Add1~10_combout\,
	combout => \vga|hcount~2_combout\);

-- Location: FF_X46_Y33_N25
\vga|Timing_Circuit:hcount[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|hcount~2_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:hcount[5]~q\);

-- Location: LCCOMB_X50_Y35_N16
\vga|Add1~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add1~12_combout\ = (\vga|Timing_Circuit:hcount[6]~q\ & (\vga|Add1~11\ $ (GND))) # (!\vga|Timing_Circuit:hcount[6]~q\ & (!\vga|Add1~11\ & VCC))
-- \vga|Add1~13\ = CARRY((\vga|Timing_Circuit:hcount[6]~q\ & !\vga|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:hcount[6]~q\,
	datad => VCC,
	cin => \vga|Add1~11\,
	combout => \vga|Add1~12_combout\,
	cout => \vga|Add1~13\);

-- Location: FF_X50_Y35_N17
\vga|Timing_Circuit:hcount[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|Add1~12_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:hcount[6]~q\);

-- Location: LCCOMB_X50_Y35_N18
\vga|Add1~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add1~14_combout\ = (\vga|Timing_Circuit:hcount[7]~q\ & (!\vga|Add1~13\)) # (!\vga|Timing_Circuit:hcount[7]~q\ & ((\vga|Add1~13\) # (GND)))
-- \vga|Add1~15\ = CARRY((!\vga|Add1~13\) # (!\vga|Timing_Circuit:hcount[7]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \vga|Timing_Circuit:hcount[7]~q\,
	datad => VCC,
	cin => \vga|Add1~13\,
	combout => \vga|Add1~14_combout\,
	cout => \vga|Add1~15\);

-- Location: FF_X50_Y35_N19
\vga|Timing_Circuit:hcount[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|Add1~14_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:hcount[7]~q\);

-- Location: LCCOMB_X50_Y35_N20
\vga|Add1~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add1~16_combout\ = (\vga|Timing_Circuit:hcount[8]~q\ & (\vga|Add1~15\ $ (GND))) # (!\vga|Timing_Circuit:hcount[8]~q\ & (!\vga|Add1~15\ & VCC))
-- \vga|Add1~17\ = CARRY((\vga|Timing_Circuit:hcount[8]~q\ & !\vga|Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \vga|Timing_Circuit:hcount[8]~q\,
	datad => VCC,
	cin => \vga|Add1~15\,
	combout => \vga|Add1~16_combout\,
	cout => \vga|Add1~17\);

-- Location: LCCOMB_X46_Y33_N6
\vga|hcount~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|hcount~1_combout\ = (!\vga|Equal0~2_combout\ & \vga|Add1~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Equal0~2_combout\,
	datad => \vga|Add1~16_combout\,
	combout => \vga|hcount~1_combout\);

-- Location: FF_X46_Y33_N7
\vga|Timing_Circuit:hcount[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|hcount~1_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:hcount[8]~q\);

-- Location: LCCOMB_X50_Y35_N2
\vga|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Equal0~0_combout\ = (\vga|Timing_Circuit:hcount[9]~q\ & (\vga|Timing_Circuit:hcount[8]~q\ & (!\vga|Timing_Circuit:hcount[6]~q\ & !\vga|Timing_Circuit:hcount[7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:hcount[9]~q\,
	datab => \vga|Timing_Circuit:hcount[8]~q\,
	datac => \vga|Timing_Circuit:hcount[6]~q\,
	datad => \vga|Timing_Circuit:hcount[7]~q\,
	combout => \vga|Equal0~0_combout\);

-- Location: LCCOMB_X50_Y35_N0
\vga|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Equal0~1_combout\ = (\vga|Timing_Circuit:hcount[2]~q\ & (\vga|Timing_Circuit:hcount[4]~q\ & (\vga|Timing_Circuit:hcount[3]~q\ & !\vga|Timing_Circuit:hcount[5]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:hcount[2]~q\,
	datab => \vga|Timing_Circuit:hcount[4]~q\,
	datac => \vga|Timing_Circuit:hcount[3]~q\,
	datad => \vga|Timing_Circuit:hcount[5]~q\,
	combout => \vga|Equal0~1_combout\);

-- Location: LCCOMB_X50_Y35_N26
\vga|Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Equal0~2_combout\ = (\vga|Timing_Circuit:hcount[0]~q\ & (\vga|Equal0~0_combout\ & (\vga|Timing_Circuit:hcount[1]~q\ & \vga|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:hcount[0]~q\,
	datab => \vga|Equal0~0_combout\,
	datac => \vga|Timing_Circuit:hcount[1]~q\,
	datad => \vga|Equal0~1_combout\,
	combout => \vga|Equal0~2_combout\);

-- Location: LCCOMB_X50_Y35_N22
\vga|Add1~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add1~18_combout\ = \vga|Add1~17\ $ (\vga|Timing_Circuit:hcount[9]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \vga|Timing_Circuit:hcount[9]~q\,
	cin => \vga|Add1~17\,
	combout => \vga|Add1~18_combout\);

-- Location: LCCOMB_X46_Y33_N20
\vga|hcount~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|hcount~0_combout\ = (!\vga|Equal0~2_combout\ & \vga|Add1~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Equal0~2_combout\,
	datac => \vga|Add1~18_combout\,
	combout => \vga|hcount~0_combout\);

-- Location: FF_X46_Y33_N21
\vga|Timing_Circuit:hcount[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|hcount~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:hcount[9]~q\);

-- Location: LCCOMB_X52_Y34_N0
\vga|Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add0~0_combout\ = \vga|Timing_Circuit:vcount[0]~q\ $ (VCC)
-- \vga|Add0~1\ = CARRY(\vga|Timing_Circuit:vcount[0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:vcount[0]~q\,
	datad => VCC,
	combout => \vga|Add0~0_combout\,
	cout => \vga|Add0~1\);

-- Location: LCCOMB_X52_Y32_N22
\vga|Equal1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Equal1~2_combout\ = (!\vga|Timing_Circuit:vcount[1]~q\ & !\vga|Timing_Circuit:vcount[0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:vcount[1]~q\,
	datac => \vga|Timing_Circuit:vcount[0]~q\,
	combout => \vga|Equal1~2_combout\);

-- Location: LCCOMB_X52_Y32_N4
\vga|Equal1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Equal1~1_combout\ = (\vga|Timing_Circuit:vcount[3]~q\ & (!\vga|Timing_Circuit:vcount[4]~q\ & (\vga|Timing_Circuit:vcount[2]~q\ & !\vga|Timing_Circuit:vcount[5]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:vcount[3]~q\,
	datab => \vga|Timing_Circuit:vcount[4]~q\,
	datac => \vga|Timing_Circuit:vcount[2]~q\,
	datad => \vga|Timing_Circuit:vcount[5]~q\,
	combout => \vga|Equal1~1_combout\);

-- Location: LCCOMB_X52_Y34_N20
\vga|Equal1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Equal1~0_combout\ = (!\vga|Timing_Circuit:vcount[6]~q\ & (!\vga|Timing_Circuit:vcount[7]~q\ & (\vga|Timing_Circuit:vcount[9]~q\ & !\vga|Timing_Circuit:vcount[8]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:vcount[6]~q\,
	datab => \vga|Timing_Circuit:vcount[7]~q\,
	datac => \vga|Timing_Circuit:vcount[9]~q\,
	datad => \vga|Timing_Circuit:vcount[8]~q\,
	combout => \vga|Equal1~0_combout\);

-- Location: LCCOMB_X52_Y32_N16
\vga|vcount~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|vcount~4_combout\ = (\vga|Equal0~2_combout\ & (((!\vga|Equal1~0_combout\) # (!\vga|Equal1~1_combout\)) # (!\vga|Equal1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Equal1~2_combout\,
	datab => \vga|Equal0~2_combout\,
	datac => \vga|Equal1~1_combout\,
	datad => \vga|Equal1~0_combout\,
	combout => \vga|vcount~4_combout\);

-- Location: LCCOMB_X52_Y32_N2
\vga|vcount~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|vcount~10_combout\ = (\vga|Add0~0_combout\ & ((\vga|vcount~4_combout\) # ((\vga|Timing_Circuit:vcount[0]~q\ & !\vga|Equal0~2_combout\)))) # (!\vga|Add0~0_combout\ & (((\vga|Timing_Circuit:vcount[0]~q\ & !\vga|Equal0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Add0~0_combout\,
	datab => \vga|vcount~4_combout\,
	datac => \vga|Timing_Circuit:vcount[0]~q\,
	datad => \vga|Equal0~2_combout\,
	combout => \vga|vcount~10_combout\);

-- Location: FF_X52_Y32_N3
\vga|Timing_Circuit:vcount[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|vcount~10_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:vcount[0]~q\);

-- Location: LCCOMB_X52_Y34_N2
\vga|Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add0~2_combout\ = (\vga|Timing_Circuit:vcount[1]~q\ & (!\vga|Add0~1\)) # (!\vga|Timing_Circuit:vcount[1]~q\ & ((\vga|Add0~1\) # (GND)))
-- \vga|Add0~3\ = CARRY((!\vga|Add0~1\) # (!\vga|Timing_Circuit:vcount[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \vga|Timing_Circuit:vcount[1]~q\,
	datad => VCC,
	cin => \vga|Add0~1\,
	combout => \vga|Add0~2_combout\,
	cout => \vga|Add0~3\);

-- Location: LCCOMB_X52_Y32_N0
\vga|vcount~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|vcount~9_combout\ = (\vga|Equal0~2_combout\ & ((\vga|Add0~2_combout\))) # (!\vga|Equal0~2_combout\ & (\vga|Timing_Circuit:vcount[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vga|Equal0~2_combout\,
	datac => \vga|Timing_Circuit:vcount[1]~q\,
	datad => \vga|Add0~2_combout\,
	combout => \vga|vcount~9_combout\);

-- Location: FF_X52_Y32_N1
\vga|Timing_Circuit:vcount[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|vcount~9_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:vcount[1]~q\);

-- Location: LCCOMB_X52_Y34_N4
\vga|Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add0~4_combout\ = (\vga|Timing_Circuit:vcount[2]~q\ & (\vga|Add0~3\ $ (GND))) # (!\vga|Timing_Circuit:vcount[2]~q\ & (!\vga|Add0~3\ & VCC))
-- \vga|Add0~5\ = CARRY((\vga|Timing_Circuit:vcount[2]~q\ & !\vga|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:vcount[2]~q\,
	datad => VCC,
	cin => \vga|Add0~3\,
	combout => \vga|Add0~4_combout\,
	cout => \vga|Add0~5\);

-- Location: LCCOMB_X52_Y32_N6
\vga|vcount~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|vcount~8_combout\ = (\vga|Add0~4_combout\ & ((\vga|vcount~4_combout\) # ((\vga|Timing_Circuit:vcount[2]~q\ & !\vga|Equal0~2_combout\)))) # (!\vga|Add0~4_combout\ & (((\vga|Timing_Circuit:vcount[2]~q\ & !\vga|Equal0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Add0~4_combout\,
	datab => \vga|vcount~4_combout\,
	datac => \vga|Timing_Circuit:vcount[2]~q\,
	datad => \vga|Equal0~2_combout\,
	combout => \vga|vcount~8_combout\);

-- Location: FF_X52_Y32_N7
\vga|Timing_Circuit:vcount[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|vcount~8_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:vcount[2]~q\);

-- Location: LCCOMB_X52_Y34_N6
\vga|Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add0~6_combout\ = (\vga|Timing_Circuit:vcount[3]~q\ & (!\vga|Add0~5\)) # (!\vga|Timing_Circuit:vcount[3]~q\ & ((\vga|Add0~5\) # (GND)))
-- \vga|Add0~7\ = CARRY((!\vga|Add0~5\) # (!\vga|Timing_Circuit:vcount[3]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:vcount[3]~q\,
	datad => VCC,
	cin => \vga|Add0~5\,
	combout => \vga|Add0~6_combout\,
	cout => \vga|Add0~7\);

-- Location: LCCOMB_X52_Y32_N10
\vga|vcount~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|vcount~7_combout\ = (\vga|Add0~6_combout\ & ((\vga|vcount~4_combout\) # ((\vga|Timing_Circuit:vcount[3]~q\ & !\vga|Equal0~2_combout\)))) # (!\vga|Add0~6_combout\ & (((\vga|Timing_Circuit:vcount[3]~q\ & !\vga|Equal0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Add0~6_combout\,
	datab => \vga|vcount~4_combout\,
	datac => \vga|Timing_Circuit:vcount[3]~q\,
	datad => \vga|Equal0~2_combout\,
	combout => \vga|vcount~7_combout\);

-- Location: FF_X52_Y32_N11
\vga|Timing_Circuit:vcount[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|vcount~7_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:vcount[3]~q\);

-- Location: LCCOMB_X52_Y34_N8
\vga|Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add0~8_combout\ = (\vga|Timing_Circuit:vcount[4]~q\ & (\vga|Add0~7\ $ (GND))) # (!\vga|Timing_Circuit:vcount[4]~q\ & (!\vga|Add0~7\ & VCC))
-- \vga|Add0~9\ = CARRY((\vga|Timing_Circuit:vcount[4]~q\ & !\vga|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:vcount[4]~q\,
	datad => VCC,
	cin => \vga|Add0~7\,
	combout => \vga|Add0~8_combout\,
	cout => \vga|Add0~9\);

-- Location: LCCOMB_X52_Y32_N8
\vga|vcount~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|vcount~6_combout\ = (\vga|Equal0~2_combout\ & ((\vga|Add0~8_combout\))) # (!\vga|Equal0~2_combout\ & (\vga|Timing_Circuit:vcount[4]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vga|Equal0~2_combout\,
	datac => \vga|Timing_Circuit:vcount[4]~q\,
	datad => \vga|Add0~8_combout\,
	combout => \vga|vcount~6_combout\);

-- Location: FF_X52_Y32_N9
\vga|Timing_Circuit:vcount[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|vcount~6_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:vcount[4]~q\);

-- Location: LCCOMB_X52_Y34_N10
\vga|Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add0~10_combout\ = (\vga|Timing_Circuit:vcount[5]~q\ & (!\vga|Add0~9\)) # (!\vga|Timing_Circuit:vcount[5]~q\ & ((\vga|Add0~9\) # (GND)))
-- \vga|Add0~11\ = CARRY((!\vga|Add0~9\) # (!\vga|Timing_Circuit:vcount[5]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \vga|Timing_Circuit:vcount[5]~q\,
	datad => VCC,
	cin => \vga|Add0~9\,
	combout => \vga|Add0~10_combout\,
	cout => \vga|Add0~11\);

-- Location: LCCOMB_X52_Y32_N20
\vga|vcount~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|vcount~3_combout\ = (\vga|Equal0~2_combout\ & ((\vga|Add0~10_combout\))) # (!\vga|Equal0~2_combout\ & (\vga|Timing_Circuit:vcount[5]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vga|Equal0~2_combout\,
	datac => \vga|Timing_Circuit:vcount[5]~q\,
	datad => \vga|Add0~10_combout\,
	combout => \vga|vcount~3_combout\);

-- Location: FF_X52_Y32_N21
\vga|Timing_Circuit:vcount[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|vcount~3_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:vcount[5]~q\);

-- Location: LCCOMB_X52_Y34_N12
\vga|Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add0~12_combout\ = (\vga|Timing_Circuit:vcount[6]~q\ & (\vga|Add0~11\ $ (GND))) # (!\vga|Timing_Circuit:vcount[6]~q\ & (!\vga|Add0~11\ & VCC))
-- \vga|Add0~13\ = CARRY((\vga|Timing_Circuit:vcount[6]~q\ & !\vga|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:vcount[6]~q\,
	datad => VCC,
	cin => \vga|Add0~11\,
	combout => \vga|Add0~12_combout\,
	cout => \vga|Add0~13\);

-- Location: LCCOMB_X52_Y34_N30
\vga|vcount~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|vcount~1_combout\ = (\vga|Equal0~2_combout\ & ((\vga|Add0~12_combout\))) # (!\vga|Equal0~2_combout\ & (\vga|Timing_Circuit:vcount[6]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Equal0~2_combout\,
	datac => \vga|Timing_Circuit:vcount[6]~q\,
	datad => \vga|Add0~12_combout\,
	combout => \vga|vcount~1_combout\);

-- Location: FF_X52_Y34_N31
\vga|Timing_Circuit:vcount[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|vcount~1_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:vcount[6]~q\);

-- Location: LCCOMB_X52_Y34_N14
\vga|Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add0~14_combout\ = (\vga|Timing_Circuit:vcount[7]~q\ & (!\vga|Add0~13\)) # (!\vga|Timing_Circuit:vcount[7]~q\ & ((\vga|Add0~13\) # (GND)))
-- \vga|Add0~15\ = CARRY((!\vga|Add0~13\) # (!\vga|Timing_Circuit:vcount[7]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \vga|Timing_Circuit:vcount[7]~q\,
	datad => VCC,
	cin => \vga|Add0~13\,
	combout => \vga|Add0~14_combout\,
	cout => \vga|Add0~15\);

-- Location: LCCOMB_X52_Y34_N24
\vga|vcount~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|vcount~2_combout\ = (\vga|Equal0~2_combout\ & (\vga|Add0~14_combout\)) # (!\vga|Equal0~2_combout\ & ((\vga|Timing_Circuit:vcount[7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Equal0~2_combout\,
	datab => \vga|Add0~14_combout\,
	datac => \vga|Timing_Circuit:vcount[7]~q\,
	combout => \vga|vcount~2_combout\);

-- Location: FF_X52_Y34_N25
\vga|Timing_Circuit:vcount[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|vcount~2_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:vcount[7]~q\);

-- Location: LCCOMB_X52_Y34_N16
\vga|Add0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add0~16_combout\ = (\vga|Timing_Circuit:vcount[8]~q\ & (\vga|Add0~15\ $ (GND))) # (!\vga|Timing_Circuit:vcount[8]~q\ & (!\vga|Add0~15\ & VCC))
-- \vga|Add0~17\ = CARRY((\vga|Timing_Circuit:vcount[8]~q\ & !\vga|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \vga|Timing_Circuit:vcount[8]~q\,
	datad => VCC,
	cin => \vga|Add0~15\,
	combout => \vga|Add0~16_combout\,
	cout => \vga|Add0~17\);

-- Location: LCCOMB_X52_Y34_N28
\vga|vcount~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|vcount~0_combout\ = (\vga|Equal0~2_combout\ & ((\vga|Add0~16_combout\))) # (!\vga|Equal0~2_combout\ & (\vga|Timing_Circuit:vcount[8]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Equal0~2_combout\,
	datac => \vga|Timing_Circuit:vcount[8]~q\,
	datad => \vga|Add0~16_combout\,
	combout => \vga|vcount~0_combout\);

-- Location: FF_X52_Y34_N29
\vga|Timing_Circuit:vcount[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|vcount~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:vcount[8]~q\);

-- Location: LCCOMB_X52_Y34_N18
\vga|Add0~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Add0~18_combout\ = \vga|Timing_Circuit:vcount[9]~q\ $ (\vga|Add0~17\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \vga|Timing_Circuit:vcount[9]~q\,
	cin => \vga|Add0~17\,
	combout => \vga|Add0~18_combout\);

-- Location: LCCOMB_X52_Y32_N30
\vga|vcount~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|vcount~5_combout\ = (\vga|Add0~18_combout\ & ((\vga|vcount~4_combout\) # ((\vga|Timing_Circuit:vcount[9]~q\ & !\vga|Equal0~2_combout\)))) # (!\vga|Add0~18_combout\ & (((\vga|Timing_Circuit:vcount[9]~q\ & !\vga|Equal0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Add0~18_combout\,
	datab => \vga|vcount~4_combout\,
	datac => \vga|Timing_Circuit:vcount[9]~q\,
	datad => \vga|Equal0~2_combout\,
	combout => \vga|vcount~5_combout\);

-- Location: FF_X52_Y32_N31
\vga|Timing_Circuit:vcount[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|vcount~5_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Timing_Circuit:vcount[9]~q\);

-- Location: LCCOMB_X50_Y35_N24
\vga|Timing_Circuit~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~17_combout\ = (\vga|Timing_Circuit:vcount[9]~q\) # ((\vga|Timing_Circuit:hcount[9]~q\ & ((\vga|Timing_Circuit:hcount[8]~q\) # (\vga|Timing_Circuit:hcount[7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:hcount[9]~q\,
	datab => \vga|Timing_Circuit:hcount[8]~q\,
	datac => \vga|Timing_Circuit:vcount[9]~q\,
	datad => \vga|Timing_Circuit:hcount[7]~q\,
	combout => \vga|Timing_Circuit~17_combout\);

-- Location: LCCOMB_X52_Y34_N26
\vga|LessThan3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|LessThan3~0_combout\ = (\vga|Timing_Circuit:vcount[6]~q\ & (\vga|Timing_Circuit:vcount[7]~q\ & (\vga|Timing_Circuit:vcount[5]~q\ & \vga|Timing_Circuit:vcount[8]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit:vcount[6]~q\,
	datab => \vga|Timing_Circuit:vcount[7]~q\,
	datac => \vga|Timing_Circuit:vcount[5]~q\,
	datad => \vga|Timing_Circuit:vcount[8]~q\,
	combout => \vga|LessThan3~0_combout\);

-- Location: LCCOMB_X54_Y33_N30
\vga|Timing_Circuit~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~18_combout\ = (!\vga|Timing_Circuit~17_combout\ & !\vga|LessThan3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit~17_combout\,
	datad => \vga|LessThan3~0_combout\,
	combout => \vga|Timing_Circuit~18_combout\);

-- Location: FF_X54_Y33_N31
\vga|b1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|Timing_Circuit~18_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|b1~q\);

-- Location: LCCOMB_X54_Y33_N16
\vga|b2~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|b2~feeder_combout\ = \vga|b1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \vga|b1~q\,
	combout => \vga|b2~feeder_combout\);

-- Location: FF_X54_Y33_N17
\vga|b2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|b2~feeder_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|b2~q\);

-- Location: FF_X51_Y31_N11
\vga|blank\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \vga|b2~q\,
	sload => VCC,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|blank~q\);

-- Location: LCCOMB_X54_Y33_N18
\vga|X[9]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|X[9]~0_combout\ = (\KEY[0]~input_o\ & (!\vga|Timing_Circuit~17_combout\ & !\vga|LessThan3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datac => \vga|Timing_Circuit~17_combout\,
	datad => \vga|LessThan3~0_combout\,
	combout => \vga|X[9]~0_combout\);

-- Location: FF_X54_Y31_N1
\vga|Y[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \vga|Timing_Circuit:vcount[6]~q\,
	sload => VCC,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Y\(6));

-- Location: FF_X54_Y32_N3
\vga|Y[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \vga|Timing_Circuit:vcount[4]~q\,
	sload => VCC,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Y\(4));

-- Location: FF_X54_Y32_N13
\vga|Y[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \vga|Timing_Circuit:vcount[3]~q\,
	sload => VCC,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Y\(3));

-- Location: FF_X54_Y32_N25
\vga|Y[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \vga|Timing_Circuit:vcount[5]~q\,
	sload => VCC,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Y\(5));

-- Location: LCCOMB_X54_Y32_N12
\vga|Timing_Circuit~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~8_combout\ = (\vga|Y\(5) & ((\vga|Y\(4)) # (\vga|Y\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vga|Y\(4),
	datac => \vga|Y\(3),
	datad => \vga|Y\(5),
	combout => \vga|Timing_Circuit~8_combout\);

-- Location: FF_X54_Y31_N7
\vga|Y[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \vga|Timing_Circuit:vcount[8]~q\,
	sload => VCC,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Y\(8));

-- Location: FF_X54_Y31_N3
\vga|Y[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \vga|Timing_Circuit:vcount[7]~q\,
	sload => VCC,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Y\(7));

-- Location: LCCOMB_X54_Y31_N6
\vga|Timing_Circuit~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~9_combout\ = (!\vga|Y\(8) & (!\vga|Y\(7) & ((!\vga|Timing_Circuit~8_combout\) # (!\vga|Y\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Y\(6),
	datab => \vga|Timing_Circuit~8_combout\,
	datac => \vga|Y\(8),
	datad => \vga|Y\(7),
	combout => \vga|Timing_Circuit~9_combout\);

-- Location: LCCOMB_X54_Y31_N2
\vga|Timing_Circuit~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~3_combout\ = (!\vga|Y\(6) & !\vga|Y\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Y\(6),
	datac => \vga|Y\(7),
	combout => \vga|Timing_Circuit~3_combout\);

-- Location: LCCOMB_X54_Y32_N2
\vga|LessThan22~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|LessThan22~0_combout\ = (\vga|Y\(8) & (((\vga|Y\(5) & \vga|Y\(4))) # (!\vga|Timing_Circuit~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Y\(8),
	datab => \vga|Y\(5),
	datac => \vga|Y\(4),
	datad => \vga|Timing_Circuit~3_combout\,
	combout => \vga|LessThan22~0_combout\);

-- Location: FF_X54_Y32_N15
\vga|X[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \vga|Timing_Circuit:hcount[5]~q\,
	sload => VCC,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|X\(5));

-- Location: FF_X54_Y32_N23
\vga|X[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \vga|Timing_Circuit:hcount[7]~q\,
	sload => VCC,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|X\(7));

-- Location: FF_X54_Y32_N11
\vga|X[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \vga|Timing_Circuit:hcount[6]~q\,
	sload => VCC,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|X\(6));

-- Location: FF_X54_Y32_N5
\vga|X[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \vga|Timing_Circuit:hcount[8]~q\,
	sload => VCC,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|X\(8));

-- Location: LCCOMB_X54_Y32_N10
\vga|LessThan17~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|LessThan17~0_combout\ = (\vga|X\(7)) # ((\vga|X\(8)) # ((\vga|X\(5) & \vga|X\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|X\(5),
	datab => \vga|X\(7),
	datac => \vga|X\(6),
	datad => \vga|X\(8),
	combout => \vga|LessThan17~0_combout\);

-- Location: FF_X54_Y32_N1
\vga|X[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \vga|Timing_Circuit:hcount[4]~q\,
	sload => VCC,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|X\(4));

-- Location: LCCOMB_X54_Y32_N14
\vga|Timing_Circuit~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~6_combout\ = (\vga|X\(8) & (\vga|X\(7) & ((\vga|X\(4)) # (\vga|X\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|X\(8),
	datab => \vga|X\(4),
	datac => \vga|X\(5),
	datad => \vga|X\(7),
	combout => \vga|Timing_Circuit~6_combout\);

-- Location: FF_X54_Y32_N9
\vga|X[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \vga|Timing_Circuit:hcount[9]~q\,
	sload => VCC,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|X\(9));

-- Location: LCCOMB_X54_Y32_N8
\vga|Timing_Circuit~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~7_combout\ = (\vga|X\(9) & (!\vga|LessThan17~0_combout\)) # (!\vga|X\(9) & (((\vga|Timing_Circuit~6_combout\ & \vga|X\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|LessThan17~0_combout\,
	datab => \vga|Timing_Circuit~6_combout\,
	datac => \vga|X\(9),
	datad => \vga|X\(6),
	combout => \vga|Timing_Circuit~7_combout\);

-- Location: LCCOMB_X54_Y31_N28
\vga|Timing_Circuit~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~10_combout\ = (!\vga|Timing_Circuit~9_combout\ & (!\vga|LessThan22~0_combout\ & \vga|Timing_Circuit~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit~9_combout\,
	datac => \vga|LessThan22~0_combout\,
	datad => \vga|Timing_Circuit~7_combout\,
	combout => \vga|Timing_Circuit~10_combout\);

-- Location: LCCOMB_X54_Y32_N24
\vga|Timing_Circuit~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~2_combout\ = (\vga|Y\(8)) # (\vga|Y\(5) $ (((!\vga|Y\(4) & !\vga|Y\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Y\(8),
	datab => \vga|Y\(4),
	datac => \vga|Y\(5),
	datad => \vga|Y\(3),
	combout => \vga|Timing_Circuit~2_combout\);

-- Location: LCCOMB_X54_Y31_N0
\vga|Timing_Circuit~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~11_combout\ = (\vga|Y\(8)) # ((\vga|Y\(7)) # (\vga|Timing_Circuit~8_combout\ $ (!\vga|Y\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit~8_combout\,
	datab => \vga|Y\(8),
	datac => \vga|Y\(6),
	datad => \vga|Y\(7),
	combout => \vga|Timing_Circuit~11_combout\);

-- Location: LCCOMB_X54_Y31_N30
\vga|r[0]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|r[0]~13_combout\ = (\vga|Timing_Circuit~11_combout\ & ((\vga|Timing_Circuit~2_combout\) # ((\vga|Y\(6)) # (\vga|Y\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit~2_combout\,
	datab => \vga|Timing_Circuit~11_combout\,
	datac => \vga|Y\(6),
	datad => \vga|Y\(7),
	combout => \vga|r[0]~13_combout\);

-- Location: LCCOMB_X54_Y32_N26
\vga|LessThan21~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|LessThan21~0_combout\ = ((\vga|Y\(5)) # ((\vga|Y\(4)) # (\vga|Y\(3)))) # (!\vga|Timing_Circuit~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit~3_combout\,
	datab => \vga|Y\(5),
	datac => \vga|Y\(4),
	datad => \vga|Y\(3),
	combout => \vga|LessThan21~0_combout\);

-- Location: LCCOMB_X54_Y32_N4
\vga|LessThan19~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|LessThan19~0_combout\ = (\vga|X\(6)) # ((\vga|X\(7)) # ((\vga|X\(8)) # (\vga|X\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|X\(6),
	datab => \vga|X\(7),
	datac => \vga|X\(8),
	datad => \vga|X\(9),
	combout => \vga|LessThan19~0_combout\);

-- Location: LCCOMB_X54_Y32_N16
\vga|Timing_Circuit~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~4_combout\ = (!\vga|LessThan22~0_combout\ & ((\vga|LessThan19~0_combout\) # (\vga|X\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vga|LessThan22~0_combout\,
	datac => \vga|LessThan19~0_combout\,
	datad => \vga|X\(5),
	combout => \vga|Timing_Circuit~4_combout\);

-- Location: LCCOMB_X54_Y32_N28
\vga|LessThan17~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|LessThan17~1_combout\ = (\vga|X\(9) & \vga|LessThan17~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \vga|X\(9),
	datad => \vga|LessThan17~0_combout\,
	combout => \vga|LessThan17~1_combout\);

-- Location: LCCOMB_X54_Y32_N6
\vga|Timing_Circuit~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~5_combout\ = (\vga|Timing_Circuit~4_combout\ & (!\vga|LessThan17~1_combout\ & ((\vga|LessThan21~0_combout\) # (\vga|Y\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|LessThan21~0_combout\,
	datab => \vga|Timing_Circuit~4_combout\,
	datac => \vga|Y\(8),
	datad => \vga|LessThan17~1_combout\,
	combout => \vga|Timing_Circuit~5_combout\);

-- Location: LCCOMB_X54_Y33_N28
\vga|X[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|X[1]~feeder_combout\ = \vga|Timing_Circuit:hcount[1]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \vga|Timing_Circuit:hcount[1]~q\,
	combout => \vga|X[1]~feeder_combout\);

-- Location: FF_X54_Y33_N29
\vga|X[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|X[1]~feeder_combout\,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|X\(1));

-- Location: LCCOMB_X54_Y33_N4
\vga|FX1[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|FX1[1]~feeder_combout\ = \vga|X\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vga|X\(1),
	combout => \vga|FX1[1]~feeder_combout\);

-- Location: FF_X54_Y33_N5
\vga|FX1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|FX1[1]~feeder_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|FX1\(1));

-- Location: FF_X54_Y33_N11
\vga|FX2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \vga|FX1\(1),
	sload => VCC,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|FX2\(1));

-- Location: LCCOMB_X54_Y33_N0
\vga|Y[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Y[0]~feeder_combout\ = \vga|Timing_Circuit:vcount[0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vga|Timing_Circuit:vcount[0]~q\,
	combout => \vga|Y[0]~feeder_combout\);

-- Location: FF_X54_Y33_N1
\vga|Y[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|Y[0]~feeder_combout\,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Y\(0));

-- Location: LCCOMB_X54_Y33_N12
\vga|FY[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|FY[0]~feeder_combout\ = \vga|Y\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vga|Y\(0),
	combout => \vga|FY[0]~feeder_combout\);

-- Location: FF_X54_Y33_N13
\vga|FY[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|FY[0]~feeder_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|FY\(0));

-- Location: LCCOMB_X52_Y33_N24
\vga|Y[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Y[1]~feeder_combout\ = \vga|Timing_Circuit:vcount[1]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vga|Timing_Circuit:vcount[1]~q\,
	combout => \vga|Y[1]~feeder_combout\);

-- Location: FF_X52_Y33_N25
\vga|Y[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|Y[1]~feeder_combout\,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Y\(1));

-- Location: LCCOMB_X54_Y33_N22
\vga|FY[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|FY[1]~feeder_combout\ = \vga|Y\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vga|Y\(1),
	combout => \vga|FY[1]~feeder_combout\);

-- Location: FF_X54_Y33_N23
\vga|FY[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|FY[1]~feeder_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|FY\(1));

-- Location: LCCOMB_X52_Y33_N2
\vga|Y[2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Y[2]~feeder_combout\ = \vga|Timing_Circuit:vcount[2]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vga|Timing_Circuit:vcount[2]~q\,
	combout => \vga|Y[2]~feeder_combout\);

-- Location: FF_X52_Y33_N3
\vga|Y[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|Y[2]~feeder_combout\,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|Y\(2));

-- Location: LCCOMB_X54_Y33_N8
\vga|FY[2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|FY[2]~feeder_combout\ = \vga|Y\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \vga|Y\(2),
	combout => \vga|FY[2]~feeder_combout\);

-- Location: FF_X54_Y33_N9
\vga|FY[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|FY[2]~feeder_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|FY\(2));

-- Location: CLKCTRL_G19
\CLOCK_50~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: LCCOMB_X60_Y34_N10
\x[0]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \x[0]~7_combout\ = x(0) $ (VCC)
-- \x[0]~8\ = CARRY(x(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(0),
	datad => VCC,
	combout => \x[0]~7_combout\,
	cout => \x[0]~8\);

-- Location: LCCOMB_X54_Y34_N24
\x[0]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \x[0]~9_combout\ = (\Selector4~0_combout\) # ((\SV.clean1~q\ & !\SV.clean2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SV.clean1~q\,
	datac => \SV.clean2~q\,
	datad => \Selector4~0_combout\,
	combout => \x[0]~9_combout\);

-- Location: FF_X60_Y34_N11
\x[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \x[0]~7_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \SV.clean2~q\,
	ena => \x[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => x(0));

-- Location: LCCOMB_X60_Y34_N12
\x[1]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \x[1]~10_combout\ = (x(1) & (!\x[0]~8\)) # (!x(1) & ((\x[0]~8\) # (GND)))
-- \x[1]~11\ = CARRY((!\x[0]~8\) # (!x(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => x(1),
	datad => VCC,
	cin => \x[0]~8\,
	combout => \x[1]~10_combout\,
	cout => \x[1]~11\);

-- Location: FF_X60_Y34_N13
\x[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \x[1]~10_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \SV.clean2~q\,
	ena => \x[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => x(1));

-- Location: LCCOMB_X60_Y34_N14
\x[2]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \x[2]~12_combout\ = (x(2) & (\x[1]~11\ $ (GND))) # (!x(2) & (!\x[1]~11\ & VCC))
-- \x[2]~13\ = CARRY((x(2) & !\x[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => x(2),
	datad => VCC,
	cin => \x[1]~11\,
	combout => \x[2]~12_combout\,
	cout => \x[2]~13\);

-- Location: FF_X60_Y34_N15
\x[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \x[2]~12_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \SV.clean2~q\,
	ena => \x[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => x(2));

-- Location: LCCOMB_X60_Y34_N16
\x[3]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \x[3]~14_combout\ = (x(3) & (!\x[2]~13\)) # (!x(3) & ((\x[2]~13\) # (GND)))
-- \x[3]~15\ = CARRY((!\x[2]~13\) # (!x(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => x(3),
	datad => VCC,
	cin => \x[2]~13\,
	combout => \x[3]~14_combout\,
	cout => \x[3]~15\);

-- Location: FF_X60_Y34_N17
\x[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \x[3]~14_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \SV.clean2~q\,
	ena => \x[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => x(3));

-- Location: LCCOMB_X60_Y34_N18
\x[4]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \x[4]~16_combout\ = (x(4) & (\x[3]~15\ $ (GND))) # (!x(4) & (!\x[3]~15\ & VCC))
-- \x[4]~17\ = CARRY((x(4) & !\x[3]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => x(4),
	datad => VCC,
	cin => \x[3]~15\,
	combout => \x[4]~16_combout\,
	cout => \x[4]~17\);

-- Location: FF_X60_Y34_N19
\x[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \x[4]~16_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \SV.clean2~q\,
	ena => \x[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => x(4));

-- Location: LCCOMB_X60_Y34_N20
\x[5]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \x[5]~18_combout\ = (x(5) & (!\x[4]~17\)) # (!x(5) & ((\x[4]~17\) # (GND)))
-- \x[5]~19\ = CARRY((!\x[4]~17\) # (!x(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => x(5),
	datad => VCC,
	cin => \x[4]~17\,
	combout => \x[5]~18_combout\,
	cout => \x[5]~19\);

-- Location: FF_X60_Y34_N21
\x[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \x[5]~18_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \SV.clean2~q\,
	ena => \x[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => x(5));

-- Location: LCCOMB_X60_Y34_N22
\x[6]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \x[6]~20_combout\ = x(6) $ (!\x[5]~19\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => x(6),
	cin => \x[5]~19\,
	combout => \x[6]~20_combout\);

-- Location: FF_X60_Y34_N23
\x[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \x[6]~20_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \SV.clean2~q\,
	ena => \x[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => x(6));

-- Location: LCCOMB_X54_Y34_N22
\Selector4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\SV.clean2~q\ & (x(6) & ((x(5)) # (x(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(5),
	datab => \SV.clean2~q\,
	datac => x(4),
	datad => x(6),
	combout => \Selector4~0_combout\);

-- Location: FF_X54_Y34_N23
\SV.clean3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Selector4~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SV.clean3~q\);

-- Location: LCCOMB_X59_Y32_N0
\y[0]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \y[0]~5_combout\ = y(0) $ (\Selector4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => y(0),
	datad => \Selector4~0_combout\,
	combout => \y[0]~5_combout\);

-- Location: FF_X59_Y32_N1
\y[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \y[0]~5_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => y(0));

-- Location: LCCOMB_X59_Y32_N20
\y[1]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \y[1]~6_combout\ = (y(1) & (y(0) $ (VCC))) # (!y(1) & (y(0) & VCC))
-- \y[1]~7\ = CARRY((y(1) & y(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => y(1),
	datab => y(0),
	datad => VCC,
	combout => \y[1]~6_combout\,
	cout => \y[1]~7\);

-- Location: FF_X59_Y32_N21
\y[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \y[1]~6_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => y(1));

-- Location: LCCOMB_X59_Y32_N22
\y[2]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \y[2]~8_combout\ = (y(2) & (!\y[1]~7\)) # (!y(2) & ((\y[1]~7\) # (GND)))
-- \y[2]~9\ = CARRY((!\y[1]~7\) # (!y(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => y(2),
	datad => VCC,
	cin => \y[1]~7\,
	combout => \y[2]~8_combout\,
	cout => \y[2]~9\);

-- Location: FF_X59_Y32_N23
\y[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \y[2]~8_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => y(2));

-- Location: LCCOMB_X59_Y32_N24
\y[3]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \y[3]~10_combout\ = (y(3) & (\y[2]~9\ $ (GND))) # (!y(3) & (!\y[2]~9\ & VCC))
-- \y[3]~11\ = CARRY((y(3) & !\y[2]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => y(3),
	datad => VCC,
	cin => \y[2]~9\,
	combout => \y[3]~10_combout\,
	cout => \y[3]~11\);

-- Location: FF_X59_Y32_N25
\y[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \y[3]~10_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => y(3));

-- Location: LCCOMB_X59_Y32_N26
\y[4]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \y[4]~12_combout\ = (y(4) & (!\y[3]~11\)) # (!y(4) & ((\y[3]~11\) # (GND)))
-- \y[4]~13\ = CARRY((!\y[3]~11\) # (!y(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => y(4),
	datad => VCC,
	cin => \y[3]~11\,
	combout => \y[4]~12_combout\,
	cout => \y[4]~13\);

-- Location: FF_X59_Y32_N27
\y[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \y[4]~12_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => y(4));

-- Location: LCCOMB_X59_Y32_N28
\y[5]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \y[5]~14_combout\ = \y[4]~13\ $ (!y(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => y(5),
	cin => \y[4]~13\,
	combout => \y[5]~14_combout\);

-- Location: FF_X59_Y32_N29
\y[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \y[5]~14_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => y(5));

-- Location: LCCOMB_X59_Y34_N22
\Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (((!y(3)) # (!y(5))) # (!y(4))) # (!y(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => y(2),
	datab => y(4),
	datac => y(5),
	datad => y(3),
	combout => \Selector1~0_combout\);

-- Location: LCCOMB_X54_Y34_N18
\x[0]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \x[0]~22_combout\ = (\SV.clean2~q\ & (((!x(5) & !x(4))) # (!x(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(5),
	datab => \SV.clean2~q\,
	datac => x(4),
	datad => x(6),
	combout => \x[0]~22_combout\);

-- Location: LCCOMB_X54_Y34_N2
\Selector1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = (!\x[0]~22_combout\ & ((!\Selector1~0_combout\) # (!\SV.clean3~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SV.clean3~q\,
	datac => \Selector1~0_combout\,
	datad => \x[0]~22_combout\,
	combout => \Selector1~1_combout\);

-- Location: FF_X54_Y34_N3
\SV.clean0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Selector1~1_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SV.clean0~q\);

-- Location: LCCOMB_X54_Y34_N8
\SV.clean1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SV.clean1~0_combout\ = !\SV.clean0~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SV.clean0~q\,
	combout => \SV.clean1~0_combout\);

-- Location: FF_X54_Y34_N9
\SV.clean1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \SV.clean1~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SV.clean1~q\);

-- Location: FF_X54_Y34_N25
\SV.clean2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SV.clean1~q\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SV.clean2~q\);

-- Location: LCCOMB_X54_Y34_N16
\Selector0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = ((!\SV.clean2~q\ & \mem_wr~q\)) # (!\SV.clean0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SV.clean2~q\,
	datac => \mem_wr~q\,
	datad => \SV.clean0~q\,
	combout => \Selector0~0_combout\);

-- Location: FF_X54_Y34_N17
mem_wr : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Selector0~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem_wr~q\);

-- Location: LCCOMB_X46_Y35_N16
\~GND\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X52_Y33_N20
\vga|X[3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|X[3]~feeder_combout\ = \vga|Timing_Circuit:hcount[3]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vga|Timing_Circuit:hcount[3]~q\,
	combout => \vga|X[3]~feeder_combout\);

-- Location: FF_X52_Y33_N21
\vga|X[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|X[3]~feeder_combout\,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|X\(3));

-- Location: LCCOMB_X58_Y33_N16
\Equal18~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal18~2_combout\ = (x(2) & x(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => x(2),
	datad => x(3),
	combout => \Equal18~2_combout\);

-- Location: LCCOMB_X59_Y33_N2
\Equal19~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal19~2_combout\ = (!x(3) & !x(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => x(3),
	datad => x(2),
	combout => \Equal19~2_combout\);

-- Location: LCCOMB_X57_Y32_N0
\Equal23~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal23~1_combout\ = (!x(5) & !x(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => x(5),
	datad => x(4),
	combout => \Equal23~1_combout\);

-- Location: LCCOMB_X59_Y33_N12
\screen_test~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~17_combout\ = (\Equal23~1_combout\ & ((x(6) & (!\Equal18~2_combout\)) # (!x(6) & ((!\Equal19~2_combout\))))) # (!\Equal23~1_combout\ & (((!x(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal18~2_combout\,
	datab => \Equal19~2_combout\,
	datac => \Equal23~1_combout\,
	datad => x(6),
	combout => \screen_test~17_combout\);

-- Location: LCCOMB_X59_Y34_N8
\screen_test~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~18_combout\ = ((!y(4) & !y(3))) # (!y(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => y(5),
	datab => y(4),
	datad => y(3),
	combout => \screen_test~18_combout\);

-- Location: LCCOMB_X59_Y34_N2
\LessThan3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = (y(1) & (y(5) & (y(0) & y(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => y(1),
	datab => y(5),
	datac => y(0),
	datad => y(2),
	combout => \LessThan3~0_combout\);

-- Location: LCCOMB_X59_Y32_N2
\Equal24~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal24~4_combout\ = (!y(4) & (!y(2) & !y(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => y(4),
	datac => y(2),
	datad => y(3),
	combout => \Equal24~4_combout\);

-- Location: LCCOMB_X59_Y34_N18
\Equal16~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal16~0_combout\ = (!y(0) & !y(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => y(0),
	datad => y(1),
	combout => \Equal16~0_combout\);

-- Location: LCCOMB_X59_Y34_N4
\screen_test~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~19_combout\ = (!\LessThan3~0_combout\ & ((y(5)) # ((!\Equal16~0_combout\) # (!\Equal24~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => y(5),
	datab => \LessThan3~0_combout\,
	datac => \Equal24~4_combout\,
	datad => \Equal16~0_combout\,
	combout => \screen_test~19_combout\);

-- Location: LCCOMB_X59_Y32_N30
\screen_test~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~8_combout\ = (y(0) & ((y(2) & (!y(5))) # (!y(2) & ((!y(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => y(5),
	datab => y(3),
	datac => y(2),
	datad => y(0),
	combout => \screen_test~8_combout\);

-- Location: LCCOMB_X59_Y32_N10
\Equal20~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal20~0_combout\ = (y(1) & (!y(5) & y(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => y(1),
	datab => y(5),
	datac => y(4),
	combout => \Equal20~0_combout\);

-- Location: LCCOMB_X59_Y32_N4
\screen_test~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~7_combout\ = (\Equal20~0_combout\ & (!y(3) & (y(2) $ (!y(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal20~0_combout\,
	datab => y(3),
	datac => y(2),
	datad => y(0),
	combout => \screen_test~7_combout\);

-- Location: LCCOMB_X59_Y32_N8
\screen_test~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~9_combout\ = (\screen_test~7_combout\) # ((\screen_test~8_combout\ & (!y(4) & !y(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~8_combout\,
	datab => \screen_test~7_combout\,
	datac => y(4),
	datad => y(1),
	combout => \screen_test~9_combout\);

-- Location: LCCOMB_X57_Y36_N16
\Equal21~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal21~2_combout\ = (x(0) & x(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => x(0),
	datad => x(1),
	combout => \Equal21~2_combout\);

-- Location: LCCOMB_X57_Y36_N10
\screen_test~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~10_combout\ = (x(3) & (!x(2) & (x(6) & \Equal21~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(3),
	datab => x(2),
	datac => x(6),
	datad => \Equal21~2_combout\,
	combout => \screen_test~10_combout\);

-- Location: LCCOMB_X59_Y33_N20
\Mux26~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux26~0_combout\ = (!x(1) & !x(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => x(1),
	datad => x(0),
	combout => \Mux26~0_combout\);

-- Location: LCCOMB_X59_Y33_N6
\screen_test~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~11_combout\ = (!x(6) & (\Mux26~0_combout\ & (!x(3) & x(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(6),
	datab => \Mux26~0_combout\,
	datac => x(3),
	datad => x(2),
	combout => \screen_test~11_combout\);

-- Location: LCCOMB_X59_Y33_N0
\screen_test~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~12_combout\ = (\screen_test~9_combout\) # ((\Equal23~1_combout\ & ((\screen_test~10_combout\) # (\screen_test~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~9_combout\,
	datab => \screen_test~10_combout\,
	datac => \Equal23~1_combout\,
	datad => \screen_test~11_combout\,
	combout => \screen_test~12_combout\);

-- Location: LCCOMB_X59_Y34_N0
\screen_test~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~1_combout\ = (y(5) & ((y(3)) # ((y(1))))) # (!y(5) & (y(3) & ((y(0)) # (y(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => y(5),
	datab => y(3),
	datac => y(0),
	datad => y(1),
	combout => \screen_test~1_combout\);

-- Location: LCCOMB_X59_Y34_N10
\screen_test~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~2_combout\ = (y(5) & (!\screen_test~1_combout\ & (!y(4) & !y(2)))) # (!y(5) & ((y(4)) # ((\screen_test~1_combout\ & y(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => y(5),
	datab => \screen_test~1_combout\,
	datac => y(4),
	datad => y(2),
	combout => \screen_test~2_combout\);

-- Location: LCCOMB_X59_Y34_N28
\screen_test~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~13_combout\ = (\screen_test~2_combout\) # ((y(5) & ((!\Equal16~0_combout\) # (!\Equal24~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~2_combout\,
	datab => \Equal24~4_combout\,
	datac => y(5),
	datad => \Equal16~0_combout\,
	combout => \screen_test~13_combout\);

-- Location: LCCOMB_X57_Y32_N18
\screen_test~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~14_combout\ = (x(5) & (!x(6) & (x(4) $ (!x(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(4),
	datab => x(5),
	datac => x(1),
	datad => x(6),
	combout => \screen_test~14_combout\);

-- Location: LCCOMB_X57_Y32_N4
\screen_test~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~15_combout\ = (!x(0) & (\screen_test~14_combout\ & (x(3) & !x(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(0),
	datab => \screen_test~14_combout\,
	datac => x(3),
	datad => x(2),
	combout => \screen_test~15_combout\);

-- Location: LCCOMB_X59_Y33_N8
\Equal23~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal23~0_combout\ = (x(1) & !x(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => x(1),
	datad => x(0),
	combout => \Equal23~0_combout\);

-- Location: LCCOMB_X59_Y33_N10
\screen_test~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~3_combout\ = (x(4) & (\Equal23~0_combout\ & (!x(3) & x(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(4),
	datab => \Equal23~0_combout\,
	datac => x(3),
	datad => x(2),
	combout => \screen_test~3_combout\);

-- Location: LCCOMB_X60_Y34_N8
\screen_test~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~0_combout\ = (!x(6) & !x(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => x(6),
	datad => x(5),
	combout => \screen_test~0_combout\);

-- Location: LCCOMB_X59_Y34_N12
\screen_test~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~4_combout\ = (y(1) & (!y(4) & (y(5) & !y(3)))) # (!y(1) & (y(4) & (!y(5) & y(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => y(1),
	datab => y(4),
	datac => y(5),
	datad => y(3),
	combout => \screen_test~4_combout\);

-- Location: LCCOMB_X59_Y34_N30
\screen_test~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~5_combout\ = (y(2) & (!y(0) & \screen_test~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => y(2),
	datac => y(0),
	datad => \screen_test~4_combout\,
	combout => \screen_test~5_combout\);

-- Location: LCCOMB_X59_Y34_N24
\screen_test~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~6_combout\ = (\screen_test~5_combout\) # ((\screen_test~3_combout\ & (\screen_test~0_combout\ & \screen_test~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~3_combout\,
	datab => \screen_test~0_combout\,
	datac => \screen_test~5_combout\,
	datad => \screen_test~2_combout\,
	combout => \screen_test~6_combout\);

-- Location: LCCOMB_X59_Y34_N6
\screen_test~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~16_combout\ = (\screen_test~12_combout\) # ((\screen_test~6_combout\) # ((\screen_test~13_combout\ & \screen_test~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~12_combout\,
	datab => \screen_test~13_combout\,
	datac => \screen_test~15_combout\,
	datad => \screen_test~6_combout\,
	combout => \screen_test~16_combout\);

-- Location: LCCOMB_X59_Y34_N14
\screen_test~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~20_combout\ = (\screen_test~17_combout\ & (\screen_test~18_combout\ & (\screen_test~19_combout\ & \screen_test~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~17_combout\,
	datab => \screen_test~18_combout\,
	datac => \screen_test~19_combout\,
	datad => \screen_test~16_combout\,
	combout => \screen_test~20_combout\);

-- Location: LCCOMB_X57_Y34_N8
\screen_test~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~30_combout\ = ((!x(0) & (!x(2) & !x(1)))) # (!x(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(0),
	datab => x(2),
	datac => x(1),
	datad => x(3),
	combout => \screen_test~30_combout\);

-- Location: LCCOMB_X57_Y34_N10
\screen_test~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~31_combout\ = (\screen_test~30_combout\ & (!x(4) & x(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \screen_test~30_combout\,
	datac => x(4),
	datad => x(5),
	combout => \screen_test~31_combout\);

-- Location: LCCOMB_X58_Y32_N24
\Equal21~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal21~5_combout\ = (x(2) & (x(3) & !x(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(2),
	datab => x(3),
	datac => x(5),
	combout => \Equal21~5_combout\);

-- Location: LCCOMB_X57_Y34_N28
\Equal21~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal21~6_combout\ = (x(0) & (\Equal21~5_combout\ & (x(4) & x(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(0),
	datab => \Equal21~5_combout\,
	datac => x(4),
	datad => x(1),
	combout => \Equal21~6_combout\);

-- Location: LCCOMB_X59_Y32_N12
\Equal14~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal14~0_combout\ = (!y(4) & (!y(5) & (!y(2) & y(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => y(4),
	datab => y(5),
	datac => y(2),
	datad => y(3),
	combout => \Equal14~0_combout\);

-- Location: LCCOMB_X59_Y33_N26
\Equal14~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal14~1_combout\ = (\Equal14~0_combout\ & (!y(1) & !y(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal14~0_combout\,
	datac => y(1),
	datad => y(0),
	combout => \Equal14~1_combout\);

-- Location: LCCOMB_X57_Y34_N12
\screen_test~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~32_combout\ = (!x(6) & (\Equal14~1_combout\ & ((\screen_test~31_combout\) # (\Equal21~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~31_combout\,
	datab => \Equal21~6_combout\,
	datac => x(6),
	datad => \Equal14~1_combout\,
	combout => \screen_test~32_combout\);

-- Location: LCCOMB_X60_Y34_N2
\Equal21~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal21~3_combout\ = (x(0) & (!x(5) & (x(4) & x(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(0),
	datab => x(5),
	datac => x(4),
	datad => x(1),
	combout => \Equal21~3_combout\);

-- Location: LCCOMB_X61_Y34_N26
\Equal21~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal21~4_combout\ = (\Equal21~3_combout\ & (x(2) & (x(3) & !x(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal21~3_combout\,
	datab => x(2),
	datac => x(3),
	datad => x(6),
	combout => \Equal21~4_combout\);

-- Location: LCCOMB_X58_Y33_N26
\Equal18~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal18~3_combout\ = (!x(4) & (!x(6) & !x(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(4),
	datac => x(6),
	datad => x(5),
	combout => \Equal18~3_combout\);

-- Location: LCCOMB_X58_Y33_N4
\Equal18~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal18~4_combout\ = (\Equal18~3_combout\ & (\Equal18~2_combout\ & (!x(1) & x(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal18~3_combout\,
	datab => \Equal18~2_combout\,
	datac => x(1),
	datad => x(0),
	combout => \Equal18~4_combout\);

-- Location: LCCOMB_X59_Y32_N6
\Equal20~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal20~1_combout\ = (\Equal20~0_combout\ & (y(3) & (!y(2) & !y(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal20~0_combout\,
	datab => y(3),
	datac => y(2),
	datad => y(0),
	combout => \Equal20~1_combout\);

-- Location: LCCOMB_X59_Y34_N16
\Equal17~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal17~0_combout\ = (!y(5) & (y(4) & (y(0) & y(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => y(5),
	datab => y(4),
	datac => y(0),
	datad => y(2),
	combout => \Equal17~0_combout\);

-- Location: LCCOMB_X61_Y34_N0
\Equal17~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal17~1_combout\ = (!y(1) & (!y(3) & \Equal17~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => y(1),
	datac => y(3),
	datad => \Equal17~0_combout\,
	combout => \Equal17~1_combout\);

-- Location: LCCOMB_X61_Y34_N22
\mem_in~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~11_combout\ = (\Equal21~4_combout\ & (!\Equal20~1_combout\ & ((!\Equal17~1_combout\) # (!\Equal18~4_combout\)))) # (!\Equal21~4_combout\ & (((!\Equal17~1_combout\)) # (!\Equal18~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal21~4_combout\,
	datab => \Equal18~4_combout\,
	datac => \Equal20~1_combout\,
	datad => \Equal17~1_combout\,
	combout => \mem_in~11_combout\);

-- Location: LCCOMB_X60_Y34_N28
\LessThan21~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~0_combout\ = (x(3)) # ((x(2)) # ((x(0) & x(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(0),
	datab => x(3),
	datac => x(2),
	datad => x(1),
	combout => \LessThan21~0_combout\);

-- Location: LCCOMB_X60_Y34_N6
\screen_test~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~24_combout\ = (x(4) & (!\LessThan21~0_combout\ & (!x(6) & x(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(4),
	datab => \LessThan21~0_combout\,
	datac => x(6),
	datad => x(5),
	combout => \screen_test~24_combout\);

-- Location: LCCOMB_X61_Y34_N10
\Equal22~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal22~0_combout\ = (y(1) & (y(3) & \Equal17~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => y(1),
	datac => y(3),
	datad => \Equal17~0_combout\,
	combout => \Equal22~0_combout\);

-- Location: LCCOMB_X61_Y34_N8
\mem_in~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~12_combout\ = (\mem_in~11_combout\ & (((!\screen_test~24_combout\ & !\Equal21~4_combout\)) # (!\Equal22~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in~11_combout\,
	datab => \screen_test~24_combout\,
	datac => \Equal21~4_combout\,
	datad => \Equal22~0_combout\,
	combout => \mem_in~12_combout\);

-- Location: LCCOMB_X57_Y33_N12
\Mux6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = x(1) $ (((x(0) & (x(2))) # (!x(0) & ((x(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010011111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(0),
	datab => x(2),
	datac => x(3),
	datad => x(1),
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X59_Y32_N18
\screen_test~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~26_combout\ = (!y(5) & (y(1) & y(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => y(5),
	datac => y(1),
	datad => y(0),
	combout => \screen_test~26_combout\);

-- Location: LCCOMB_X57_Y34_N6
\screen_test~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~38_combout\ = (!x(6) & x(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => x(6),
	datad => x(5),
	combout => \screen_test~38_combout\);

-- Location: LCCOMB_X60_Y34_N26
\screen_test~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~39_combout\ = (!x(4) & ((x(3) & ((!x(1)) # (!x(2)))) # (!x(3) & ((x(2)) # (x(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(4),
	datab => x(3),
	datac => x(2),
	datad => x(1),
	combout => \screen_test~39_combout\);

-- Location: LCCOMB_X59_Y34_N20
\screen_test~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~40_combout\ = (\screen_test~26_combout\ & (\Equal24~4_combout\ & (\screen_test~38_combout\ & \screen_test~39_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~26_combout\,
	datab => \Equal24~4_combout\,
	datac => \screen_test~38_combout\,
	datad => \screen_test~39_combout\,
	combout => \screen_test~40_combout\);

-- Location: LCCOMB_X57_Y32_N14
\Equal19~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal19~3_combout\ = (x(4) & (x(5) & !x(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(4),
	datac => x(5),
	datad => x(6),
	combout => \Equal19~3_combout\);

-- Location: LCCOMB_X59_Y33_N14
\Equal19~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal19~4_combout\ = (\Equal19~3_combout\ & (x(0) & (!x(1) & \Equal19~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal19~3_combout\,
	datab => x(0),
	datac => x(1),
	datad => \Equal19~2_combout\,
	combout => \Equal19~4_combout\);

-- Location: LCCOMB_X59_Y34_N26
\Equal16~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal16~1_combout\ = (!y(3) & !y(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => y(3),
	datad => y(2),
	combout => \Equal16~1_combout\);

-- Location: LCCOMB_X61_Y34_N28
\Equal16~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal16~2_combout\ = (y(4) & (!y(5) & (\Equal16~1_combout\ & \Equal16~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => y(4),
	datab => y(5),
	datac => \Equal16~1_combout\,
	datad => \Equal16~0_combout\,
	combout => \Equal16~2_combout\);

-- Location: LCCOMB_X61_Y34_N6
\mem_in~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~19_combout\ = (\Equal19~4_combout\ & (!\Equal17~1_combout\ & ((!\Equal21~4_combout\) # (!\Equal16~2_combout\)))) # (!\Equal19~4_combout\ & (((!\Equal21~4_combout\)) # (!\Equal16~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal19~4_combout\,
	datab => \Equal16~2_combout\,
	datac => \Equal21~4_combout\,
	datad => \Equal17~1_combout\,
	combout => \mem_in~19_combout\);

-- Location: LCCOMB_X57_Y33_N0
\Mux10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (x(3) & ((x(2) & ((!x(1)))) # (!x(2) & (!x(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(0),
	datab => x(2),
	datac => x(3),
	datad => x(1),
	combout => \Mux10~0_combout\);

-- Location: LCCOMB_X59_Y33_N24
\screen_test~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~36_combout\ = (x(3) & (((!x(4))))) # (!x(3) & (!x(1) & (!x(2) & x(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(1),
	datab => x(2),
	datac => x(3),
	datad => x(4),
	combout => \screen_test~36_combout\);

-- Location: LCCOMB_X58_Y33_N12
\screen_test~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~37_combout\ = (\screen_test~0_combout\ & (\screen_test~36_combout\ & (\Equal14~0_combout\ & \Equal16~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~0_combout\,
	datab => \screen_test~36_combout\,
	datac => \Equal14~0_combout\,
	datad => \Equal16~0_combout\,
	combout => \screen_test~37_combout\);

-- Location: LCCOMB_X57_Y33_N18
\mem_in~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~20_combout\ = ((\Mux10~0_combout\ & !x(4))) # (!\screen_test~37_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux10~0_combout\,
	datac => \screen_test~37_combout\,
	datad => x(4),
	combout => \mem_in~20_combout\);

-- Location: LCCOMB_X57_Y33_N6
\mem_in~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~21_combout\ = (\mem_in~19_combout\ & (\mem_in~20_combout\ & ((\Mux6~0_combout\) # (!\screen_test~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~0_combout\,
	datab => \screen_test~40_combout\,
	datac => \mem_in~19_combout\,
	datad => \mem_in~20_combout\,
	combout => \mem_in~21_combout\);

-- Location: LCCOMB_X59_Y32_N16
\Equal24~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal24~5_combout\ = (y(5) & (y(1) & y(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => y(5),
	datac => y(1),
	datad => y(0),
	combout => \Equal24~5_combout\);

-- Location: LCCOMB_X58_Y34_N12
\screen_test~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~25_combout\ = (\screen_test~24_combout\ & (\Equal24~5_combout\ & \Equal24~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~24_combout\,
	datab => \Equal24~5_combout\,
	datad => \Equal24~4_combout\,
	combout => \screen_test~25_combout\);

-- Location: LCCOMB_X57_Y33_N16
\mem_in~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~23_combout\ = ((!x(2) & (!x(0) & x(1)))) # (!\screen_test~25_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~25_combout\,
	datab => x(2),
	datac => x(0),
	datad => x(1),
	combout => \mem_in~23_combout\);

-- Location: LCCOMB_X54_Y34_N20
\LessThan18~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan18~0_combout\ = (x(3) & ((x(2)) # ((x(1) & x(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(3),
	datab => x(2),
	datac => x(1),
	datad => x(0),
	combout => \LessThan18~0_combout\);

-- Location: LCCOMB_X58_Y33_N6
\screen_test~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~33_combout\ = (\Equal18~3_combout\ & (\Equal24~5_combout\ & (\LessThan18~0_combout\ & \Equal24~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal18~3_combout\,
	datab => \Equal24~5_combout\,
	datac => \LessThan18~0_combout\,
	datad => \Equal24~4_combout\,
	combout => \screen_test~33_combout\);

-- Location: LCCOMB_X57_Y33_N30
\mem_in~81\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~81_combout\ = ((x(2) & ((!x(1)) # (!x(0))))) # (!\screen_test~33_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~33_combout\,
	datab => x(2),
	datac => x(0),
	datad => x(1),
	combout => \mem_in~81_combout\);

-- Location: LCCOMB_X58_Y33_N8
\screen_test~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~34_combout\ = (\screen_test~0_combout\ & (!x(4) & ((!x(1)) # (!\Equal18~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~0_combout\,
	datab => \Equal18~2_combout\,
	datac => x(4),
	datad => x(1),
	combout => \screen_test~34_combout\);

-- Location: LCCOMB_X58_Y33_N2
\screen_test~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~35_combout\ = (\screen_test~34_combout\ & (\Equal22~0_combout\ & ((\LessThan18~0_combout\) # (!\Equal18~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan18~0_combout\,
	datab => \screen_test~34_combout\,
	datac => \Equal18~3_combout\,
	datad => \Equal22~0_combout\,
	combout => \screen_test~35_combout\);

-- Location: LCCOMB_X60_Y34_N24
\screen_test~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~27_combout\ = ((!x(2) & !x(1))) # (!x(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => x(3),
	datac => x(2),
	datad => x(1),
	combout => \screen_test~27_combout\);

-- Location: LCCOMB_X60_Y34_N0
\screen_test~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~28_combout\ = (x(5) & (((!x(4) & \screen_test~27_combout\)))) # (!x(5) & (x(3) & (x(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(5),
	datab => x(3),
	datac => x(4),
	datad => \screen_test~27_combout\,
	combout => \screen_test~28_combout\);

-- Location: LCCOMB_X57_Y32_N22
\Equal14~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal14~2_combout\ = (!y(2) & (!y(4) & y(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => y(2),
	datac => y(4),
	datad => y(3),
	combout => \Equal14~2_combout\);

-- Location: LCCOMB_X57_Y32_N16
\screen_test~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~29_combout\ = (\screen_test~26_combout\ & (\screen_test~28_combout\ & (\Equal14~2_combout\ & !x(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~26_combout\,
	datab => \screen_test~28_combout\,
	datac => \Equal14~2_combout\,
	datad => x(6),
	combout => \screen_test~29_combout\);

-- Location: LCCOMB_X57_Y36_N14
\Mux36~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux36~2_combout\ = (x(3) & (x(0) & (x(2) $ (x(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(3),
	datab => x(0),
	datac => x(2),
	datad => x(1),
	combout => \Mux36~2_combout\);

-- Location: LCCOMB_X57_Y36_N4
\Mux36~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux36~3_combout\ = (!x(6) & (!x(4) & (!x(5) & \Mux36~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(6),
	datab => x(4),
	datac => x(5),
	datad => \Mux36~2_combout\,
	combout => \Mux36~3_combout\);

-- Location: LCCOMB_X57_Y36_N22
\Mux26~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux26~2_combout\ = (x(3) & (!x(5) & x(4))) # (!x(3) & (x(5) & !x(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010010000100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(3),
	datab => x(5),
	datac => x(4),
	combout => \Mux26~2_combout\);

-- Location: LCCOMB_X57_Y36_N24
\Mux26~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux26~3_combout\ = (x(0) & (((!x(2))))) # (!x(0) & (x(4) & ((x(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(4),
	datab => x(2),
	datac => x(0),
	datad => x(1),
	combout => \Mux26~3_combout\);

-- Location: LCCOMB_X57_Y36_N26
\Mux26~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux26~4_combout\ = (!x(4) & x(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => x(4),
	datac => x(2),
	combout => \Mux26~4_combout\);

-- Location: LCCOMB_X57_Y36_N12
\Mux26~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux26~1_combout\ = (!x(3) & (x(5) & (!x(0) & !x(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(3),
	datab => x(5),
	datac => x(0),
	datad => x(1),
	combout => \Mux26~1_combout\);

-- Location: LCCOMB_X57_Y36_N20
\Mux26~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux26~5_combout\ = (\Mux26~3_combout\ & (\Mux26~2_combout\ & (!\Mux26~4_combout\))) # (!\Mux26~3_combout\ & (((\Mux26~4_combout\ & \Mux26~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux26~2_combout\,
	datab => \Mux26~3_combout\,
	datac => \Mux26~4_combout\,
	datad => \Mux26~1_combout\,
	combout => \Mux26~5_combout\);

-- Location: LCCOMB_X57_Y36_N8
\mem_in~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~22_combout\ = (\screen_test~35_combout\ & (\Mux36~3_combout\ & ((\Mux26~5_combout\) # (!\screen_test~29_combout\)))) # (!\screen_test~35_combout\ & (((\Mux26~5_combout\)) # (!\screen_test~29_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~35_combout\,
	datab => \screen_test~29_combout\,
	datac => \Mux36~3_combout\,
	datad => \Mux26~5_combout\,
	combout => \mem_in~22_combout\);

-- Location: LCCOMB_X57_Y33_N10
\mem_in~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~24_combout\ = (\mem_in~21_combout\ & (\mem_in~23_combout\ & (\mem_in~81_combout\ & \mem_in~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in~21_combout\,
	datab => \mem_in~23_combout\,
	datac => \mem_in~81_combout\,
	datad => \mem_in~22_combout\,
	combout => \mem_in~24_combout\);

-- Location: LCCOMB_X57_Y36_N30
\Mux14~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux14~8_combout\ = (x(3) & (x(2) & (!x(5) & \Equal21~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(3),
	datab => x(2),
	datac => x(5),
	datad => \Equal21~2_combout\,
	combout => \Mux14~8_combout\);

-- Location: LCCOMB_X57_Y36_N28
\Mux14~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux14~5_combout\ = (!x(3) & (!x(0) & (x(2) $ (x(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(3),
	datab => x(0),
	datac => x(2),
	datad => x(1),
	combout => \Mux14~5_combout\);

-- Location: LCCOMB_X57_Y36_N18
\Mux14~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux14~4_combout\ = (!x(6) & (x(5) $ (x(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(6),
	datab => x(5),
	datac => x(4),
	combout => \Mux14~4_combout\);

-- Location: LCCOMB_X57_Y36_N6
\Mux14~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux14~6_combout\ = (\Mux14~4_combout\ & ((\Mux14~8_combout\) # ((\Mux14~5_combout\ & x(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux14~8_combout\,
	datab => \Mux14~5_combout\,
	datac => x(5),
	datad => \Mux14~4_combout\,
	combout => \Mux14~6_combout\);

-- Location: LCCOMB_X58_Y34_N4
\mem_in~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~25_combout\ = (\mem_in~12_combout\ & (\mem_in~24_combout\ & ((\Mux14~6_combout\) # (!\screen_test~32_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~32_combout\,
	datab => \mem_in~12_combout\,
	datac => \mem_in~24_combout\,
	datad => \Mux14~6_combout\,
	combout => \mem_in~25_combout\);

-- Location: LCCOMB_X59_Y32_N14
\Equal24~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal24~6_combout\ = (!y(4) & (\Equal24~5_combout\ & (!y(2) & !y(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => y(4),
	datab => \Equal24~5_combout\,
	datac => y(2),
	datad => y(3),
	combout => \Equal24~6_combout\);

-- Location: LCCOMB_X61_Y34_N2
\mem_in~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~13_combout\ = (\Equal21~4_combout\ & (!\Equal17~1_combout\ & ((!\Equal18~4_combout\) # (!\Equal16~2_combout\)))) # (!\Equal21~4_combout\ & (((!\Equal18~4_combout\)) # (!\Equal16~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal21~4_combout\,
	datab => \Equal16~2_combout\,
	datac => \Equal18~4_combout\,
	datad => \Equal17~1_combout\,
	combout => \mem_in~13_combout\);

-- Location: LCCOMB_X58_Y34_N22
\mem_in~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~14_combout\ = (!\screen_test~32_combout\ & (!\screen_test~29_combout\ & (\mem_in~13_combout\ & !\screen_test~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~32_combout\,
	datab => \screen_test~29_combout\,
	datac => \mem_in~13_combout\,
	datad => \screen_test~25_combout\,
	combout => \mem_in~14_combout\);

-- Location: LCCOMB_X57_Y32_N8
\mem_in~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~6_combout\ = (!x(3) & x(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => x(3),
	datad => x(6),
	combout => \mem_in~6_combout\);

-- Location: LCCOMB_X57_Y32_N26
\screen_test~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~21_combout\ = (\Equal23~1_combout\ & (\mem_in~6_combout\ & ((!x(2)) # (!x(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(1),
	datab => \Equal23~1_combout\,
	datac => \mem_in~6_combout\,
	datad => x(2),
	combout => \screen_test~21_combout\);

-- Location: LCCOMB_X57_Y32_N20
\screen_test~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~22_combout\ = (\Equal14~1_combout\ & ((\screen_test~21_combout\) # ((\Equal19~3_combout\ & \LessThan18~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~21_combout\,
	datab => \Equal19~3_combout\,
	datac => \LessThan18~0_combout\,
	datad => \Equal14~1_combout\,
	combout => \screen_test~22_combout\);

-- Location: LCCOMB_X59_Y33_N28
\Equal23~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal23~2_combout\ = (\Equal23~1_combout\ & (\Equal19~2_combout\ & (\Equal23~0_combout\ & x(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal23~1_combout\,
	datab => \Equal19~2_combout\,
	datac => \Equal23~0_combout\,
	datad => x(6),
	combout => \Equal23~2_combout\);

-- Location: LCCOMB_X61_Y34_N20
\mem_in~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~15_combout\ = (\Equal19~4_combout\ & (!\Equal20~1_combout\ & ((!\Equal17~1_combout\) # (!\Equal23~2_combout\)))) # (!\Equal19~4_combout\ & (((!\Equal17~1_combout\) # (!\Equal23~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal19~4_combout\,
	datab => \Equal20~1_combout\,
	datac => \Equal23~2_combout\,
	datad => \Equal17~1_combout\,
	combout => \mem_in~15_combout\);

-- Location: LCCOMB_X58_Y33_N30
\mem_in~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~16_combout\ = (!\screen_test~37_combout\ & (!\screen_test~35_combout\ & (!\screen_test~40_combout\ & !\screen_test~33_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~37_combout\,
	datab => \screen_test~35_combout\,
	datac => \screen_test~40_combout\,
	datad => \screen_test~33_combout\,
	combout => \mem_in~16_combout\);

-- Location: LCCOMB_X58_Y34_N0
\mem_in~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~17_combout\ = (!\screen_test~22_combout\ & (\mem_in~15_combout\ & \mem_in~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~22_combout\,
	datac => \mem_in~15_combout\,
	datad => \mem_in~16_combout\,
	combout => \mem_in~17_combout\);

-- Location: LCCOMB_X61_Y34_N14
\mem_in~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~8_combout\ = (\Equal19~4_combout\ & (!\Equal16~2_combout\ & ((!\Equal17~1_combout\)))) # (!\Equal19~4_combout\ & (((!\Equal21~4_combout\)) # (!\Equal16~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal19~4_combout\,
	datab => \Equal16~2_combout\,
	datac => \Equal21~4_combout\,
	datad => \Equal17~1_combout\,
	combout => \mem_in~8_combout\);

-- Location: LCCOMB_X61_Y34_N24
\mem_in~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~9_combout\ = (\Equal20~1_combout\ & (!\Equal18~4_combout\ & (!\Equal23~2_combout\))) # (!\Equal20~1_combout\ & (((!\Equal16~2_combout\) # (!\Equal23~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal20~1_combout\,
	datab => \Equal18~4_combout\,
	datac => \Equal23~2_combout\,
	datad => \Equal16~2_combout\,
	combout => \mem_in~9_combout\);

-- Location: LCCOMB_X61_Y34_N12
\mem_in~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~10_combout\ = (\mem_in~8_combout\ & (\mem_in~9_combout\ & ((!\Equal22~0_combout\) # (!\Equal23~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in~8_combout\,
	datab => \mem_in~9_combout\,
	datac => \Equal23~2_combout\,
	datad => \Equal22~0_combout\,
	combout => \mem_in~10_combout\);

-- Location: LCCOMB_X58_Y34_N2
\mem_in~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~18_combout\ = (\mem_in~14_combout\ & (\mem_in~17_combout\ & (\mem_in~10_combout\ & \mem_in~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in~14_combout\,
	datab => \mem_in~17_combout\,
	datac => \mem_in~10_combout\,
	datad => \mem_in~12_combout\,
	combout => \mem_in~18_combout\);

-- Location: LCCOMB_X59_Y33_N30
\Mux18~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux18~0_combout\ = (x(6) & (\Equal19~2_combout\ & (\Equal23~1_combout\ & \Mux26~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(6),
	datab => \Equal19~2_combout\,
	datac => \Equal23~1_combout\,
	datad => \Mux26~0_combout\,
	combout => \Mux18~0_combout\);

-- Location: LCCOMB_X59_Y33_N16
\Mux18~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux18~1_combout\ = (\Mux18~0_combout\) # ((\Equal18~2_combout\ & (x(0) & \Equal19~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal18~2_combout\,
	datab => x(0),
	datac => \Mux18~0_combout\,
	datad => \Equal19~3_combout\,
	combout => \Mux18~1_combout\);

-- Location: LCCOMB_X58_Y34_N24
\mem_in~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~7_combout\ = (\screen_test~22_combout\ & (\Mux18~1_combout\ & ((!\Equal23~2_combout\) # (!\Equal20~1_combout\)))) # (!\screen_test~22_combout\ & (((!\Equal23~2_combout\)) # (!\Equal20~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~22_combout\,
	datab => \Equal20~1_combout\,
	datac => \Equal23~2_combout\,
	datad => \Mux18~1_combout\,
	combout => \mem_in~7_combout\);

-- Location: LCCOMB_X58_Y34_N20
\mem_in~80\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~80_combout\ = (\mem_in~7_combout\ & (((\Equal24~6_combout\ & \Equal23~2_combout\)) # (!\mem_in~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal24~6_combout\,
	datab => \mem_in~18_combout\,
	datac => \Equal23~2_combout\,
	datad => \mem_in~7_combout\,
	combout => \mem_in~80_combout\);

-- Location: LCCOMB_X58_Y34_N16
\mem_in~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~26_combout\ = (\screen_test~20_combout\) # ((\mem_in~25_combout\ & \mem_in~80_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \screen_test~20_combout\,
	datac => \mem_in~25_combout\,
	datad => \mem_in~80_combout\,
	combout => \mem_in~26_combout\);

-- Location: FF_X58_Y34_N17
\mem_in[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \mem_in~26_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \ALT_INV_SV.clean0~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mem_in(0));

-- Location: M9K_X73_Y36_N0
\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a0\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "vga_font:vga|vram:Video_RAM|altsyncram:altsyncram_component|altsyncram_rtq3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 8192,
	port_a_logical_ram_width => 7,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock1",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 8192,
	port_b_logical_ram_width => 7,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	port_b_write_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	portbwe => \mem_wr~q\,
	portbre => VCC,
	clk0 => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	clk1 => \CLOCK_50~inputclkctrl_outclk\,
	portadatain => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portbdatain => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAIN_bus\,
	portaaddr => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCCOMB_X57_Y36_N0
\Mux26~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux26~6_combout\ = (!x(5) & x(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => x(5),
	datac => x(3),
	combout => \Mux26~6_combout\);

-- Location: LCCOMB_X57_Y36_N2
\mem_in~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~27_combout\ = (x(4) & (((\Mux26~6_combout\ & \Equal21~2_combout\)))) # (!x(4) & (\Mux26~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux26~1_combout\,
	datab => \Mux26~6_combout\,
	datac => x(4),
	datad => \Equal21~2_combout\,
	combout => \mem_in~27_combout\);

-- Location: LCCOMB_X54_Y34_N26
\mem_in~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~28_combout\ = (\screen_test~32_combout\ & (x(2) & \mem_in~27_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~32_combout\,
	datac => x(2),
	datad => \mem_in~27_combout\,
	combout => \mem_in~28_combout\);

-- Location: LCCOMB_X57_Y32_N28
\mem_in~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~34_combout\ = (!x(4) & (\mem_in~6_combout\ & (!x(1) & \screen_test~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(4),
	datab => \mem_in~6_combout\,
	datac => x(1),
	datad => \screen_test~22_combout\,
	combout => \mem_in~34_combout\);

-- Location: LCCOMB_X57_Y32_N6
\mem_in~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~35_combout\ = (\mem_in~34_combout\) # ((x(4) & (x(3) & \screen_test~29_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(4),
	datab => \mem_in~34_combout\,
	datac => x(3),
	datad => \screen_test~29_combout\,
	combout => \mem_in~35_combout\);

-- Location: LCCOMB_X54_Y34_N12
\mem_in~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~36_combout\ = (!x(5) & (\mem_in~35_combout\ & (!x(2) & !x(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(5),
	datab => \mem_in~35_combout\,
	datac => x(2),
	datad => x(0),
	combout => \mem_in~36_combout\);

-- Location: LCCOMB_X57_Y33_N28
\Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (x(2) & (!x(1) & (x(0) $ (x(3))))) # (!x(2) & (!x(0) & ((x(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(0),
	datab => x(2),
	datac => x(3),
	datad => x(1),
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X57_Y33_N22
\mem_in~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~37_combout\ = (\screen_test~33_combout\ & ((\Mux36~2_combout\) # ((\Mux5~0_combout\ & \screen_test~40_combout\)))) # (!\screen_test~33_combout\ & (\Mux5~0_combout\ & (\screen_test~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~33_combout\,
	datab => \Mux5~0_combout\,
	datac => \screen_test~40_combout\,
	datad => \Mux36~2_combout\,
	combout => \mem_in~37_combout\);

-- Location: LCCOMB_X58_Y33_N18
\mem_in~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~32_combout\ = (!x(4) & ((x(2) & (!x(1) & !x(0))) # (!x(2) & (x(1) & x(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(4),
	datab => x(2),
	datac => x(1),
	datad => x(0),
	combout => \mem_in~32_combout\);

-- Location: LCCOMB_X57_Y34_N16
\mem_in~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~33_combout\ = (x(5) & (!x(3) & (\screen_test~29_combout\ & \mem_in~32_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(5),
	datab => x(3),
	datac => \screen_test~29_combout\,
	datad => \mem_in~32_combout\,
	combout => \mem_in~33_combout\);

-- Location: LCCOMB_X55_Y34_N0
\mem_in~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~38_combout\ = (\mem_in~36_combout\) # ((\mem_in~37_combout\) # ((\mem_in~33_combout\) # (!\mem_in~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in~36_combout\,
	datab => \mem_in~37_combout\,
	datac => \mem_in~33_combout\,
	datad => \mem_in~10_combout\,
	combout => \mem_in~38_combout\);

-- Location: LCCOMB_X58_Y33_N14
\Equal18~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal18~5_combout\ = (\Equal18~3_combout\ & (x(2) & (!x(1) & x(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal18~3_combout\,
	datab => x(2),
	datac => x(1),
	datad => x(3),
	combout => \Equal18~5_combout\);

-- Location: LCCOMB_X57_Y32_N10
\mem_in[4]~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in[4]~29_combout\ = ((!\Equal24~6_combout\ & !\Equal22~0_combout\)) # (!\screen_test~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~24_combout\,
	datac => \Equal24~6_combout\,
	datad => \Equal22~0_combout\,
	combout => \mem_in[4]~29_combout\);

-- Location: LCCOMB_X57_Y32_N12
\mem_in~82\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~82_combout\ = (x(3) & (\screen_test~22_combout\ & (x(1) & x(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(3),
	datab => \screen_test~22_combout\,
	datac => x(1),
	datad => x(0),
	combout => \mem_in~82_combout\);

-- Location: LCCOMB_X59_Y33_N18
\Mux42~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux42~0_combout\ = (!x(3) & (!x(2) & (x(1) $ (x(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(1),
	datab => x(0),
	datac => x(3),
	datad => x(2),
	combout => \Mux42~0_combout\);

-- Location: LCCOMB_X59_Y33_N4
\mem_in~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~30_combout\ = (\Equal19~3_combout\ & ((\mem_in~82_combout\) # ((!\mem_in[4]~29_combout\ & \Mux42~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in[4]~29_combout\,
	datab => \mem_in~82_combout\,
	datac => \Mux42~0_combout\,
	datad => \Equal19~3_combout\,
	combout => \mem_in~30_combout\);

-- Location: LCCOMB_X58_Y33_N0
\mem_in~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~31_combout\ = (\mem_in~30_combout\) # ((\Equal18~5_combout\ & ((\screen_test~37_combout\) # (\screen_test~35_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~37_combout\,
	datab => \screen_test~35_combout\,
	datac => \Equal18~5_combout\,
	datad => \mem_in~30_combout\,
	combout => \mem_in~31_combout\);

-- Location: LCCOMB_X54_Y34_N10
\mem_in~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~39_combout\ = (\mem_in~28_combout\) # ((\mem_in~38_combout\) # ((\screen_test~20_combout\) # (\mem_in~31_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in~28_combout\,
	datab => \mem_in~38_combout\,
	datac => \screen_test~20_combout\,
	datad => \mem_in~31_combout\,
	combout => \mem_in~39_combout\);

-- Location: FF_X54_Y34_N11
\mem_in[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \mem_in~39_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \ALT_INV_SV.clean0~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mem_in(1));

-- Location: M9K_X53_Y35_N0
\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a1\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "vga_font:vga|vram:Video_RAM|altsyncram:altsyncram_component|altsyncram_rtq3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 8192,
	port_a_logical_ram_width => 7,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock1",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 1,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 8192,
	port_b_logical_ram_width => 7,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	port_b_write_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	portbwe => \mem_wr~q\,
	portbre => VCC,
	clk0 => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	clk1 => \CLOCK_50~inputclkctrl_outclk\,
	portadatain => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a1_PORTADATAIN_bus\,
	portbdatain => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a1_PORTBDATAIN_bus\,
	portaaddr => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\,
	portbaddr => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a1_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\);

-- Location: LCCOMB_X58_Y32_N20
\Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (x(3) & (((!x(1) & x(0))))) # (!x(3) & (x(2) & ((x(1)) # (!x(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(2),
	datab => x(3),
	datac => x(1),
	datad => x(0),
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X58_Y32_N14
\mem_in~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~42_combout\ = (\screen_test~40_combout\ & ((\Mux4~0_combout\) # ((\Equal18~4_combout\ & \Equal20~1_combout\)))) # (!\screen_test~40_combout\ & (\Equal18~4_combout\ & (\Equal20~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~40_combout\,
	datab => \Equal18~4_combout\,
	datac => \Equal20~1_combout\,
	datad => \Mux4~0_combout\,
	combout => \mem_in~42_combout\);

-- Location: LCCOMB_X57_Y34_N4
\Mux24~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux24~1_combout\ = (x(2) & (!x(1) & (x(4) $ (x(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(4),
	datab => x(2),
	datac => x(1),
	datad => x(5),
	combout => \Mux24~1_combout\);

-- Location: LCCOMB_X57_Y34_N22
\Mux24~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux24~2_combout\ = (x(0) & (x(4))) # (!x(0) & (\Mux24~1_combout\ & (x(4) $ (!x(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(4),
	datab => \Mux24~1_combout\,
	datac => x(0),
	datad => x(3),
	combout => \Mux24~2_combout\);

-- Location: LCCOMB_X57_Y34_N18
\Mux24~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux24~0_combout\ = (!x(3) & (!x(2) & x(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => x(3),
	datac => x(2),
	datad => x(5),
	combout => \Mux24~0_combout\);

-- Location: LCCOMB_X57_Y34_N0
\Mux24~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux24~3_combout\ = (\Mux24~2_combout\ & (((\Mux26~6_combout\) # (!x(0))))) # (!\Mux24~2_combout\ & (\Mux24~0_combout\ & (x(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux24~2_combout\,
	datab => \Mux24~0_combout\,
	datac => x(0),
	datad => \Mux26~6_combout\,
	combout => \Mux24~3_combout\);

-- Location: LCCOMB_X61_Y34_N16
\mem_in~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~40_combout\ = (\Equal17~1_combout\ & ((\Equal19~4_combout\) # ((\Equal18~4_combout\) # (\Equal21~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal19~4_combout\,
	datab => \Equal18~4_combout\,
	datac => \Equal21~4_combout\,
	datad => \Equal17~1_combout\,
	combout => \mem_in~40_combout\);

-- Location: LCCOMB_X58_Y32_N10
\mem_in~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~41_combout\ = (\mem_in~40_combout\) # ((!\mem_in[4]~29_combout\ & \Equal19~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in[4]~29_combout\,
	datac => \mem_in~40_combout\,
	datad => \Equal19~4_combout\,
	combout => \mem_in~41_combout\);

-- Location: LCCOMB_X58_Y32_N8
\mem_in~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~43_combout\ = (\mem_in~42_combout\) # ((\mem_in~41_combout\) # ((\screen_test~29_combout\ & \Mux24~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~29_combout\,
	datab => \mem_in~42_combout\,
	datac => \Mux24~3_combout\,
	datad => \mem_in~41_combout\,
	combout => \mem_in~43_combout\);

-- Location: LCCOMB_X59_Y33_N22
\mem_in~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~44_combout\ = (x(2) & ((x(1)) # (!x(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => x(0),
	datac => x(1),
	datad => x(2),
	combout => \mem_in~44_combout\);

-- Location: LCCOMB_X58_Y34_N26
\screen_test~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \screen_test~23_combout\ = (\Equal23~2_combout\ & \Equal24~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal23~2_combout\,
	datad => \Equal24~6_combout\,
	combout => \screen_test~23_combout\);

-- Location: LCCOMB_X58_Y33_N20
\mem_in~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~45_combout\ = (\Mux26~0_combout\ & (\screen_test~35_combout\ & (\Equal18~3_combout\ & \Equal18~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux26~0_combout\,
	datab => \screen_test~35_combout\,
	datac => \Equal18~3_combout\,
	datad => \Equal18~2_combout\,
	combout => \mem_in~45_combout\);

-- Location: LCCOMB_X58_Y34_N30
\mem_in~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~46_combout\ = (!\mem_in~45_combout\ & ((!\Mux18~1_combout\) # (!\screen_test~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~22_combout\,
	datab => \Mux18~1_combout\,
	datad => \mem_in~45_combout\,
	combout => \mem_in~46_combout\);

-- Location: LCCOMB_X57_Y33_N8
\Mux9~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (x(3) & ((x(2) & ((!x(1)))) # (!x(2) & (!x(0) & x(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(0),
	datab => x(2),
	datac => x(3),
	datad => x(1),
	combout => \Mux9~0_combout\);

-- Location: LCCOMB_X58_Y33_N22
\mem_in~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~47_combout\ = (\Mux9~0_combout\ & (\Equal18~3_combout\ & \screen_test~37_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux9~0_combout\,
	datac => \Equal18~3_combout\,
	datad => \screen_test~37_combout\,
	combout => \mem_in~47_combout\);

-- Location: LCCOMB_X61_Y34_N18
\mem_in~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~48_combout\ = (!\mem_in~47_combout\ & (((!\Equal17~1_combout\ & !\Equal22~0_combout\)) # (!\Equal23~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in~47_combout\,
	datab => \Equal17~1_combout\,
	datac => \Equal23~2_combout\,
	datad => \Equal22~0_combout\,
	combout => \mem_in~48_combout\);

-- Location: LCCOMB_X58_Y34_N8
\mem_in~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~49_combout\ = (\mem_in~46_combout\ & (\mem_in~48_combout\ & ((!\Mux14~6_combout\) # (!\screen_test~32_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~32_combout\,
	datab => \Mux14~6_combout\,
	datac => \mem_in~46_combout\,
	datad => \mem_in~48_combout\,
	combout => \mem_in~49_combout\);

-- Location: LCCOMB_X58_Y34_N18
\mem_in~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~50_combout\ = (\mem_in~49_combout\ & (!\screen_test~20_combout\ & ((!\mem_in~18_combout\) # (!\screen_test~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~23_combout\,
	datab => \mem_in~49_combout\,
	datac => \screen_test~20_combout\,
	datad => \mem_in~18_combout\,
	combout => \mem_in~50_combout\);

-- Location: LCCOMB_X58_Y34_N10
\mem_in~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~51_combout\ = (\mem_in~43_combout\) # (((\screen_test~33_combout\ & \mem_in~44_combout\)) # (!\mem_in~50_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in~43_combout\,
	datab => \screen_test~33_combout\,
	datac => \mem_in~44_combout\,
	datad => \mem_in~50_combout\,
	combout => \mem_in~51_combout\);

-- Location: FF_X58_Y34_N11
\mem_in[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \mem_in~51_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \ALT_INV_SV.clean0~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mem_in(2));

-- Location: M9K_X73_Y33_N0
\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a2\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "vga_font:vga|vram:Video_RAM|altsyncram:altsyncram_component|altsyncram_rtq3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 8192,
	port_a_logical_ram_width => 7,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock1",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 8192,
	port_b_logical_ram_width => 7,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	port_b_write_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	portbwe => \mem_wr~q\,
	portbre => VCC,
	clk0 => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	clk1 => \CLOCK_50~inputclkctrl_outclk\,
	portadatain => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a2_PORTADATAIN_bus\,
	portbdatain => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a2_PORTBDATAIN_bus\,
	portaaddr => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\,
	portbaddr => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a2_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

-- Location: LCCOMB_X57_Y32_N30
\Equal19~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal19~5_combout\ = (!x(3) & (\Equal19~3_combout\ & (!x(1) & !x(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(3),
	datab => \Equal19~3_combout\,
	datac => x(1),
	datad => x(2),
	combout => \Equal19~5_combout\);

-- Location: LCCOMB_X57_Y32_N24
\mem_in~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~56_combout\ = (((!\Equal24~6_combout\ & !\Equal22~0_combout\)) # (!\Equal19~5_combout\)) # (!\screen_test~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~24_combout\,
	datab => \Equal24~6_combout\,
	datac => \Equal19~5_combout\,
	datad => \Equal22~0_combout\,
	combout => \mem_in~56_combout\);

-- Location: LCCOMB_X58_Y32_N26
\Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (x(2) & (!x(3) & (x(1) $ (!x(0))))) # (!x(2) & (x(3) & (x(1) & x(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(2),
	datab => x(3),
	datac => x(1),
	datad => x(0),
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X58_Y32_N12
\mem_in~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~53_combout\ = (\Equal19~4_combout\ & ((\Equal20~1_combout\) # ((\Mux3~0_combout\ & \screen_test~40_combout\)))) # (!\Equal19~4_combout\ & (((\Mux3~0_combout\ & \screen_test~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal19~4_combout\,
	datab => \Equal20~1_combout\,
	datac => \Mux3~0_combout\,
	datad => \screen_test~40_combout\,
	combout => \mem_in~53_combout\);

-- Location: LCCOMB_X58_Y32_N0
\Mux23~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux23~0_combout\ = (!x(3) & ((x(2) & (!x(1) & !x(0))) # (!x(2) & ((x(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(2),
	datab => x(3),
	datac => x(1),
	datad => x(0),
	combout => \Mux23~0_combout\);

-- Location: LCCOMB_X58_Y32_N18
\mem_in~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~54_combout\ = (\Equal21~5_combout\ & ((\Mux26~0_combout\) # ((\Mux23~0_combout\ & x(5))))) # (!\Equal21~5_combout\ & (\Mux23~0_combout\ & (x(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal21~5_combout\,
	datab => \Mux23~0_combout\,
	datac => x(5),
	datad => \Mux26~0_combout\,
	combout => \mem_in~54_combout\);

-- Location: LCCOMB_X58_Y32_N6
\Mux14~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux14~7_combout\ = x(4) $ (x(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => x(4),
	datac => x(5),
	combout => \Mux14~7_combout\);

-- Location: LCCOMB_X58_Y32_N4
\mem_in~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~55_combout\ = (\mem_in~53_combout\) # ((\mem_in~54_combout\ & (\screen_test~29_combout\ & \Mux14~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in~53_combout\,
	datab => \mem_in~54_combout\,
	datac => \screen_test~29_combout\,
	datad => \Mux14~7_combout\,
	combout => \mem_in~55_combout\);

-- Location: LCCOMB_X61_Y34_N4
\mem_in~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~52_combout\ = (\Equal20~1_combout\ & ((\Equal21~4_combout\) # ((\Equal23~2_combout\)))) # (!\Equal20~1_combout\ & (((\Equal23~2_combout\ & \Equal16~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal21~4_combout\,
	datab => \Equal20~1_combout\,
	datac => \Equal23~2_combout\,
	datad => \Equal16~2_combout\,
	combout => \mem_in~52_combout\);

-- Location: LCCOMB_X58_Y34_N28
\mem_in~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~57_combout\ = ((\mem_in~55_combout\) # ((\mem_in~52_combout\) # (!\mem_in~50_combout\))) # (!\mem_in~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in~56_combout\,
	datab => \mem_in~55_combout\,
	datac => \mem_in~52_combout\,
	datad => \mem_in~50_combout\,
	combout => \mem_in~57_combout\);

-- Location: FF_X58_Y34_N29
\mem_in[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \mem_in~57_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \ALT_INV_SV.clean0~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mem_in(3));

-- Location: M9K_X53_Y36_N0
\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a3\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "vga_font:vga|vram:Video_RAM|altsyncram:altsyncram_component|altsyncram_rtq3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 8192,
	port_a_logical_ram_width => 7,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock1",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 3,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 8192,
	port_b_logical_ram_width => 7,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	port_b_write_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	portbwe => \mem_wr~q\,
	portbre => VCC,
	clk0 => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	clk1 => \CLOCK_50~inputclkctrl_outclk\,
	portadatain => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a3_PORTADATAIN_bus\,
	portbdatain => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a3_PORTBDATAIN_bus\,
	portaaddr => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\,
	portbaddr => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a3_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\);

-- Location: LCCOMB_X58_Y32_N30
\mem_in~63\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~63_combout\ = (\Equal18~4_combout\) # (!\screen_test~35_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal18~4_combout\,
	datad => \screen_test~35_combout\,
	combout => \mem_in~63_combout\);

-- Location: LCCOMB_X58_Y32_N16
\Mux22~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux22~0_combout\ = (x(3) & ((x(2) & ((x(0)))) # (!x(2) & ((x(1)) # (!x(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(2),
	datab => x(3),
	datac => x(1),
	datad => x(0),
	combout => \Mux22~0_combout\);

-- Location: LCCOMB_X58_Y32_N2
\mem_in~65\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~65_combout\ = (x(4) & (((!x(5) & \Mux22~0_combout\)))) # (!x(4) & (\Mux23~0_combout\ & (x(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux23~0_combout\,
	datab => x(4),
	datac => x(5),
	datad => \Mux22~0_combout\,
	combout => \mem_in~65_combout\);

-- Location: LCCOMB_X58_Y33_N24
\mem_in~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~64_combout\ = ((x(0) & ((x(2)) # (x(1))))) # (!\screen_test~33_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~33_combout\,
	datab => x(2),
	datac => x(1),
	datad => x(0),
	combout => \mem_in~64_combout\);

-- Location: LCCOMB_X58_Y32_N28
\mem_in~66\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~66_combout\ = (\mem_in~63_combout\ & (\mem_in~64_combout\ & ((\mem_in~65_combout\) # (!\screen_test~29_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in~63_combout\,
	datab => \mem_in~65_combout\,
	datac => \mem_in~64_combout\,
	datad => \screen_test~29_combout\,
	combout => \mem_in~66_combout\);

-- Location: LCCOMB_X57_Y34_N30
\Mux40~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux40~2_combout\ = (x(2)) # ((x(3)) # ((x(0) & x(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(0),
	datab => x(2),
	datac => x(1),
	datad => x(3),
	combout => \Mux40~2_combout\);

-- Location: LCCOMB_X57_Y34_N14
\Mux40~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux40~3_combout\ = (x(4) & (!x(6) & (!\Mux40~2_combout\ & x(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(4),
	datab => x(6),
	datac => \Mux40~2_combout\,
	datad => x(5),
	combout => \Mux40~3_combout\);

-- Location: LCCOMB_X57_Y33_N26
\mem_in~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~60_combout\ = ((\Mux9~0_combout\ & \Equal18~3_combout\)) # (!\screen_test~37_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \screen_test~37_combout\,
	datac => \Mux9~0_combout\,
	datad => \Equal18~3_combout\,
	combout => \mem_in~60_combout\);

-- Location: LCCOMB_X57_Y33_N4
\Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (x(0) & (!x(2) & (x(3) & !x(1)))) # (!x(0) & (x(1) & (x(2) $ (x(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(0),
	datab => x(2),
	datac => x(3),
	datad => x(1),
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X61_Y34_N30
\mem_in~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~59_combout\ = ((!\Equal22~0_combout\ & (!\Equal16~2_combout\ & !\Equal17~1_combout\))) # (!\Equal23~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal22~0_combout\,
	datab => \Equal16~2_combout\,
	datac => \Equal23~2_combout\,
	datad => \Equal17~1_combout\,
	combout => \mem_in~59_combout\);

-- Location: LCCOMB_X57_Y33_N14
\mem_in~61\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~61_combout\ = (\mem_in~60_combout\ & (\mem_in~59_combout\ & ((\Mux2~0_combout\) # (!\screen_test~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in~60_combout\,
	datab => \Mux2~0_combout\,
	datac => \screen_test~40_combout\,
	datad => \mem_in~59_combout\,
	combout => \mem_in~61_combout\);

-- Location: LCCOMB_X57_Y34_N26
\Mux13~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = (x(0)) # ((x(3)) # ((x(2) & x(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(0),
	datab => x(2),
	datac => x(1),
	datad => x(3),
	combout => \Mux13~0_combout\);

-- Location: LCCOMB_X57_Y34_N20
\mem_in~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~58_combout\ = ((!\Mux13~0_combout\ & (!x(4) & x(5)))) # (!\screen_test~32_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux13~0_combout\,
	datab => \screen_test~32_combout\,
	datac => x(4),
	datad => x(5),
	combout => \mem_in~58_combout\);

-- Location: LCCOMB_X57_Y34_N24
\mem_in~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~62_combout\ = (\mem_in~61_combout\ & (\mem_in~58_combout\ & ((\mem_in[4]~29_combout\) # (\Mux40~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in[4]~29_combout\,
	datab => \Mux40~3_combout\,
	datac => \mem_in~61_combout\,
	datad => \mem_in~58_combout\,
	combout => \mem_in~62_combout\);

-- Location: LCCOMB_X58_Y34_N14
\mem_in~67\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~67_combout\ = (\screen_test~20_combout\) # ((\mem_in~66_combout\ & (\mem_in~62_combout\ & \mem_in~80_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in~66_combout\,
	datab => \mem_in~62_combout\,
	datac => \screen_test~20_combout\,
	datad => \mem_in~80_combout\,
	combout => \mem_in~67_combout\);

-- Location: FF_X58_Y34_N15
\mem_in[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \mem_in~67_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \ALT_INV_SV.clean0~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mem_in(4));

-- Location: M9K_X53_Y32_N0
\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a4\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "vga_font:vga|vram:Video_RAM|altsyncram:altsyncram_component|altsyncram_rtq3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 8192,
	port_a_logical_ram_width => 7,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock1",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 8192,
	port_b_logical_ram_width => 7,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	port_b_write_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	portbwe => \mem_wr~q\,
	portbre => VCC,
	clk0 => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	clk1 => \CLOCK_50~inputclkctrl_outclk\,
	portadatain => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\,
	portbdatain => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAIN_bus\,
	portaaddr => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\,
	portbaddr => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a4_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

-- Location: LCCOMB_X57_Y34_N2
\mem_in~68\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~68_combout\ = (x(0) & (((!\Equal21~5_combout\) # (!x(1))))) # (!x(0) & (((x(1))) # (!\Mux24~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(0),
	datab => \Mux24~0_combout\,
	datac => x(1),
	datad => \Equal21~5_combout\,
	combout => \mem_in~68_combout\);

-- Location: LCCOMB_X54_Y34_N30
\mem_in~69\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~69_combout\ = ((\mem_in~68_combout\) # (!\Mux14~4_combout\)) # (!\screen_test~32_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~32_combout\,
	datac => \mem_in~68_combout\,
	datad => \Mux14~4_combout\,
	combout => \mem_in~69_combout\);

-- Location: LCCOMB_X57_Y32_N2
\mem_in~72\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~72_combout\ = (\mem_in~56_combout\ & (((x(2)) # (!\Equal19~3_combout\)) # (!\mem_in~82_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in~82_combout\,
	datab => \Equal19~3_combout\,
	datac => \mem_in~56_combout\,
	datad => x(2),
	combout => \mem_in~72_combout\);

-- Location: LCCOMB_X57_Y33_N2
\mem_in~74\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~74_combout\ = (x(0) & (((x(1))))) # (!x(0) & (\Equal18~3_combout\ & (\screen_test~37_combout\ & !x(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(0),
	datab => \Equal18~3_combout\,
	datac => \screen_test~37_combout\,
	datad => x(1),
	combout => \mem_in~74_combout\);

-- Location: LCCOMB_X57_Y33_N20
\mem_in~75\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~75_combout\ = (x(2) & (\screen_test~33_combout\)) # (!x(2) & (\mem_in~74_combout\ & ((\screen_test~33_combout\) # (!x(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~33_combout\,
	datab => x(2),
	datac => x(0),
	datad => \mem_in~74_combout\,
	combout => \mem_in~75_combout\);

-- Location: LCCOMB_X60_Y34_N4
\mem_in~73\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~73_combout\ = ((x(6)) # (!x(5))) # (!\screen_test~39_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~39_combout\,
	datac => x(6),
	datad => x(5),
	combout => \mem_in~73_combout\);

-- Location: LCCOMB_X60_Y34_N30
\mem_in~76\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~76_combout\ = (\screen_test~40_combout\ & (\mem_in~73_combout\ & ((!x(3)) # (!\mem_in~75_combout\)))) # (!\screen_test~40_combout\ & (((!x(3))) # (!\mem_in~75_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \screen_test~40_combout\,
	datab => \mem_in~75_combout\,
	datac => \mem_in~73_combout\,
	datad => x(3),
	combout => \mem_in~76_combout\);

-- Location: LCCOMB_X58_Y33_N10
\mem_in~70\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~70_combout\ = (((!x(3)) # (!\screen_test~0_combout\)) # (!\screen_test~29_combout\)) # (!x(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(4),
	datab => \screen_test~29_combout\,
	datac => \screen_test~0_combout\,
	datad => x(3),
	combout => \mem_in~70_combout\);

-- Location: LCCOMB_X57_Y33_N24
\Mux28~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux28~0_combout\ = (x(3) & ((x(2) & ((!x(1)))) # (!x(2) & (x(0) & x(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => x(0),
	datab => x(2),
	datac => x(3),
	datad => x(1),
	combout => \Mux28~0_combout\);

-- Location: LCCOMB_X58_Y33_N28
\mem_in~71\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~71_combout\ = (\mem_in~70_combout\ & (((!\screen_test~35_combout\) # (!\Equal18~3_combout\)) # (!\Mux28~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in~70_combout\,
	datab => \Mux28~0_combout\,
	datac => \Equal18~3_combout\,
	datad => \screen_test~35_combout\,
	combout => \mem_in~71_combout\);

-- Location: LCCOMB_X54_Y34_N0
\mem_in~77\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~77_combout\ = (\mem_in~69_combout\ & (\mem_in~72_combout\ & (\mem_in~76_combout\ & \mem_in~71_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_in~69_combout\,
	datab => \mem_in~72_combout\,
	datac => \mem_in~76_combout\,
	datad => \mem_in~71_combout\,
	combout => \mem_in~77_combout\);

-- Location: LCCOMB_X54_Y34_N28
\mem_in~78\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~78_combout\ = (!\screen_test~20_combout\ & !\mem_in~77_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \screen_test~20_combout\,
	datad => \mem_in~77_combout\,
	combout => \mem_in~78_combout\);

-- Location: FF_X54_Y34_N29
\mem_in[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \mem_in~78_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \ALT_INV_SV.clean0~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mem_in(5));

-- Location: LCCOMB_X54_Y34_N4
\mem_in[5]~_wirecell\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in[5]~_wirecell_combout\ = !mem_in(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => mem_in(5),
	combout => \mem_in[5]~_wirecell_combout\);

-- Location: M9K_X53_Y34_N0
\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a5\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "vga_font:vga|vram:Video_RAM|altsyncram:altsyncram_component|altsyncram_rtq3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 8192,
	port_a_logical_ram_width => 7,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock1",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 5,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 8192,
	port_b_logical_ram_width => 7,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	port_b_write_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	portbwe => \mem_wr~q\,
	portbre => VCC,
	clk0 => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	clk1 => \CLOCK_50~inputclkctrl_outclk\,
	portadatain => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a5_PORTADATAIN_bus\,
	portbdatain => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a5_PORTBDATAIN_bus\,
	portaaddr => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\,
	portbaddr => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a5_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\);

-- Location: LCCOMB_X54_Y34_N14
\mem_in~79\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \mem_in~79_combout\ = (\screen_test~20_combout\) # (!\mem_in~77_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \screen_test~20_combout\,
	datad => \mem_in~77_combout\,
	combout => \mem_in~79_combout\);

-- Location: FF_X54_Y34_N15
\mem_in[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \mem_in~79_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \ALT_INV_SV.clean0~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mem_in(6));

-- Location: M9K_X73_Y34_N0
\vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a6\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "vga_font:vga|vram:Video_RAM|altsyncram:altsyncram_component|altsyncram_rtq3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 8192,
	port_a_logical_ram_width => 7,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock1",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 8192,
	port_b_logical_ram_width => 7,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	port_b_write_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	portbwe => \mem_wr~q\,
	portbre => VCC,
	clk0 => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	clk1 => \CLOCK_50~inputclkctrl_outclk\,
	portadatain => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a6_PORTADATAIN_bus\,
	portbdatain => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a6_PORTBDATAIN_bus\,
	portaaddr => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\,
	portbaddr => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a6_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \vga|Video_RAM|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\);

-- Location: M9K_X53_Y33_N0
\vga|font_table|altsyncram_component|auto_generated|ram_block1a0\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init4 => X"7FBFDFEFF7FBFDFEFF00000004C290880000000C0100802020103000040201008040200000030201010040200C001F04010041F000001C0107844221100000001105010141100000000D0944A211080000000604842211080000000E88C422110800000007040203E0804000001F0043C200F000000010080403117000000201",
	mem_init3 => X"07844220F0000020100F044221E00000000F08442210F00000001088442210F0000000128944A250D00000000E02010080406000000905030140904000000C010080400010000004020100800020000010884622E10080001E0087C42210F800000008040203C080441C000F0807E210F00000000F884421F0080400000F88040200F80000001F084423E1008000000F8843E010F000000000000000101818007F8000000000000000000000000210903000000F00804020107800000080808080808000000F04020100807800001F8401004010FC000004020101C11088000010848180C090840000108CC5A2D1088400000604842211088400000F08442211",
	mem_init2 => X"08840000040201008040F800000F0840C18108780000108887C21108F800000E8884A21108780000100807C21108F800000F08442211087800001188C4A29188C40000108845A2D198CC00001F88040201008000001089870281308400000C09008040203800000E020100804070000010884423F1088400000F0844E2010878000010080403E100FC00001F880403E100FC00001E0884221110F000000F0CC60301987800001F084423E108F80000108847E210903000000F8805E2D108780000060001806108780000100600C01030604000000007E001F80000000081830200C01802000C01018000603000000003018000603000000F0043E21108780000",
	mem_init1 => X"0F084421E108780000040201004010FC00000F084423E1007800000F0C4023E100FC0000010087E320701800000F08404061087800001F8803C011087800000F81008140601000000F0C4522511878000010040100401004000006030000000000000000000003F00000001006030000000000000000020103E040200000000A8383E0E0A800000401004020202000000202020100401000000000000080200800000E8882A000E08838001184C10040D0640000020780A0E0A03C0800090487E121F8482400000000012090480000020000804020100000000000000000000000040607E3F0C0200000020187E3F03010000006030183F0F0300000060787E0",
	mem_init0 => X"C06030003F2057A9940A95027E3F20532BD40A95027E00020383E3F9DC6C00000607866330F03000000B0A4422200000000804070542A150000000198482421108780004020784A250900000000E088422111000000006040203E0000000000E088441F0000000100805832110700000000884824121F800000004070542A0E020000401078401E1007800001F8401008080FC0020100B064221100000001185010081800000003F88828080000000000804020100000000000E0887C220E00000010088442210F00000040F0804018020F800000F08038200F00000000F084421E1007800001008060281200C0020100F0443C1107000000D890481A0000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "ascii_char_rom.mif",
	init_file_layout => "port_a",
	logical_ram_name => "vga_font:vga|vrom:font_table|altsyncram:altsyncram_component|altsyncram_44s3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 9,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 10,
	port_b_data_width => 9,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	portaaddr => \vga|font_table|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \vga|font_table|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCCOMB_X54_Y33_N2
\vga|X[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|X[0]~feeder_combout\ = \vga|Timing_Circuit:hcount[0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \vga|Timing_Circuit:hcount[0]~q\,
	combout => \vga|X[0]~feeder_combout\);

-- Location: FF_X54_Y33_N3
\vga|X[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|X[0]~feeder_combout\,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|X\(0));

-- Location: LCCOMB_X54_Y33_N26
\vga|FX1[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|FX1[0]~feeder_combout\ = \vga|X\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vga|X\(0),
	combout => \vga|FX1[0]~feeder_combout\);

-- Location: FF_X54_Y33_N27
\vga|FX1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|FX1[0]~feeder_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|FX1\(0));

-- Location: FF_X54_Y33_N25
\vga|FX2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \vga|FX1\(0),
	sload => VCC,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|FX2\(0));

-- Location: LCCOMB_X54_Y33_N24
\vga|Mux0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Mux0~2_combout\ = (\vga|FX2\(0) & (((\vga|font_table|altsyncram_component|auto_generated|q_a\(6)) # (\vga|FX2\(1))))) # (!\vga|FX2\(0) & (\vga|font_table|altsyncram_component|auto_generated|q_a\(7) & ((!\vga|FX2\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|font_table|altsyncram_component|auto_generated|q_a\(7),
	datab => \vga|font_table|altsyncram_component|auto_generated|q_a\(6),
	datac => \vga|FX2\(0),
	datad => \vga|FX2\(1),
	combout => \vga|Mux0~2_combout\);

-- Location: LCCOMB_X54_Y33_N6
\vga|Mux0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Mux0~3_combout\ = (\vga|FX2\(1) & ((\vga|Mux0~2_combout\ & ((\vga|font_table|altsyncram_component|auto_generated|q_a\(4)))) # (!\vga|Mux0~2_combout\ & (\vga|font_table|altsyncram_component|auto_generated|q_a\(5))))) # (!\vga|FX2\(1) & 
-- (((\vga|Mux0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|FX2\(1),
	datab => \vga|font_table|altsyncram_component|auto_generated|q_a\(5),
	datac => \vga|font_table|altsyncram_component|auto_generated|q_a\(4),
	datad => \vga|Mux0~2_combout\,
	combout => \vga|Mux0~3_combout\);

-- Location: LCCOMB_X51_Y31_N4
\vga|X[2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|X[2]~feeder_combout\ = \vga|Timing_Circuit:hcount[2]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vga|Timing_Circuit:hcount[2]~q\,
	combout => \vga|X[2]~feeder_combout\);

-- Location: FF_X51_Y31_N5
\vga|X[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|X[2]~feeder_combout\,
	ena => \vga|X[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|X\(2));

-- Location: LCCOMB_X51_Y31_N2
\vga|FX1[2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|FX1[2]~feeder_combout\ = \vga|X\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \vga|X\(2),
	combout => \vga|FX1[2]~feeder_combout\);

-- Location: FF_X51_Y31_N3
\vga|FX1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|FX1[2]~feeder_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|FX1\(2));

-- Location: FF_X51_Y31_N13
\vga|FX2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \vga|FX1\(2),
	sload => VCC,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|FX2\(2));

-- Location: LCCOMB_X54_Y33_N10
\vga|Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Mux0~0_combout\ = (\vga|FX2\(0) & (((\vga|FX2\(1))))) # (!\vga|FX2\(0) & ((\vga|FX2\(1) & (\vga|font_table|altsyncram_component|auto_generated|q_a\(1))) # (!\vga|FX2\(1) & ((\vga|font_table|altsyncram_component|auto_generated|q_a\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|font_table|altsyncram_component|auto_generated|q_a\(1),
	datab => \vga|FX2\(0),
	datac => \vga|FX2\(1),
	datad => \vga|font_table|altsyncram_component|auto_generated|q_a\(3),
	combout => \vga|Mux0~0_combout\);

-- Location: LCCOMB_X54_Y33_N20
\vga|Mux0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Mux0~1_combout\ = (\vga|Mux0~0_combout\ & (((\vga|font_table|altsyncram_component|auto_generated|q_a\(0)) # (!\vga|FX2\(0))))) # (!\vga|Mux0~0_combout\ & (\vga|font_table|altsyncram_component|auto_generated|q_a\(2) & ((\vga|FX2\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|font_table|altsyncram_component|auto_generated|q_a\(2),
	datab => \vga|font_table|altsyncram_component|auto_generated|q_a\(0),
	datac => \vga|Mux0~0_combout\,
	datad => \vga|FX2\(0),
	combout => \vga|Mux0~1_combout\);

-- Location: LCCOMB_X51_Y31_N12
\vga|Mux0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Mux0~4_combout\ = (\vga|FX2\(2) & ((\vga|Mux0~1_combout\))) # (!\vga|FX2\(2) & (\vga|Mux0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vga|Mux0~3_combout\,
	datac => \vga|FX2\(2),
	datad => \vga|Mux0~1_combout\,
	combout => \vga|Mux0~4_combout\);

-- Location: LCCOMB_X51_Y31_N16
\vga|r~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|r~3_combout\ = (!\vga|Timing_Circuit~10_combout\ & (\vga|r[0]~13_combout\ & (\vga|Timing_Circuit~5_combout\ & !\vga|Mux0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit~10_combout\,
	datab => \vga|r[0]~13_combout\,
	datac => \vga|Timing_Circuit~5_combout\,
	datad => \vga|Mux0~4_combout\,
	combout => \vga|r~3_combout\);

-- Location: LCCOMB_X54_Y32_N20
\vga|Timing_Circuit~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~16_combout\ = ((\vga|X\(7)) # ((\vga|X\(9)) # (!\vga|Y\(4)))) # (!\vga|Y\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Y\(3),
	datab => \vga|X\(7),
	datac => \vga|Y\(4),
	datad => \vga|X\(9),
	combout => \vga|Timing_Circuit~16_combout\);

-- Location: LCCOMB_X54_Y31_N22
\vga|Timing_Circuit~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~15_combout\ = (\vga|Y\(5)) # ((\vga|Y\(8)) # ((\vga|Y\(6)) # (\vga|Y\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Y\(5),
	datab => \vga|Y\(8),
	datac => \vga|Y\(6),
	datad => \vga|Y\(7),
	combout => \vga|Timing_Circuit~15_combout\);

-- Location: LCCOMB_X54_Y32_N0
\vga|Timing_Circuit~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~14_combout\ = ((\vga|X\(5) & (\vga|X\(4) & \vga|X\(6))) # (!\vga|X\(5) & (!\vga|X\(4) & !\vga|X\(6)))) # (!\vga|X\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|X\(8),
	datab => \vga|X\(5),
	datac => \vga|X\(4),
	datad => \vga|X\(6),
	combout => \vga|Timing_Circuit~14_combout\);

-- Location: LCCOMB_X54_Y32_N30
\vga|g~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|g~0_combout\ = (\vga|Mux0~4_combout\ & ((\vga|Timing_Circuit~16_combout\) # ((\vga|Timing_Circuit~15_combout\) # (\vga|Timing_Circuit~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Mux0~4_combout\,
	datab => \vga|Timing_Circuit~16_combout\,
	datac => \vga|Timing_Circuit~15_combout\,
	datad => \vga|Timing_Circuit~14_combout\,
	combout => \vga|g~0_combout\);

-- Location: LCCOMB_X54_Y32_N22
\vga|Timing_Circuit~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~12_combout\ = (!\vga|X\(9) & (((!\vga|X\(6) & !\vga|X\(7))) # (!\vga|X\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|X\(6),
	datab => \vga|X\(9),
	datac => \vga|X\(7),
	datad => \vga|X\(8),
	combout => \vga|Timing_Circuit~12_combout\);

-- Location: LCCOMB_X54_Y32_N18
\vga|Timing_Circuit~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~13_combout\ = (\vga|Timing_Circuit~12_combout\ & (\vga|Timing_Circuit~4_combout\ & (\vga|LessThan21~0_combout\ & \vga|Y\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit~12_combout\,
	datab => \vga|Timing_Circuit~4_combout\,
	datac => \vga|LessThan21~0_combout\,
	datad => \vga|Y\(8),
	combout => \vga|Timing_Circuit~13_combout\);

-- Location: LCCOMB_X51_Y31_N26
\vga|r~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|r~4_combout\ = (!\vga|g~0_combout\ & ((!\vga|Timing_Circuit~13_combout\) # (!\vga|r~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vga|r~3_combout\,
	datac => \vga|g~0_combout\,
	datad => \vga|Timing_Circuit~13_combout\,
	combout => \vga|r~4_combout\);

-- Location: LCCOMB_X51_Y31_N22
\vga|r~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|r~2_combout\ = (\vga|Timing_Circuit~5_combout\ & (!\vga|Mux0~4_combout\ & ((\vga|Timing_Circuit~10_combout\) # (!\vga|r[0]~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit~10_combout\,
	datab => \vga|r[0]~13_combout\,
	datac => \vga|Timing_Circuit~5_combout\,
	datad => \vga|Mux0~4_combout\,
	combout => \vga|r~2_combout\);

-- Location: LCCOMB_X54_Y31_N12
\vga|Timing_Circuit~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Timing_Circuit~19_combout\ = (\vga|Y\(7)) # ((\vga|Y\(6)) # (\vga|Timing_Circuit~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vga|Y\(7),
	datac => \vga|Y\(6),
	datad => \vga|Timing_Circuit~2_combout\,
	combout => \vga|Timing_Circuit~19_combout\);

-- Location: LCCOMB_X54_Y31_N16
\vga|r~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|r~5_combout\ = (\vga|blank~q\ & (((\vga|r~2_combout\ & \vga|Timing_Circuit~19_combout\)) # (!\vga|r~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|blank~q\,
	datab => \vga|r~4_combout\,
	datac => \vga|r~2_combout\,
	datad => \vga|Timing_Circuit~19_combout\,
	combout => \vga|r~5_combout\);

-- Location: FF_X54_Y31_N17
\vga|r[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|r~5_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|r\(0));

-- Location: LCCOMB_X51_Y31_N10
\vga|r~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|r~7_combout\ = (\vga|blank~q\ & ((\vga|FX2\(2) & ((!\vga|Mux0~1_combout\))) # (!\vga|FX2\(2) & (!\vga|Mux0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Mux0~3_combout\,
	datab => \vga|FX2\(2),
	datac => \vga|blank~q\,
	datad => \vga|Mux0~1_combout\,
	combout => \vga|r~7_combout\);

-- Location: LCCOMB_X51_Y31_N28
\vga|r~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|r~6_combout\ = (\vga|Timing_Circuit~5_combout\ & (((\vga|Timing_Circuit~10_combout\) # (!\vga|Timing_Circuit~13_combout\)) # (!\vga|r[0]~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit~5_combout\,
	datab => \vga|r[0]~13_combout\,
	datac => \vga|Timing_Circuit~10_combout\,
	datad => \vga|Timing_Circuit~13_combout\,
	combout => \vga|r~6_combout\);

-- Location: LCCOMB_X51_Y31_N14
\vga|g~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|g~1_combout\ = (\vga|blank~q\ & \vga|g~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vga|blank~q\,
	datac => \vga|g~0_combout\,
	combout => \vga|g~1_combout\);

-- Location: LCCOMB_X51_Y31_N24
\vga|r~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|r~8_combout\ = (\vga|g~1_combout\) # ((\vga|r~7_combout\ & (\vga|r~6_combout\ & \vga|r[0]~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|r~7_combout\,
	datab => \vga|r~6_combout\,
	datac => \vga|g~1_combout\,
	datad => \vga|r[0]~13_combout\,
	combout => \vga|r~8_combout\);

-- Location: FF_X51_Y31_N25
\vga|r[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|r~8_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|r\(1));

-- Location: LCCOMB_X54_Y31_N18
\vga|r~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|r~9_combout\ = (\vga|blank~q\ & (((\vga|r~2_combout\ & !\vga|Timing_Circuit~19_combout\)) # (!\vga|r~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|blank~q\,
	datab => \vga|r~4_combout\,
	datac => \vga|r~2_combout\,
	datad => \vga|Timing_Circuit~19_combout\,
	combout => \vga|r~9_combout\);

-- Location: FF_X54_Y31_N19
\vga|r[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|r~9_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|r\(2));

-- Location: LCCOMB_X51_Y31_N30
\vga|r~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|r~10_combout\ = (\vga|Timing_Circuit~5_combout\ & ((\vga|FX2\(2) & ((!\vga|Mux0~1_combout\))) # (!\vga|FX2\(2) & (!\vga|Mux0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Mux0~3_combout\,
	datab => \vga|FX2\(2),
	datac => \vga|Timing_Circuit~5_combout\,
	datad => \vga|Mux0~1_combout\,
	combout => \vga|r~10_combout\);

-- Location: LCCOMB_X54_Y31_N20
\vga|r~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|r~11_combout\ = (\vga|blank~q\ & ((\vga|g~0_combout\) # ((\vga|r~10_combout\ & !\vga|Timing_Circuit~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|blank~q\,
	datab => \vga|r~10_combout\,
	datac => \vga|g~0_combout\,
	datad => \vga|Timing_Circuit~19_combout\,
	combout => \vga|r~11_combout\);

-- Location: LCCOMB_X54_Y31_N4
\vga|r[3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|r[3]~feeder_combout\ = \vga|r~11_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vga|r~11_combout\,
	combout => \vga|r[3]~feeder_combout\);

-- Location: FF_X54_Y31_N5
\vga|r[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|r[3]~feeder_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|r\(3));

-- Location: LCCOMB_X51_Y31_N18
\vga|g[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|g[0]~feeder_combout\ = \vga|g~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \vga|g~1_combout\,
	combout => \vga|g[0]~feeder_combout\);

-- Location: FF_X51_Y31_N19
\vga|g[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|g[0]~feeder_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|g\(0));

-- Location: LCCOMB_X51_Y31_N20
\vga|g~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|g~2_combout\ = (\vga|blank~q\ & ((\vga|g~0_combout\) # ((!\vga|Mux0~4_combout\ & \vga|Timing_Circuit~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Mux0~4_combout\,
	datab => \vga|g~0_combout\,
	datac => \vga|Timing_Circuit~5_combout\,
	datad => \vga|blank~q\,
	combout => \vga|g~2_combout\);

-- Location: FF_X51_Y31_N21
\vga|g[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|g~2_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|g\(1));

-- Location: FF_X51_Y31_N15
\vga|g[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|g~1_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|g\(2));

-- Location: LCCOMB_X54_Y31_N14
\vga|g[3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|g[3]~feeder_combout\ = \vga|r~11_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vga|r~11_combout\,
	combout => \vga|g[3]~feeder_combout\);

-- Location: FF_X54_Y31_N15
\vga|g[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|g[3]~feeder_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|g\(3));

-- Location: LCCOMB_X51_Y31_N8
\vga|b~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|b~0_combout\ = (\vga|g~0_combout\) # ((\vga|r~3_combout\ & !\vga|Timing_Circuit~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vga|r~3_combout\,
	datac => \vga|g~0_combout\,
	datad => \vga|Timing_Circuit~13_combout\,
	combout => \vga|b~0_combout\);

-- Location: LCCOMB_X51_Y31_N0
\vga|b~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|b~1_combout\ = (\vga|blank~q\ & ((\vga|b~0_combout\) # ((\vga|r~2_combout\ & !\vga|r[0]~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|r~2_combout\,
	datab => \vga|blank~q\,
	datac => \vga|b~0_combout\,
	datad => \vga|r[0]~13_combout\,
	combout => \vga|b~1_combout\);

-- Location: FF_X51_Y31_N1
\vga|b[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|b~1_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|b\(0));

-- Location: LCCOMB_X54_Y31_N24
\vga|b~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|b~2_combout\ = (\vga|Timing_Circuit~11_combout\) # ((!\vga|Timing_Circuit~2_combout\ & (!\vga|Y\(6) & !\vga|Y\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Timing_Circuit~2_combout\,
	datab => \vga|Timing_Circuit~11_combout\,
	datac => \vga|Y\(6),
	datad => \vga|Y\(7),
	combout => \vga|b~2_combout\);

-- Location: LCCOMB_X54_Y31_N8
\vga|b~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|b~3_combout\ = (\vga|blank~q\ & ((\vga|g~0_combout\) # ((\vga|r~10_combout\ & \vga|b~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|blank~q\,
	datab => \vga|r~10_combout\,
	datac => \vga|g~0_combout\,
	datad => \vga|b~2_combout\,
	combout => \vga|b~3_combout\);

-- Location: FF_X54_Y31_N9
\vga|b[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|b~3_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|b\(1));

-- Location: LCCOMB_X54_Y31_N10
\vga|r[0]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|r[0]~12_combout\ = (\vga|r[0]~13_combout\ & (((\vga|LessThan22~0_combout\) # (\vga|Timing_Circuit~9_combout\)) # (!\vga|Timing_Circuit~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|r[0]~13_combout\,
	datab => \vga|Timing_Circuit~7_combout\,
	datac => \vga|LessThan22~0_combout\,
	datad => \vga|Timing_Circuit~9_combout\,
	combout => \vga|r[0]~12_combout\);

-- Location: LCCOMB_X54_Y31_N26
\vga|b~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|b~4_combout\ = (\vga|blank~q\ & ((\vga|g~0_combout\) # ((\vga|r~10_combout\ & !\vga|r[0]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|blank~q\,
	datab => \vga|r~10_combout\,
	datac => \vga|g~0_combout\,
	datad => \vga|r[0]~12_combout\,
	combout => \vga|b~4_combout\);

-- Location: FF_X54_Y31_N27
\vga|b[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|b~4_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|b\(2));

-- Location: FF_X54_Y31_N21
\vga|b[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|r~11_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|b\(3));

-- Location: LCCOMB_X50_Y35_N28
\vga|Equal2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Equal2~0_combout\ = (\vga|Add1~8_combout\ & (!\vga|Add1~6_combout\ & (!\vga|Add1~4_combout\ & \vga|Add1~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Add1~8_combout\,
	datab => \vga|Add1~6_combout\,
	datac => \vga|Add1~4_combout\,
	datad => \vga|Add1~14_combout\,
	combout => \vga|Equal2~0_combout\);

-- Location: LCCOMB_X50_Y35_N30
\vga|Equal2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Equal2~1_combout\ = (!\vga|Add1~0_combout\ & !\vga|Add1~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \vga|Add1~0_combout\,
	datad => \vga|Add1~2_combout\,
	combout => \vga|Equal2~1_combout\);

-- Location: LCCOMB_X46_Y33_N22
\vga|Equal2~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Equal2~2_combout\ = (!\vga|hcount~1_combout\ & (\vga|hcount~0_combout\ & (\vga|Equal2~0_combout\ & \vga|Equal2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|hcount~1_combout\,
	datab => \vga|hcount~0_combout\,
	datac => \vga|Equal2~0_combout\,
	datad => \vga|Equal2~1_combout\,
	combout => \vga|Equal2~2_combout\);

-- Location: LCCOMB_X46_Y33_N12
\vga|hs1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|hs1~0_combout\ = (\vga|Equal2~2_combout\ & ((\vga|hcount~2_combout\ & ((\vga|hs1~q\) # (\vga|Add1~12_combout\))) # (!\vga|hcount~2_combout\ & (\vga|hs1~q\ & \vga|Add1~12_combout\)))) # (!\vga|Equal2~2_combout\ & (((\vga|hs1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Equal2~2_combout\,
	datab => \vga|hcount~2_combout\,
	datac => \vga|hs1~q\,
	datad => \vga|Add1~12_combout\,
	combout => \vga|hs1~0_combout\);

-- Location: FF_X46_Y33_N13
\vga|hs1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|hs1~0_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|hs1~q\);

-- Location: LCCOMB_X46_Y33_N2
\vga|hs2~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|hs2~feeder_combout\ = \vga|hs1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vga|hs1~q\,
	combout => \vga|hs2~feeder_combout\);

-- Location: FF_X46_Y33_N3
\vga|hs2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|hs2~feeder_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|hs2~q\);

-- Location: LCCOMB_X46_Y33_N10
\vga|hs3~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|hs3~feeder_combout\ = \vga|hs2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vga|hs2~q\,
	combout => \vga|hs3~feeder_combout\);

-- Location: FF_X46_Y33_N11
\vga|hs3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|hs3~feeder_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|hs3~q\);

-- Location: LCCOMB_X46_Y33_N0
\vga|vga_hs~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|vga_hs~0_combout\ = !\vga|hs3~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vga|hs3~q\,
	combout => \vga|vga_hs~0_combout\);

-- Location: FF_X46_Y33_N1
\vga|vga_hs\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|vga_hs~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|vga_hs~q\);

-- Location: LCCOMB_X52_Y34_N22
\vga|Equal4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Equal4~0_combout\ = (\vga|vcount~0_combout\ & ((\vga|Equal0~2_combout\ & (\vga|Add0~14_combout\)) # (!\vga|Equal0~2_combout\ & ((\vga|Timing_Circuit:vcount[7]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Equal0~2_combout\,
	datab => \vga|vcount~0_combout\,
	datac => \vga|Add0~14_combout\,
	datad => \vga|Timing_Circuit:vcount[7]~q\,
	combout => \vga|Equal4~0_combout\);

-- Location: LCCOMB_X52_Y32_N12
\vga|Equal4~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Equal4~1_combout\ = (!\vga|vcount~5_combout\ & (!\vga|vcount~10_combout\ & (\vga|Equal4~0_combout\ & \vga|vcount~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|vcount~5_combout\,
	datab => \vga|vcount~10_combout\,
	datac => \vga|Equal4~0_combout\,
	datad => \vga|vcount~7_combout\,
	combout => \vga|Equal4~1_combout\);

-- Location: LCCOMB_X52_Y32_N14
\vga|Equal4~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|Equal4~2_combout\ = (\vga|Equal4~1_combout\ & (\vga|vcount~3_combout\ & (!\vga|vcount~6_combout\ & \vga|vcount~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|Equal4~1_combout\,
	datab => \vga|vcount~3_combout\,
	datac => \vga|vcount~6_combout\,
	datad => \vga|vcount~1_combout\,
	combout => \vga|Equal4~2_combout\);

-- Location: LCCOMB_X52_Y32_N26
\vga|vs1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|vs1~0_combout\ = (\vga|vcount~8_combout\ & ((\vga|vs1~q\) # ((\vga|Equal4~2_combout\ & !\vga|vcount~9_combout\)))) # (!\vga|vcount~8_combout\ & (\vga|vs1~q\ & ((!\vga|vcount~9_combout\) # (!\vga|Equal4~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vga|vcount~8_combout\,
	datab => \vga|Equal4~2_combout\,
	datac => \vga|vs1~q\,
	datad => \vga|vcount~9_combout\,
	combout => \vga|vs1~0_combout\);

-- Location: FF_X52_Y32_N27
\vga|vs1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|vs1~0_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|vs1~q\);

-- Location: LCCOMB_X52_Y32_N28
\vga|vs2~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|vs2~feeder_combout\ = \vga|vs1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \vga|vs1~q\,
	combout => \vga|vs2~feeder_combout\);

-- Location: FF_X52_Y32_N29
\vga|vs2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|vs2~feeder_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|vs2~q\);

-- Location: LCCOMB_X52_Y32_N18
\vga|vs3~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|vs3~feeder_combout\ = \vga|vs2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vga|vs2~q\,
	combout => \vga|vs3~feeder_combout\);

-- Location: FF_X52_Y32_N19
\vga|vs3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|vs3~feeder_combout\,
	ena => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|vs3~q\);

-- Location: LCCOMB_X52_Y32_N24
\vga|vga_vs~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vga|vga_vs~0_combout\ = !\vga|vs3~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vga|vs3~q\,
	combout => \vga|vga_vs~0_combout\);

-- Location: FF_X52_Y32_N25
\vga|vga_vs\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \vga|pll|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \vga|vga_vs~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|vga_vs~q\);

-- Location: IOIBUF_X49_Y54_N29
\KEY[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~GND~combout\,
	xe_ye => \~GND~combout\,
	se => \~GND~combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~GND~combout\,
	usr_pwd => VCC,
	tsen => \~GND~combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~GND~combout\,
	usr_pwd => VCC,
	tsen => \~GND~combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);
END structure;


