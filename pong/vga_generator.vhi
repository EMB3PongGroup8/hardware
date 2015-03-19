
-- VHDL Instantiation Created from source file vga_generator.vhd -- 18:11:01 03/17/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT vga_generator
	PORT(
		pixel_clk : IN std_logic;
		red : IN std_logic_vector(9 downto 0);
		green : IN std_logic_vector(9 downto 0);
		blue : IN std_logic_vector(9 downto 0);          
		R : OUT std_logic_vector(2 downto 0);
		G : OUT std_logic_vector(2 downto 0);
		B : OUT std_logic_vector(2 downto 0);
		Hsync : OUT std_logic;
		Vsync : OUT std_logic
		);
	END COMPONENT;

	Inst_vga_generator: vga_generator PORT MAP(
		pixel_clk => ,
		red => ,
		green => ,
		blue => ,
		R => ,
		G => ,
		B => ,
		Hsync => ,
		Vsync => 
	);


