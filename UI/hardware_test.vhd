----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:47:29 03/19/2015 
-- Design Name: 
-- Module Name:    hardware_test - Behavioral 
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

entity hardware_test is
	port(
		CLK200M_i : in std_logic;
		man_type_sw : in std_logic;
		ai_enb_sw : in std_logic;
		up_btn : in std_logic;
		down_btn : in std_logic;
		led : out std_logic_vector(3 downto 0)
	);
end hardware_test;

architecture Behavioral of hardware_test is
	COMPONENT UI
	PORT(
		clk : IN std_logic;
		ai_sw : IN std_logic;
		man_type_sw : IN std_logic;
		up_btn : IN std_logic;
		down_btn : IN std_logic;
		chipScope : IN std_logic_vector(2 downto 0);          
		ai_ena : OUT std_logic;
		cmd : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

begin
	led(1) <= '0';
	Inst_UI: UI PORT MAP(
		clk => CLK200M_i,
		ai_sw => ai_enb_sw,
		man_type_sw => man_type_sw,
		up_btn => up_btn,
		down_btn => down_btn,
		chipScope => "000",
		ai_ena => led(0),
		cmd => led(3 downto 2)
	);

end Behavioral;

