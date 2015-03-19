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
-- USE IEEE.STD_LOGIC_ARITH.ALL; -- for conv_std_logic_vector, converts everything to unsigned
use IEEE.numeric_std.all;

entity ping_pong_decoder is
    Port ( CLK_pixel : in  STD_LOGIC;
           pixel_val : in  STD_LOGIC;
           hsync : in  STD_LOGIC;
           vsync : in  STD_LOGIC;
           rightBatVPos : out  STD_LOGIC_VECTOR (8 downto 0);
           leftBatVPos : out  STD_LOGIC_VECTOR (8 downto 0);
           ballVPos_o : out  STD_LOGIC_VECTOR (8 downto 0);
           ballHPos_o : out  STD_LOGIC_VECTOR (9 downto 0);
			  green : out std_logic_vector(9 downto 0);
			  red : out std_logic_vector(9 downto 0);
			  blue : out std_logic_vector(9 downto 0)
			  );
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
	constant HRightBatTopLeft : integer := 600 + HBP;
	
begin

	process(Vsync, Hsync, CLK_pixel)
		variable Hcount: Integer Range 0 to HBP + Hactive := 0;
		variable Vcount: Integer Range 0 to VBP + Vactive := 0;
		variable rightBatDetected : boolean := false;
		variable leftBatDetected : boolean := false;
		variable ballDetected : boolean := false;	
		variable prevBallVPos : integer Range -Vactive to Vactive := 0;
		variable prevBallHPos : integer Range -Hactive to Hactive := 0;
		variable ballVPos : integer Range -Vactive to Vactive := 0;
		variable ballHPos : integer Range -Hactive to Hactive := 0;
	begin
		--react to Vsync
		if(rising_edge(Vsync)) then
			prevBallVPos := ballVPos;
			prevBallHPos := ballHPos;
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
			green <= (others => '0');
			red <= (others => '0');
			blue <= (others => '0');
			
			-- Within the picture
			if( Hcount >= HLeftBatTopLeft and Hcount <= HLeftBatTopLeft + HBatWidth and pixel_val = '1' ) then -- top left corner=20+BHP=68  Hcount <= 200 and 
				green <= (others => '1');				
				if (leftBatDetected = false) then
					leftBatVPos <= std_logic_vector(to_unsigned(Vcount - VBP, 9)); -- strange with 45 since C_VS_OFFSET=35 and Vcount is the same as line_cnt_reg all the time???
					--leftBatVPos <= conv_std_logic_vector(Vcount-5, 10); -- center of bat minus offset and half ball side -(35-50-10)					
					leftBatDetected := true;
				end if;
			end if;
			if( Hcount >= HRightBatTopLeft and Hcount <= HRightBatTopLeft + HBatWidth and pixel_val = '1' ) then -- top left corner=600+BHP=648
				red <= (others => '1');
				if(rightBatDetected = false) then				
					--rightBatVPos <= conv_std_logic_vector(Vcount-5, 10); -- center of bat minus offset and half ball side				
					rightBatVPos <= std_logic_vector(to_unsigned(Vcount - VBP, 9));
					rightBatDetected := true;
				end if;
			end if;
			if( Hcount > HLeftBatTopLeft + HBatWidth and Hcount < HRightBatTopLeft and pixel_val = '1' ) then
				green <= std_logic_vector(to_unsigned((ballVPos - prevBallVPos)*2,10));
				red <= std_logic_vector(to_unsigned((ballHPos - prevBallHPos)*2,10));
				blue <= (others => '1');
				if ballDetected = false then 				
					ballVPos := Vcount - VBP;
					ballHPos := Hcount - HBP;
					ballVPos_o <= std_logic_vector(to_unsigned(ballVPos, 9));
					ballHPos_o <= std_logic_vector(to_unsigned(ballHPos, 10));				
					-- ballHPos <= conv_std_logic_vector(Hcount-(48-10), 10);
					ballDetected := true;			
				end if;
			end if;			
		end if;
	end process;
end Behavioral;

