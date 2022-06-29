
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CaosAlAl is
    generic (nbit : integer := 113);
     Port ( clk : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           start_chaos : in STD_LOGIC;
           out0 : out  STD_LOGIC;
           done_chaos : out  STD_LOGIC;
           salida_caos: out std_logic_vector (112 downto 0)
           
           );
end CaosAlAl;

architecture Behavioral of CaosAlAl is
    signal reg : signed(nbit-1 downto 0);
    -- Supposing 2 integer bits and two's complement, one and minus one values
    constant zero : signed(nbit-1 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant one : signed(nbit-1 downto 0) := "01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant minusone : signed(nbit-1 downto 0) := "11000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant x0  : signed(nbit-1 downto 0) := "00100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
begin
    
    out0 <= reg(nbit-1);

main:process(clk,RST,start_chaos)
begin
    if RST = '0' then
        if (clk'event and clk ='1' and start_chaos = '1') then
            if (reg < zero) then
                reg <= (( reg(nbit-2 downto 0) & '0' ) - ( "111" & reg(nbit-1 downto 3) )) + one;
                salida_caos <= std_logic_vector(reg);
            else
                reg <= (( reg(nbit-2 downto 0)&'0' ) - ( "000" & reg(nbit-1 downto 3) )) + minusone;
                salida_caos <= std_logic_vector(reg);
                done_chaos <= '1';
            end if;
        end if;
    else
        -- init
        reg <= x0;
   
    end if;
end process;

end Behavioral;
