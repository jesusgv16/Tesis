library IEEE;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
----------------------------------------------------------------
entity small2big is
        port (
                entrada_s2b : in std_logic_vector ( 31 downto 0);
                clk   : in std_logic;
                salida_s2b  : out std_logic_vector (112 downto 0);
                iniciar_s2b : in std_logic;
                full_s2b : out std_logic
              );
end small2big;
----------------------------------------------------------------
architecture Behavioral of small2big is
    signal ain,b,c: std_logic_vector(31 downto 0);
    signal t       : std_logic_vector (1 downto 0):="00";
begin

process(clk)
begin

if ( iniciar_s2b = '1' and rising_edge(clk) ) then
    if (t="00") then
        ain <= entrada_s2b (31 downto 0);
        t<="01";
    elsif (t="01") then
        b <= entrada_s2b (31 downto 0);
        t<="10";
    elsif (t="10") then
        c <= entrada_s2b (31 downto 0);
        full_s2b <= '1';
    end if;
end if;

end process;

salida_s2b <= ain & b & c & "00000000000000000"; --concatenar las entradas


end Behavioral;
