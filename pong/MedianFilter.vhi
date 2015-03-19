
-- VHDL Instantiation Created from source file MedianFilter.vhd -- 17:58:53 03/17/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT MedianFilter
	PORT(
		CLK_pixel : IN std_logic;
		Vsync_i : IN std_logic;
		Hsync_i : IN std_logic;
		adc_red : IN std_logic_vector(9 downto 0);
		adc_green : IN std_logic_vector(9 downto 0);
		adc_blue : IN std_logic_vector(9 downto 0);          
		pixel_val_o : OUT std_logic;
		Vsync_o : OUT std_logic;
		Hsync_o : OUT std_logic;
		adc_clk : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	Inst_MedianFilter: MedianFilter PORT MAP(
		CLK_pixel => ,
		pixel_val_o => ,
		Vsync_i => ,
		Hsync_i => ,
		Vsync_o => ,
		Hsync_o => ,
		adc_clk => ,
		adc_red => ,
		adc_green => ,
		adc_blue => 
	);


