--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:47:08 03/16/2015
-- Design Name:   
-- Module Name:   E:/Documents/GitHub/hardware/MedianFilter/medianFilter_tb.vhd
-- Project Name:  MedianFilter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MedianFilter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY medianFilter_tb IS
END medianFilter_tb;
 
ARCHITECTURE behavior OF medianFilter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
	COMPONENT MedianFilter
	PORT(
		CLK_pixel : IN std_logic;
		Vsync_i : IN std_logic;
		Hsync_i : IN std_logic;
		adc_red : IN std_logic_vector(9 downto 0);
		adc_green : IN std_logic_vector(9 downto 0);
		adc_blue : IN std_logic_vector(9 downto 0);          
		pixel_val_o : OUT std_logic;
		Vsync_o : OUT std_logic;
		Hsync_o : OUT std_logic;
		adc_clk : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;
    

   --Inputs
   signal CLK_pixel : std_logic := '0';
   signal green_i : std_logic_vector(9 downto 0) := (others => '0');
   signal red_i : std_logic_vector(9 downto 0) := (others => '0');
   signal blue_i : std_logic_vector(9 downto 0) := (others => '0');
	signal Vsync_i : std_logic;
	signal Hsync_i : std_logic;
	signal Hsync_o : std_logic;
	signal Vsync_o : std_logic;
	signal adc_clk : std_logic_vector(2 downto 0);
 	--Outputs
   signal pixel_val_o : std_logic;

   -- Clock period definitions
	constant G_PXL_CLK_PRD	: time := 39721946 fs;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	uut: MedianFilter PORT MAP(
		CLK_pixel => CLK_pixel,
		pixel_val_o => pixel_val_o,
		Vsync_i => Vsync_i,
		Hsync_i => Hsync_i,
		Vsync_o => Vsync_o,
		Hsync_o => Hsync_o,
		adc_clk => adc_clk,
		adc_red => red_i,
		adc_green => green_i,
		adc_blue => blue_i
	);
	
		-- pixel clock generator
	process
	begin
		CLK_pixel <= '0';
		wait for G_PXL_CLK_PRD/2;
		CLK_pixel <= '1';
		wait for G_PXL_CLK_PRD/2;
	end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

      wait for G_PXL_CLK_PRD;
		green_i <= (others => '0');
		red_i <= (others => '0');
		blue_i <= (others => '0');
		Vsync_i <= '0';
		Hsync_i <= '0';
		wait for G_PXL_CLK_PRD*2;
		green_i <= (others => '0');
		red_i <= (others => '0');
		blue_i <= (others => '0');
		Vsync_i <= '0';
		Hsync_i <= '0';
		wait for G_PXL_CLK_PRD*2;
		green_i <= (others => '1');
		red_i <= (others => '1');
		blue_i <= (others => '1');
		Vsync_i <= '1';
		Hsync_i <= '1';
		wait for G_PXL_CLK_PRD*10;
      -- insert stimulus here 
		
      -- wait;
   end process;

END;
