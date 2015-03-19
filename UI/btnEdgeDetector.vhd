----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:41:30 03/19/2015 
-- Design Name: 
-- Module Name:    btnEdgeDetect - Behavioral 
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
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY btn_edge_detector IS
  GENERIC(
    counter_size  :  INTEGER := 19); --counter size (19 bits gives 10.5ms with 50MHz clock)
  PORT(
    clk     	: IN  STD_LOGIC;  --input clock
    button  	: IN  STD_LOGIC;  --input signal to be debounced
    edge_pulse : OUT STD_LOGIC; -- pulse when debounced edge detected
	 edge_type 	: OUT STD_LOGIC -- 1 for rising and 0 for falling edge
	 );
END btn_edge_detector;

ARCHITECTURE behavior OF btn_edge_detector IS
  SIGNAL flipflops   : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00"; --input flip flops
  SIGNAL counter_set : STD_LOGIC;                    --sync reset to zero
  SIGNAL counter_out : STD_LOGIC_VECTOR(counter_size DOWNTO 0) := (OTHERS => '0'); --counter output
  SIGNAL result 		: STD_LOGIC_VECTOR(1 downto 0) := "00";
BEGIN

  counter_set <= flipflops(0) xor flipflops(1);   --determine when to start/reset counter
  edge_pulse <= counter_out(counter_size);
  edge_type <= result(0) and not result(1);
  
  PROCESS(clk)
  BEGIN
    IF(clk'EVENT and clk = '1') THEN
      flipflops(0) <= button;
      flipflops(1) <= flipflops(0);
      If(counter_set = '1') THEN                  --reset counter because input is changing
        counter_out <= (OTHERS => '0');
      ELSIF(counter_out(counter_size) = '0') THEN --stable input time is not yet met
        counter_out <= counter_out + 1;
      ELSE                                        --stable input time is met
        result(0) <= flipflops(1);
		  result(1) <= result(0);
      END IF;    
    END IF;
  END PROCESS;
END behavior;
