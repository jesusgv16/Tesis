---------------------------------------------------------------------------------------------------
--
-- Title       : XOR2TO1_1BIT
-- Design      : DES_IAB27
-- Author      : IAB27
-- Company     : INAOE
--
---------------------------------------------------------------------------------------------------
--
-- File        : XOR2TO1_1BIT.vhd
-- Generated   : Sat Jan 10 11:28:01 2004
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

entity XOR2TO1_1BIT is
	 port(
		 EX1 : in STD_LOGIC;
		 EX2 : in STD_LOGIC;
		 SX : out STD_LOGIC
	     );
end XOR2TO1_1BIT;
 
architecture XOR2TO1_1BIT of XOR2TO1_1BIT is
begin	   
	SX <= EX1 XOR EX2;	 
end XOR2TO1_1BIT;
