library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity adam_dire_clock_divider is 
	Port (enable : in std_logic;
			reset : in std_logic;
			clk : in std_logic;
			en_out : out std_logic);
end adam_dire_clock_divider;

architecture behavioral of adam_dire_clock_divider is
	
	signal temp : std_logic_vector( 3 downto 0);
	
	Begin 
		
		process(clk, enable, reset)
			Begin
				if (reset='0') THEN
					temp<= "1001";
				elsif( clk'EVENT AND clk='1')THEN
					if(enable='1') THEN
						temp<=temp - 1;
					end if;
				end if;
		end process;
		
		en_out <= '0' when temp>="1001" else '1';
		
end behavioral;