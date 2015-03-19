----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:25:54 02/23/2015 
-- Design Name: 
-- Module Name:    ADC - Behavioral 
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

entity ADC is
    Port ( pixel_clk : 			  in  STD_LOGIC;
           Clk_adc : 	  out  STD_LOGIC;
			  VGA_Data : 	  in  STD_LOGIC_VECTOR (9 downto 0);
			  VGA_Data_out : out  STD_LOGIC_VECTOR (9 downto 0)
			 );
end ADC;

architecture Behavioral of ADC is

begin

process(pixel_clk)
begin
	if( falling_edge(pixel_clk) ) then
		VGA_data_out <= VGA_data;		
	end if;
end process;

Clk_adc <= pixel_clk; 

end Behavioral;

