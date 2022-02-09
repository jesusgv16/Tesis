---------------------------------------------------------------------------------------------------
--
-- Title       : CONTADOR_16BCD
-- Design      : MD5_IAB27vA3
-- Author      : 0
-- Company     : 0
--
---------------------------------------------------------------------------------------------------
--
-- File        : CONTADOR_16BCD.vhd
-- Generated   : Fri Apr 30 07:38:16 2004
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE IEEE.std_logic_unsigned.all; 

entity Contador6bit is
 port(
	 CLK : in STD_LOGIC;
	 RST : in STD_LOGIC;
	 SC : out STD_LOGIC_VECTOR(5 downto 0)
     );
end Contador6bit;

architecture Contador6bit of Contador6bit is
SIGNAL Qint: STD_LOGIC_VECTOR (5 downto 0);
begin

process (CLK)
begin
   if RISING_EDGE(CLK) then
	   IF RST = '1' THEN
		   Qint <= "111111";
	   else
		   Qint <= Qint+1;
	   end if;	   
   end if;
end process;

SC <= Qint;

end Contador6bit;