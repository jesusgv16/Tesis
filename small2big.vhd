library IEEE;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
----------------------------------------------------------------
entity small2big is
        port (
                entrada_s2b : in std_logic_vector ( 31 downto 0);
                clock   : in std_logic;
                salida_s2b  : out std_logic_vector (112 downto 0);
                iniciar_s2b : in std_logic
              );
end small2big;
----------------------------------------------------------------
architecture Behavioral of small2big is
    signal a,b,c: std_logic_vector(31 downto 0);
    signal t       : std_logic_vector (1 downto 0);
begin

process(clock)
begin

if ( iniciar_s2b = '1' and rising_edge(clock) ) then
    if (t="00") then
        a <= entrada_s2b (31 downto 0);
    elsif (t="01") then
        b <= entrada_s2b (31 downto 0);
    elsif (t="10") then
        c <= entrada_s2b (31 downto 0);
    end if;
end if;

end process;

salida_s2b <= a & b & c & "00000000000000000"; --concatenar las entradas

end Behavioral;
