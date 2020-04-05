library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity adam_dire_wrapper is 
	Port (enable : in std_logic;
			reset : in std_logic;
			clk : in std_logic;
			HEX0 : out std_logic_vector (6 downto 0));
end adam_dire_wrapper;

architecture behavioral of adam_dire_wrapper is 

	--components
	Component adam_dire_7_segment_decoder
	Port( code : in std_logic_vector(3 downto 0);
			segments_out : out std_logic_vector(6 downto 0));
	end component;

	component adam_dire_counter is 
		Port ( enable : in std_logic;
				 reset : in std_logic;
				 clk : in std_logic;
				 count : out std_logic_vector(2 downto 0 ));
	end component;
	
	component adam_dire_clock_divider is 
	Port (enable : in std_logic;
			reset : in std_logic;
			clk : in std_logic;
			en_out : out std_logic);
	end component;
	
	--signals
	signal tempSum : std_logic_vector( 2 downto 0 );
	signal enableOut : std_logic;
	signal finalOut : std_logic_vector( 6 downto 0 );
	signal anotherTemp : std_logic_vector( 3 downto 0);
	Begin
	--clock divider
	divider : adam_dire_clock_divider port map(enable, reset, clk, enableOut);
	
	--counter
	counter : adam_dire_counter port map(enableOut, reset, clk, tempSum );
	
	anotherTemp<= '0'&tempSum;
	
	--Decoder
	decoder : adam_dire_7_segment_decoder Port map ( anotherTemp, finalOut);
	
	HEX0 <= finalOut;
end behavioral;