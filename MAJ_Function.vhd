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

entity MAJ_Function is
	 port(
		 EX : in STD_LOGIC_VECTOR(31 DOWNTO 0);
		 EY : in STD_LOGIC_VECTOR(31 DOWNTO 0);
		 EZ : in STD_LOGIC_VECTOR(31 DOWNTO 0);
		 SF : out STD_LOGIC_VECTOR(31 DOWNTO 0)
	     );
end MAJ_Function;
 
architecture MAJ_Function of MAJ_Function is
COMPONENT AND2TO1_32BIT is
	 port(
		 EA1 : in STD_LOGIC_VECTOR(31 downto 0);
		 EA2 : in STD_LOGIC_VECTOR(31 downto 0);
		 SA : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end COMPONENT;
COMPONENT XOR2TO1_32BIT is
	 port(
		 EX1 : in STD_LOGIC_VECTOR(31 downto 0);
		 EX2 : in STD_LOGIC_VECTOR(31 downto 0);
		 SX : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end COMPONENT;		   
SIGNAL SA1,SA2,SA3,SX1: STD_LOGIC_VECTOR (31 DOWNTO 0);
begin	   
	AND1: AND2TO1_32BIT PORT MAP (EX, EY, SA1);
	AND2: AND2TO1_32BIT PORT MAP (EX, EZ, SA2);
	AND3: AND2TO1_32BIT PORT MAP (EY, EZ, SA3);
	XOR1: XOR2TO1_32BIT PORT MAP (SA1,SA2,SX1);
	XOR2: XOR2TO1_32BIT PORT MAP (SA3,SX1,SF );
end MAJ_Function;