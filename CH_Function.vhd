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

entity CH_Function is
	 port(
		 EX : in STD_LOGIC_VECTOR(31 DOWNTO 0);
		 EY : in STD_LOGIC_VECTOR(31 DOWNTO 0);
		 EZ : in STD_LOGIC_VECTOR(31 DOWNTO 0);
		 SF : out STD_LOGIC_VECTOR(31 DOWNTO 0)
	     );
end CH_Function;
 
architecture CH_Function of CH_Function is
COMPONENT AND2TO1_32BIT is
	 port(
		 EA1 : in STD_LOGIC_VECTOR(31 downto 0);
		 EA2 : in STD_LOGIC_VECTOR(31 downto 0);
		 SA : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end COMPONENT;
COMPONENT NOT_32BIT is
	 port(
		 EN : in STD_LOGIC_VECTOR(31 downto 0);
		 SN : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end COMPONENT;
COMPONENT XOR2TO1_32BIT is
	 port(
		 EX1 : in STD_LOGIC_VECTOR(31 downto 0);
		 EX2 : in STD_LOGIC_VECTOR(31 downto 0);
		 SX : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end COMPONENT;		   
SIGNAL SN1,SA1,SA2: STD_LOGIC_VECTOR (31 DOWNTO 0);
begin	   
	NOT1: NOT_32BIT PORT MAP (EX,SN1);
	AND1: AND2TO1_32BIT PORT MAP (EX, EY,SA1);
	AND2: AND2TO1_32BIT PORT MAP (SN1,EZ,SA2);
	XOR1: XOR2TO1_32BIT PORT MAP (SA1,SA2,SF);
end CH_Function;
