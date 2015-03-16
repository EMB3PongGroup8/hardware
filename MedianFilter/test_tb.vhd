--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:06:19 03/16/2015
-- Design Name:   
-- Module Name:   E:/Documents/GitHub/hardware/MedianFilter/test_tb.vhd
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
 
ENTITY test_tb IS
END test_tb;
 
ARCHITECTURE behavior OF test_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MedianFilter
    PORT(
         CLK_pixel : IN  std_logic;
         green_i : IN  std_logic_vector(9 downto 0);
         red_i : IN  std_logic_vector(9 downto 0);
         blue_i : IN  std_logic_vector(9 downto 0);
         pixel_val_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_pixel : std_logic := '0';
   signal green_i : std_logic_vector(9 downto 0) := (others => '0');
   signal red_i : std_logic_vector(9 downto 0) := (others => '0');
   signal blue_i : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal pixel_val_o : std_logic;

   -- Clock period definitions
   constant CLK_pixel_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MedianFilter PORT MAP (
          CLK_pixel => CLK_pixel,
          green_i => green_i,
          red_i => red_i,
          blue_i => blue_i,
          pixel_val_o => pixel_val_o
        );

   -- Clock process definitions
   CLK_pixel_process :process
   begin
		CLK_pixel <= '0';
		wait for CLK_pixel_period/2;
		CLK_pixel <= '1';
		wait for CLK_pixel_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_pixel_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
