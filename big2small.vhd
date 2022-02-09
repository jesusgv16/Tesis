library IEEE;
 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
----------------------------------------------------------------
entity big2small is
Port(     entrada_b2s : in std_logic_vector ( 112 downto 0);
    	  clock   : in std_logic;
    	  iniciar_b2s : in std_logic;
    	  salida_b2s  : out std_logic_vector (31 downto 0)
    	  );
end big2small;
----------------------------------------------------------------
architecture Behavioral of big2small is
    signal a       : std_logic_vector(31 downto 0);
    signal t       : std_logic_vector (1 downto 0);
begin

process(clock)
begin

if ( iniciar_b2s = '1' and rising_edge(clock) ) then
    if (t="00") then
            salida_b2s (31 downto 0) <= entrada_b2s (112 downto 81) ; 
    elsif (t="01") then
        salida_b2s (31 downto 0) <= entrada_b2s (80 downto 49);
    elsif (t="10") then
        salida_b2s (31 downto 0) <= entrada_b2s (48 downto 17);
    elsif (t="11") then
        salida_b2s (31 downto 0) <= entrada_b2s (16 downto 0) & "000000000000000";
    end if;
end if;

end process;



end Behavioral;
