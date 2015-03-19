----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:57 03/16/2015 
-- Design Name: 
-- Module Name:    MedianFilter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MedianFilter is
	 generic ( N : positive := 5);
    Port ( CLK_pixel : in std_logic;
           pixel_val_o : out  STD_LOGIC;
			  Vsync_i : in std_logic;
			  Hsync_i : in std_logic;
			  Vsync_o : out std_logic;
			  Hsync_o : out std_logic;
			  adc_clk : out std_logic_vector(2 downto 0);
			  adc_red : in std_logic_vector(9 downto 0);
			  adc_green : in std_logic_vector(9 downto 0);
			  adc_blue : in std_logic_vector(9 downto 0)
			  );
end MedianFilter;

architecture Behavioral of MedianFilter is

COMPONENT ADC
PORT(
	pixel_clk : IN std_logic;
	VGA_Data : IN std_logic_vector(9 downto 0);          
	Clk_adc : OUT std_logic;
	VGA_Data_out : OUT std_logic_vector(9 downto 0)
	);
END COMPONENT;

signal kernel : std_logic_vector (N-1 downto 0) := (others => '0');
signal pixel_val : std_logic := '0';
signal sum_t : unsigned(N/2 downto 0);
constant meanPixelVal : integer := 512;
constant nHalf : natural := N/2;

signal shift_hsync : std_logic_vector(2 downto 0) := (others => '0');
signal shift_vsync : std_logic_vector(2 downto 0) := (others => '0');

signal green_i :  STD_LOGIC_VECTOR (9 downto 0);
signal red_i :  STD_LOGIC_VECTOR (9 downto 0);
signal blue_i :  STD_LOGIC_VECTOR (9 downto 0);

begin

	red_ADC: ADC PORT MAP(
		pixel_clk => CLK_pixel,
		Clk_adc => adc_clk(0),
		VGA_Data => adc_red,
		VGA_Data_out => red_i
	);

	green_ADC: ADC PORT MAP(
		pixel_clk => CLK_pixel,
		Clk_adc => adc_clk(1),
		VGA_Data => adc_green,
		VGA_Data_out => green_i
	);
		
	blue_ADC: ADC PORT MAP(
		pixel_clk => CLK_pixel,
		Clk_adc => adc_clk(2),
		VGA_Data => adc_blue,
		VGA_Data_out => blue_i
	);

	pixel_val <= 	'1' when unsigned(green_i) > meanPixelVal or unsigned(red_i) > meanPixelVal or 
									unsigned(blue_i) > meanPixelVal  else
						'0';
	
	filter : process ( CLK_pixel )		
		variable sum : unsigned(nHalf downto 0) := (others => '0');		
	begin
		if( rising_edge(CLK_pixel) ) then			
			if(kernel(N-1) = '1') then
				sum := sum - 1;
			end if;
			if(pixel_val = '1') then
				sum := sum + 1;
			end if;
			if( sum > N/2 ) then 
				pixel_val_o <= '1';
			else
				pixel_val_o <= '0';		
			end if;
			sum_t <= sum;
			kernel <= kernel(N-2 downto 0) & pixel_val;						
		end if;
	end process;
	
	delay_sync : process( CLK_pixel)
	begin
		if( rising_edge( CLK_pixel) ) then
			shift_hsync <= shift_hsync(nHalf-1 downto 0) & Hsync_i;
			shift_vsync <= shift_vsync(nHalf-1 downto 0) & Vsync_i;
			Hsync_o <= shift_hsync(nHalf-1);
			Vsync_o <= shift_vsync(nHalf-1);
		end if;	
	end process;
	
end Behavioral;

