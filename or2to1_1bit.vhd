---------------------------------------------------------------------------------------------------
--
-- Title       : OR2TO1_1BIT
-- Design      : DES_IAB27
-- Author      : IAB27
-- Company     : INAOE
--
---------------------------------------------------------------------------------------------------
--
-- File        : OR2TO1_1BIT.vhd
-- Generated   : Sat Jan 10 10:55:24 2004
-- From        : TLAX
-- By          : AZTLAN Ver. 1.0
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OR2TO1_1BIT is
	 port(
		 EO1 : in STD_LOGIC;
		 EO2 : in STD_LOGIC;
		 SO : out STD_LOGIC
	     );
end OR2TO1_1BIT;

architecture OR2TO1_1BIT of OR2TO1_1BIT is
begin
	SO <= EO1 OR EO2;
end OR2TO1_1BIT;
