----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:07:15 03/17/2015 
-- Design Name: 
-- Module Name:    top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
	port(
		CLK200M_i : in std_logic;
		vga_vsync_i : in std_logic;
		vga_hsync_i : in std_logic;
		vga_vsync_o : out std_logic;
		vga_hsync_o : out std_logic;
		adc_clk : out std_logic_vector(2 downto 0);
		adc_red : in std_logic_vector(9 downto 0);
		adc_green : in std_logic_vector(9 downto 0);
		adc_blue : in std_logic_vector(9 downto 0);
		vga_red_o : out std_logic_vector(2 downto 0);
		vga_green_o : out std_logic_vector(2 downto 0);
		vga_blue_o : out std_logic_vector(2 downto 0)		
		);
end top;

architecture Behavioral of top is

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
	
	COMPONENT vga_generator
	PORT(
		pixel_clk : IN std_logic;
		red : IN std_logic_vector(9 downto 0);
		green : IN std_logic_vector(9 downto 0);
		blue : IN std_logic_vector(9 downto 0);          
		R : OUT std_logic_vector(2 downto 0);
		G : OUT std_logic_vector(2 downto 0);
		B : OUT std_logic_vector(2 downto 0);
		Hsync : OUT std_logic;
		Vsync : OUT std_logic
		);
	END COMPONENT;

	component CLK_25M17
	port
	 (-- Clock in ports
	  CLK_IN1           : in     std_logic;
	  -- Clock out ports
	  CLK_OUT1          : out    std_logic
	 );
	end component;
signal CLK_pixel : std_logic;
signal pixel_val : std_logic;
signal Vsync : std_logic;
signal Hsync : std_logic;
signal red, green, blue : std_logic_vector(9 downto 0);

begin
	-- Instantiate the Unit Under Test (UUT)
	filter: MedianFilter PORT MAP(
		CLK_pixel => CLK_pixel,
		pixel_val_o => pixel_val,
		Vsync_i => vga_vsync_i,
		Hsync_i => vga_hsync_i,
		Vsync_o => Vsync,
		Hsync_o => Hsync,
		adc_clk => open,
		adc_red => red,
		adc_green => green,
		adc_blue => blue
	);

	Inst_vga_generator: vga_generator PORT MAP(
		pixel_clk => CLK_pixel,
		red => red,
		green => green,
		blue => blue,
		R => vga_red_o,
		G => vga_green_o,
		B => vga_blue_o,
		Hsync => vga_hsync_o,
		Vsync => vga_vsync_o
	);
	adc_clk(0) <= CLK_pixel;
	adc_clk(1) <= CLK_pixel;
	adc_clk(2) <= CLK_pixel;
	
	pixel_clk_scale:
process(CLK200M_i)
  constant half_period : integer := 4; --ceil(200000000 / 25175000 / 2)
  variable count       : integer range 0 to half_period := 0;
begin
  if (rising_edge(CLK200M_i) ) then
		count := count + 1;
		if (count = half_period) then
			 CLK_pixel <= not CLK_pixel;
			 count := 0;
		end if;
  end if;
end process;
	
--	pixel_clk_generator : CLK_25M17
--  port map
--   (-- Clock in ports
--    CLK_IN1 => CLK200M_i,
--    -- Clock out ports
--    CLK_OUT1 => CLK_pixel);
end Behavioral;

