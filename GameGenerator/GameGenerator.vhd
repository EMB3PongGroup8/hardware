----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:23:59 03/17/2015 
-- Design Name: 
-- Module Name:    GameGenerator - Behavioral 
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

entity GameGenerator is
    Port ( 	pixel_val;
				ballRegion;
				
			  );
end GameGenerator;

architecture Behavioral of GameGenerator is

begin
	generate_game : process
		variable Hcount: Integer Range 0 to HBP + Hactive := 0;
		variable Vcount: Integer Range 0 to VBP + Vactive := 0;
		variable rightBatDetected : boolean := false;
		variable leftBatDetected : boolean := false;
		variable ballDetected : boolean := false;	
	begin
		--react to Vsync
		if(rising_edge(Vsync)) then
			Vcount := 0;
		end if;
	end process;

end Behavioral;

