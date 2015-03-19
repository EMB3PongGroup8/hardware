----------------------------------------------------------------------------------
-- Company: University of Southern Denmark
-- Engineer: Anders Blaabjerg Lange
-- 
-- Create Date:    10:51:02 02/10/2014 
-- Design Name: 
-- Module Name:    vga_generator - Behavioral 
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
library ieee;
USE ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity vga_generator is
	generic(
		G_COLOR_WIDTH  : integer := 10;
		G_PXL_CLK_PRD	: time := 39721946 fs
	);
	port ( 
		r_o  : out std_logic_vector (G_COLOR_WIDTH-1 downto 0);
		g_o  : out std_logic_vector (G_COLOR_WIDTH-1 downto 0);
		b_o  : out std_logic_vector (G_COLOR_WIDTH-1 downto 0);
		hs_o : out std_logic;
		vs_o : out std_logic
	);
end vga_generator;

architecture Behavioral of vga_generator is

	-----------------------------------------
	-- Industry Standard VGA (640x480 @60Hz)
	--
	-- General characteristics:
	--
	--		Clock frequency 25.175 MHz 
	--		Line  frequency 31468.8 Hz 
	--		Frame frequency 59.94 Hz
	--
	
	--
	--	One line 
	-- 	 16 pixels front porch 		(a)
	-- 	 96 pixels horizontal sync (b)
	-- 	 48 pixels back porch  		(c)
	--		640 pixels video 				(d)
	--	  --------------------------
	--		800 pixels total per line 	(l)
	--
	--	Timing diagram:
	--              _____________________             ___________________
	--	____________<________VIDEO________>___________<__VIDEO (next line) 
	--	 	     |-c-|----------d----------|
	--	__       ___________________________       ___________ 
	--	  |_____|	  							   |_____| 
	--	  |--b--| 								 |a|
	--	  |---------------l-----------------| 	
	--
	-- if we count pixels from the falling edge of the HS then there is 144 blank pixels before the first visible pixel
		
	signal C_H_FP : integer := 16;
	signal C_H_SP : integer := 96;
	signal C_H_BP : integer := 48;
	signal C_H_PX : integer := 640;
	
	signal C_HS_OFFSET : integer := C_H_SP+C_H_BP;	
	signal C_PIXEL_PR_LINE : integer := C_H_FP+C_H_SP+C_H_BP+C_H_PX;
	
	--
	--	One frame 
	-- 	 10 lines front porch 		(A)
	-- 	  2 lines vertical sync 	(B)
	-- 	 33 lines back porch 		(C)
	--		480 lines video 				(D)
	--	  --------------------------
	--		525 lines total per frame  (E)
	--
	--	Timing diagram:
	--              _____________________             ___________________
	--	____________<________VIDEO________>___________<__VIDEO (next frame) 
	--	 	   |--C--|----------D----------|     
	--	____   _______________________________   ___________ 
	--	    |_|	  							        |_| 
	--	    |B| 								  	 |-A-|
	--	    |---------------F-----------------| 
	--
	-- if we count lines from the falling edge of the VS then there is 35 blank lines before the first visible line.	
	signal C_V_FP : integer := 10;
	signal C_V_SP : integer := 2;
	signal C_V_BP : integer := 33;
	signal C_V_LN : integer := 480;
	
	signal C_VS_OFFSET : integer := C_V_SP+C_V_BP;	
	signal C_LINES_PR_FRAME : integer := C_V_FP+C_V_SP+C_V_BP+C_V_LN;	
	
	signal pxl_clk			: std_logic;
	
	signal pixel_cnt_reg : unsigned(9 downto 0) := (others=>'0');
	signal pixel_cnt_nxt : unsigned(9 downto 0);
	
	
	signal line_cnt_reg : unsigned(9 downto 0) := (others=>'0');
	signal line_cnt_nxt : unsigned(9 downto 0);
	

	-- Left bat: 20x100 pixels, centered in the left visible part of the screen at x=20
	--
	-- top-left corner @(20,189)     -> plus offset -> (164,224) 
	-- top-right corner @(39,189)    -> plus offset -> (183,224) 
	-- bottom-left corner @(20,288)  -> plus offset -> (164,323) 
	-- bottom-right corner @(39,288) -> plus offset -> (183,323)
	constant C_LBAT_X1 : integer := 20;
	constant C_LBAT_X2 : integer := 39;
	constant C_LBAT_Y1 : integer := 189;
	constant C_LBAT_Y2 : integer := 288;

	-- Ball: 20x20 pixels, centered in the visible part of the screen
	--
	-- top-left corner @(310,230)     -> plus offset -> (454,265) 
	-- top-right corner @(329,230)    -> plus offset -> (473,265) 
	-- bottom-left corner @(310,249)  -> plus offset -> (454,284) 
	-- bottom-right corner @(329,249) -> plus offset -> (473,284)
	signal C_BALL_X1 : integer := 310;
	signal C_BALL_X2 : integer := 329;
	constant C_BALL_Y1 : integer := 230;
	constant C_BALL_Y2 : integer := 249;

	-- Right bat: 20x100 pixels, centered in the right visible part of the screen at x=640-40 = 600
	--
	-- top-left corner @(600,189)     -> plus offset -> (744,224) 
	-- top-right corner @(619,189)    -> plus offset -> (763,224) 
	-- bottom-left corner @(600,288)  -> plus offset -> (744,323) 
	-- bottom-right corner @(619,288) -> plus offset -> (763,323)
	constant C_RBAT_X1 : integer := 600;
	constant C_RBAT_X2 : integer := 619;
	constant C_RBAT_Y1 : integer := 189;
	constant C_RBAT_Y2 : integer := 288;
