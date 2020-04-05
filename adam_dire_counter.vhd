library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity adam_dire_counter is 
	Port ( enable : in std_logic;
			 reset : in std_logic;
			 clk : in std_logic;
			 count : out std_logic_vector(2 downto 0 ));
end adam_dire_counter;

Architecture behavioral of adam_dire_counter is 
	
	signal temp : std_logic_vector(2 downto 0);

	Begin

		process(clk, enable, reset)
			Begin
				
				if (reset='0') THEN
					temp<="000";
				elsif( clk'EVENT AND clk='1')THEN
					if(enable='1') THEN
						temp<=temp + 1;
					else
						temp<=temp;
					end if;
				end if;
				
		end process;
	
	count<=temp;
	
end behavioral;