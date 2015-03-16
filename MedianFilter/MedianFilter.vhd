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
			  green_i : in  STD_LOGIC_VECTOR (9 downto 0);
           red_i : in  STD_LOGIC_VECTOR (9 downto 0);
           blue_i : in  STD_LOGIC_VECTOR (9 downto 0);
           pixel_val_o : out  STD_LOGIC);
end MedianFilter;

architecture Behavioral of MedianFilter is

signal kernel : std_logic_vector (N-1 downto 0) := (others => '0');
signal pixel_val : std_logic := '0';
signal sum_t : unsigned(N/2 downto 0);
constant meanPixelVal : integer := 512;
begin
	-- TODO: replace with real adc reading
	adc_read_colors: process ( CLK_pixel )								
	begin
		if( falling_edge(CLK_pixel) ) then 
			if(unsigned(green_i) > meanPixelVal or unsigned(green_i) > meanPixelVal or 
				unsigned(blue_i) > meanPixelVal ) then
				pixel_val <= '1';
			else
				pixel_val <= '0';
			end if;		
		end if;
	end process;
						
								
	filter : process ( CLK_pixel )
		constant nHalf : natural := N/2;
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
end Behavioral;