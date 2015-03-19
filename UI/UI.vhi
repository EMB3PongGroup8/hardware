
-- VHDL Instantiation Created from source file UI.vhd -- 09:48:55 03/19/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_UI: UI PORT MAP(
		clk => ,
		ai_sw => ,
		man_type_sw => ,
		up_btn => ,
		down_btn => ,
		chipScope => ,
		ai_ena => ,
		cmd => 
	);


