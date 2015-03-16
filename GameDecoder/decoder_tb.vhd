--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:23:22 03/16/2015
-- Design Name:   
-- Module Name:   E:/Documents/GitHub/EMB3_ping_pong/GameDecoder/decoder_tb.vhd
-- Project Name:  GameDecoder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ping_pong_decoder
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
--use ieee.numeric_std_unsigned.all;  -- add constant to std_logic_vector
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY decoder_tb IS
END decoder_tb;
 
ARCHITECTURE behavior OF decoder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ping_pong_decoder
    PORT(
         CLK_pixel : IN  std_logic;
         pixel_val : IN  std_logic;
         hsync : IN  std_logic;
         vsync : IN  std_logic;
         rightBatVPos : OUT  std_logic_vector(8 downto 0);
         leftBatVPos : OUT  std_logic_vector(8 downto 0);
         ballVPos : OUT  std_logic_vector(8 downto 0);
         ballHPos : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT vga_generator
    PORT(
         r_o : OUT  std_logic_vector(9 downto 0);
         g_o : OUT  std_logic_vector(9 downto 0);
         b_o : OUT  std_logic_vector(9 downto 0);
         hs_o : OUT  std_logic;
         vs_o : OUT  std_logic
        );
    END COMPONENT;
	 
--	 component CLK_gen_25M17
--	port
--	 (-- Clock in ports
--	  CLK_200M_i           : in     std_logic;
--	  -- Clock out ports
--	  CLK_25M17          : out    std_logic
--	 );
--	end component;
	 
	--Inputs
	signal red : std_logic_vector(9 downto 0) := (others => '0');
   signal green : std_logic_vector(9 downto 0) := (others => '0');
   signal blue : std_logic_vector(9 downto 0) := (others => '0');
   signal CLK_pixel : std_logic := '0';
   signal pixel_val : std_logic := '0';
   signal hsync : std_logic := '0';
   signal vsync : std_logic := '0';
	
 	--Outputs
   signal rightBatVPos : std_logic_vector(8 downto 0);
   signal leftBatVPos : std_logic_vector(8 downto 0);
   signal ballVPos : std_logic_vector(8 downto 0);
   signal ballHPos : std_logic_vector(9 downto 0);
	
	constant meanPixelVal : integer := 512;
	constant G_PXL_CLK_PRD	: time := 39721946 fs;
BEGIN
	
		-- pixel clock generator
	process
	begin
		CLK_pixel <= '0';
		wait for G_PXL_CLK_PRD/2;
		CLK_pixel <= '1';
		wait for G_PXL_CLK_PRD/2;
	end process;
	
		-- Instantiate the Unit Under Test (UUT)
   generator: vga_generator PORT MAP (
          r_o => red,
          g_o => green,
          b_o => blue,
          hs_o => hsync,
          vs_o => vsync
        );
		  
	pixel_val 	<= '1' 	when (unsigned(red) > meanPixelVal or unsigned(green) > meanPixelVal or  unsigned(blue) > meanPixelVal )else 
						'0';
	
	-- Instantiate the Unit Under Test (UUT) 	pixel_val 	<= '1' 	when  > 1534 else 

   uut: ping_pong_decoder PORT MAP (
          CLK_pixel => CLK_pixel,
          pixel_val => pixel_val,
          hsync => hsync,
          vsync => vsync,
          rightBatVPos => rightBatVPos,
          leftBatVPos => leftBatVPos,
          ballVPos => ballVPos,
          ballHPos => ballHPos
        );

   -- Stimulus process
   stim_proc: process
   begin		

      -- insert stimulus here 

      wait;
   end process;

END;