--	constant C_RBAT_Y1 : integer := 20;
--	constant C_RBAT_Y2 : integer := 119;

--	component vga_reader is
--		 Port ( CLK_200M_i : in  STD_LOGIC;
--				  red_in : in  STD_LOGIC_VECTOR (9 downto 0);
--				  green_in : in  STD_LOGIC_VECTOR (9 downto 0);
--				  blue_in : in  STD_LOGIC_VECTOR (9 downto 0);
--				  hsync : in  STD_LOGIC;
--				  vsync : in  STD_LOGIC);
--	end component;

begin

--	reader : vga_reader
--	port map  (
--		CLK_200M_i <= clk_200M_i,
--	  red_in <= red_i,
--	  green_in <= green_i,
--	  blue_in <= blue_i,
--	  hsync <= hsync_i,
--	  vsync <= vsync_i);
--
--	);
	
	-- pixel clock generator
	process
	begin
		pxl_clk <= '0';
		wait for G_PXL_CLK_PRD/2;
		pxl_clk <= '1';
		wait for G_PXL_CLK_PRD/2;
	end process;
	
	-- HS and VS generator
	process(pxl_clk)
	begin
		if rising_edge(pxl_clk) then		
			pixel_cnt_reg <= pixel_cnt_nxt;
			line_cnt_reg <= line_cnt_nxt;
--			if(line_cnt_reg = "0000000000" and pixel_cnt_reg = "0000000000") then
--				C_BALL_X1 <= C_BALL_X1 + 30;
--				C_BALL_X2 <= C_BALL_X2 + 30;
--			end if;
		end if;
	end process;
	
	pixel_cnt_nxt <= pixel_cnt_reg+1 when pixel_cnt_reg<C_PIXEL_PR_LINE-1 else (others=>'0');
	line_cnt_nxt <= line_cnt_reg+1 when pixel_cnt_reg=C_PIXEL_PR_LINE-1 and line_cnt_reg<C_LINES_PR_FRAME-1 else 
						 (others=>'0')  when pixel_cnt_reg=C_PIXEL_PR_LINE-1 else
						 line_cnt_reg;
	
	hs_o <= '0' when pixel_cnt_reg < C_H_SP else '1';
	vs_o <= '0' when line_cnt_reg < C_V_SP else '1';
	
	-- left bat output
	g_o <= (others=>'1') when (pixel_cnt_reg >= (C_LBAT_X1+C_HS_OFFSET) and 
										pixel_cnt_reg <= (C_LBAT_X2+C_HS_OFFSET) and 
										line_cnt_reg  >= (C_LBAT_Y1+C_VS_OFFSET) and 
										line_cnt_reg  <= (C_LBAT_Y2+C_VS_OFFSET)) else
			 (others=>'0');

	-- ball bat output
	r_o <= (others=>'1') when (pixel_cnt_reg >= (C_BALL_X1+C_HS_OFFSET) and 
										pixel_cnt_reg <= (C_BALL_X2+C_HS_OFFSET) and 
										line_cnt_reg  >= (C_BALL_Y1+C_VS_OFFSET) and 
										line_cnt_reg  <= (C_BALL_Y2+C_VS_OFFSET)) else
			 (others=>'0');

	-- right bat output
	b_o <= (others=>'1') when (pixel_cnt_reg >= (C_RBAT_X1+C_HS_OFFSET) and 
										pixel_cnt_reg <= (C_RBAT_X2+C_HS_OFFSET) and 
										line_cnt_reg  >= (C_RBAT_Y1+C_VS_OFFSET) and 
										line_cnt_reg  <= (C_RBAT_Y2+C_VS_OFFSET)) else
			 (others=>'0');
	

end Behavioral;
