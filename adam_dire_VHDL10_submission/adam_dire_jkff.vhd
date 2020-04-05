library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity adam_dire_jkff is 
	Port (clk : in std_logic;
			J : in std_logic;
			K : in std_logic;
			Q : out std_logic );
end adam_dire_jkff ;

Architecture behavioral of adam_dire_jkff is
	signal temp : std_logic;
	
	Begin 			
		
		process(clk, J, K, temp)

			Begin
			
			if( RISING_EDGE(clk)) THEN
				
				if(J='0' AND K='0') THEN
					temp<= temp;
				elsif(J='0' AND k='1') THEN
					temp <= '0';
				elsif(J='1' AND K='0') THEN
					temp<='1';
				elsif(J='1' AND k='1') THEN
					temp<= not temp;
				end if;
			end if;
			Q<=temp;
		end process;

end behavioral;