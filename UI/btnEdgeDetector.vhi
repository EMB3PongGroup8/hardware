
-- VHDL Instantiation Created from source file btnEdgeDetector.vhd -- 09:15:25 03/19/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT btnEdgeDetector
	PORT(
		clk : IN std_logic;
		button : IN std_logic;          
		edge_pulse : OUT std_logic;
		edge_type : OUT std_logic
		);
	END COMPONENT;

	Inst_btnEdgeDetector: btnEdgeDetector PORT MAP(
		clk => ,
		button => ,
		edge_pulse => ,
		edge_type => 
	);


