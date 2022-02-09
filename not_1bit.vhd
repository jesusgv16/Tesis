---------------------------------------------------------------------------------------------------
--
-- Title       : NOT_1BIT
-- Design      : AES_IAB27
-- Author      : IAB27
-- Company     : INAOE
--
---------------------------------------------------------------------------------------------------
--
-- File        : NOT_1BIT.vhd
-- Generated   : Sun Jan 11 14:49:07 2004
-- From        : TLAX
-- By          : AZTEC Ver. 1.0
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity NOT_1BIT is
	 port(
		 EN : in STD_LOGIC;
		 SN : out STD_LOGIC
	     );
end NOT_1BIT;

architecture NOT_1BIT of NOT_1BIT is
begin
	SN <= NOT EN;   
end NOT_1BIT;
