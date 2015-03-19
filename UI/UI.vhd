----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:39:36 03/19/2015 
-- Design Name: 
-- Module Name:    UI - Behavioral 
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

entity UI is
	port(
		clk : in std_logic;
		ai_sw : in std_logic;
		man_type_sw : in std_logic;
		up_btn : in std_logic;
		down_btn : in std_logic;
		chipScope : in std_logic_vector(2 downto 0);
		ai_ena : out std_logic;
		cmd : out std_logic_vector(1 downto 0)
	);
end UI;

architecture Behavioral of UI is
	
	constant up_cmd : std_logic_vector(1 downto 0) := "10"; -- one hot active low
	constant down_cmd : std_logic_vector(1 downto 0) := "01";
	COMPONENT debounce
	PORT(
		clk : IN std_logic;
		button : IN std_logic;          
		result : OUT std_logic
		);
	END COMPONENT;
	
	signal man_cmd : std_logic_vector(1 downto 0);
	signal chipScope_cmd : std_logic_vector(1 downto 0);
	
begin

	ai_ena <= ai_sw; -- might be routed directly to microblaze but not so module based design

	up_btn_ctrl: debounce PORT MAP(
		clk => clk,
		button => up_btn,
		result => man_cmd(0)
	);
	
	down_btn_ctrl: debounce PORT MAP(
		clk => clk,
		button => down_btn,
		result => man_cmd(1)
	);
	-- manual command multiplexer 
	cmd <= 	man_cmd 			when man_type_sw = '1' 
									else
				chipScope_cmd;
	
	-- chipScope command decoding
	chipScope_cmd <= man_cmd; -- TODO: add chipscope command decoding
	
end Behavioral;

