---------------------------------------------------------------------------------------------------
--
-- Title       : XOR2TO1_32BIT
-- Design      : DES_IAB27
-- Author      : IAB27
-- Company     : INAOE
--
---------------------------------------------------------------------------------------------------
--
-- File        : XOR2TO1_32BIT.vhd
-- Generated   : Sat Jan 10 11:31:08 2004
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

entity XOR2TO1_32BIT is
	 port(
		 EX1 : in STD_LOGIC_VECTOR(31 downto 0);
		 EX2 : in STD_LOGIC_VECTOR(31 downto 0);
		 SX : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end XOR2TO1_32BIT;
 
architecture XOR2TO1_32BIT of XOR2TO1_32BIT is
	component XOR2TO1_1BIT is
	 port(
		 EX1 : in STD_LOGIC;
		 EX2 : in STD_LOGIC;
		 SX : out STD_LOGIC
	     );
	end component;
begin 
	X00: XOR2TO1_1BIT	PORT MAP (EX1( 0),EX2( 0),SX( 0));
	X01: XOR2TO1_1BIT	PORT MAP (EX1( 1),EX2( 1),SX( 1));
	X02: XOR2TO1_1BIT	PORT MAP (EX1( 2),EX2( 2),SX( 2));
	X03: XOR2TO1_1BIT	PORT MAP (EX1( 3),EX2( 3),SX( 3));
	X04: XOR2TO1_1BIT	PORT MAP (EX1( 4),EX2( 4),SX( 4));
	X05: XOR2TO1_1BIT	PORT MAP (EX1( 5),EX2( 5),SX( 5));
	X06: XOR2TO1_1BIT	PORT MAP (EX1( 6),EX2( 6),SX( 6));
	X07: XOR2TO1_1BIT	PORT MAP (EX1( 7),EX2( 7),SX( 7));
	
	X08: XOR2TO1_1BIT	PORT MAP (EX1( 8),EX2( 8),SX( 8));
	X09: XOR2TO1_1BIT	PORT MAP (EX1( 9),EX2( 9),SX( 9));
    X10: XOR2TO1_1BIT	PORT MAP (EX1(10),EX2(10),SX(10));
	X11: XOR2TO1_1BIT	PORT MAP (EX1(11),EX2(11),SX(11));
	X12: XOR2TO1_1BIT	PORT MAP (EX1(12),EX2(12),SX(12));
	X13: XOR2TO1_1BIT	PORT MAP (EX1(13),EX2(13),SX(13));
	X14: XOR2TO1_1BIT	PORT MAP (EX1(14),EX2(14),SX(14));
	X15: XOR2TO1_1BIT	PORT MAP (EX1(15),EX2(15),SX(15));
	
	X16: XOR2TO1_1BIT	PORT MAP (EX1(16),EX2(16),SX(16));
	X17: XOR2TO1_1BIT	PORT MAP (EX1(17),EX2(17),SX(17));
	X18: XOR2TO1_1BIT	PORT MAP (EX1(18),EX2(18),SX(18));
	X19: XOR2TO1_1BIT	PORT MAP (EX1(19),EX2(19),SX(19));
	X20: XOR2TO1_1BIT	PORT MAP (EX1(20),EX2(20),SX(20));
	X21: XOR2TO1_1BIT	PORT MAP (EX1(21),EX2(21),SX(21));
	X22: XOR2TO1_1BIT	PORT MAP (EX1(22),EX2(22),SX(22));
	X23: XOR2TO1_1BIT	PORT MAP (EX1(23),EX2(23),SX(23));
	
	X24: XOR2TO1_1BIT	PORT MAP (EX1(24),EX2(24),SX(24));
	X25: XOR2TO1_1BIT	PORT MAP (EX1(25),EX2(25),SX(25));
	X26: XOR2TO1_1BIT	PORT MAP (EX1(26),EX2(26),SX(26));
	X27: XOR2TO1_1BIT	PORT MAP (EX1(27),EX2(27),SX(27));
	X28: XOR2TO1_1BIT	PORT MAP (EX1(28),EX2(28),SX(28));
	X29: XOR2TO1_1BIT	PORT MAP (EX1(29),EX2(29),SX(29));	
	X30: XOR2TO1_1BIT	PORT MAP (EX1(30),EX2(30),SX(30));
	X31: XOR2TO1_1BIT	PORT MAP (EX1(31),EX2(31),SX(31));
	
end XOR2TO1_32BIT;
