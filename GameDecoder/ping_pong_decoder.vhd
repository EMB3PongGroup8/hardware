----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:28:20 03/12/2015 
-- Design Name: 	
-- Module Name:    ping_pong_decoder - Behavioral 
-- Project Name: 	 pong game
-- Target Devices: spartan 6
-- Tool versions: 
-- Description: 
--
-- Dependencies: 	pixel_clk_generator
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL; -- for conv_std_logic_vector, converts everything to unsigned

entity ping_pong_decoder is
    Port ( CLK_pixel : in  STD_LOGIC;
           pixel_val : in  STD_LOGIC;
           hsync : in  STD_LOGIC;
           vsync : in  STD_LOGIC;
           rightBatVPos : out  STD_LOGIC_VECTOR (8 downto 0);
           leftBatVPos : out  STD_LOGIC_VECTOR (8 downto 0);
           ballVPos : out  STD_LOGIC_VECTOR (8 downto 0);
           ballHPos : out  STD_LOGIC_VECTOR (9 downto 0));
end ping_pong_decoder;

architecture Behavioral of ping_pong_decoder is
	constant HBP : integer := 48;
	constant Hactive : integer := 640;
	-- Vertical constants
	constant VBP : integer := 33;
	constant Vactive : integer := 480;
	-- Bat and ball constants
	constant HBatWidth : integer := 20;
	constant HLeftBatTopLeft : integer := 20 + HBP;	
	constant HLeftBatTopRight : integer := HLeftBatTopLeft + HBatWidth;
	constant HRightBatTopRight : integer := 600 + HBP;
	
begin

	process(Vsync, Hsync, CLK_pixel)
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

		if (rising_edge(Hsync)) then -- rising_edge on Hsync
			Hcount := 0;
			Vcount := Vcount+1;
		end if;
		
		if(rising_edge(CLK_pixel)) then
			Hcount := Hcount + 1;
		end if;
		
		if((rising_edge(CLK_pixel)) and 
			(Hcount >= HBP) and -- clocks after h sync high 
			(Hcount <=  HBP + Hactive) and -- 784 - 96
			(Vcount >= VBP) and 
			(Vcount <  VBP + Vactive)
			) then
			-- Within the picture
			if (leftBatDetected = false) then
				if( Hcount >= HLeftBatTopLeft and Hcount <= HLeftBatTopLeft + HBatWidth and pixel_val = '1' ) then -- top left corner=20+BHP=68  Hcount <= 200 and 
					leftBatVPos <= conv_std_logic_vector(Vcount - VBP, 9); -- strange with 45 since C_VS_OFFSET=35 and Vcount is the same as line_cnt_reg all the time???
					--leftBatVPos <= conv_std_logic_vector(Vcount-5, 10); -- center of bat minus offset and half ball side -(35-50-10)
					leftBatDetected := true;
				end if;
			end if;
			
			if(rightBatDetected = false) then
				if( Hcount >= HRightBatTopRight and Hcount <= HRightBatTopRight + HBatWidth and pixel_val = '1' ) then -- top left corner=600+BHP=648
					--rightBatVPos <= conv_std_logic_vector(Vcount-5, 10); -- center of bat minus offset and half ball side				
					rightBatVPos <= conv_std_logic_vector(Vcount - VBP, 9);
					rightBatDetected := true;
				end if;
			end if;
			
			if ballDetected = false then 
			-- left bat, top right of  corner=39+BHP=87
			-- right bat, top right bat corner= 619+BHP=667
				if( Hcount > HLeftBatTopLeft + HBatWidth and Hcount < HRightBatTopRight and pixel_val = '1' ) then
					ballVPos <= conv_std_logic_vector(Vcount - VBP, 9);
					ballHPos <= conv_std_logic_vector(Hcount-HBP, 10);
					-- ballHPos <= conv_std_logic_vector(Hcount-(48-10), 10);
					ballDetected := true;			
				end if;
			end if;
			
		end if;
	end process;
	

end Behavioral;

