----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:18:01 02/21/2015 
-- Design Name: 
-- Module Name:    vga_reader - Behavioral 
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
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_generator is
	 Generic(
			Ha : integer := 96;
			Hb : integer := 144;
			Hc : integer := 784;
			Hd : integer := 800;	
			Va : integer := 2;
			Vb : integer := 35;
			Vc : integer := 515;
			Vd : integer := 525);
    Port ( 
			pixel_clk : in  STD_LOGIC;
			red : in std_logic_vector(9 downto 0);
			green : in std_logic_vector(9 downto 0);
			blue : in std_logic_vector(9 downto 0);
			R : out  STD_LOGIC_VECTOR (2 downto 0);
         G : out  STD_LOGIC_VECTOR (2 downto 0);
         B : out  STD_LOGIC_VECTOR (2 downto 0);
			--pixel_clk : buffer  STD_LOGIC;
			Hsync : buffer  STD_LOGIC;
			Vsync : buffer  STD_LOGIC);
end vga_generator;

architecture Behavioral of vga_generator is

--control signals
signal Hactive, Vactive, dena: STD_LOGIC;

--color
signal GrayScale : STD_LOGIC_VECTOR (4 downto 0) := "00000";

begin
------------------
--		Control
------------------
process(pixel_clk)
variable Hcount: Integer Range 0 to Hd;
begin
	if(rising_edge(pixel_clk) ) then
	Hcount := Hcount+1;
		if (Hcount=Ha) then
			Hsync <= '1';
		elsif (Hcount=Hb) then
			Hactive <= '1';
		elsif (Hcount=Hc) then
			Hactive <= '0';
		elsif (Hcount=Hd) then
			Hsync <= '0';
			Hcount := 0;
		end if;
	end if;
end process;
		
process(Hsync)
variable Vcount: Integer Range 0 to Vd;
begin
	if(falling_edge(Hsync) ) then
		Vcount := Vcount + 1;
		if (Vcount=Va) then
			Vsync <= '1';
		elsif (Vcount=Vb) then
			Vactive <= '1';
		elsif (Vcount=Vc) then
			Vactive <= '0';
		elsif (Vcount=Vd) then
			Vsync <= '0';
			Vcount := 0;
		end if;
	end if;
end process;

dena <= Hactive and Vactive;
------------------
--		Control end
------------------

--
--R <= red(9 downto 7) when dena = '1' else "000";
--G <= green(9 downto 7) when dena = '1' else "000";
--B <= blue(9 downto 7) when dena = '1' else "000";

Process(Hsync)
begin
	if(GrayScale = "11111") then
		GrayScale <= "00000";
	elsif(rising_edge(Hsync)) then
		GrayScale <= GrayScale+1;
	end if;
	if(rising_edge(Vactive)) then
		GrayScale <= (others => '0');
	end if;
	
end process;

R <= GrayScale(4 downto 2) when dena = '1' else "000";
G <= GrayScale(4 downto 2) when dena = '1' else "000";
B <= GrayScale(4 downto 2) when dena = '1' else "000";

end Behavioral;