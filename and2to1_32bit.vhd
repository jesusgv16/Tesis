---------------------------------------------------------------------------------------------------
--
-- Title       : AND2TO1_32BIT
-- Design      : SHA1_IAB27
-- Author      : IAB27
-- Company     : INAOE
--
---------------------------------------------------------------------------------------------------
--
-- File        : AND2TO1_32BIT.vhd
-- Generated   : Mon Jan 19 14:23:21 2004
-- From        : TLAX
-- By          : TOLTEK Ver. 1.0
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity AND2TO1_32BIT is
	 port(
		 EA1 : in STD_LOGIC_VECTOR(31 downto 0);
		 EA2 : in STD_LOGIC_VECTOR(31 downto 0);
		 SA : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end AND2TO1_32BIT;

architecture AND2TO1_32BIT of AND2TO1_32BIT is
	component AND2TO1_1BIT is
	port(
		 EA1 : in STD_LOGIC;
		 EA2 : in STD_LOGIC;
		 SA : out STD_LOGIC
	     );
	end component;
begin
	A00: AND2TO1_1BIT PORT MAP (EA1( 0),EA2( 0),SA( 0));
	A01: AND2TO1_1BIT PORT MAP (EA1( 1),EA2( 1),SA( 1));
	A02: AND2TO1_1BIT PORT MAP (EA1( 2),EA2( 2),SA( 2));
	A03: AND2TO1_1BIT PORT MAP (EA1( 3),EA2( 3),SA( 3));
	A04: AND2TO1_1BIT PORT MAP (EA1( 4),EA2( 4),SA( 4));
	A05: AND2TO1_1BIT PORT MAP (EA1( 5),EA2( 5),SA( 5));
	A06: AND2TO1_1BIT PORT MAP (EA1( 6),EA2( 6),SA( 6));
	A07: AND2TO1_1BIT PORT MAP (EA1( 7),EA2( 7),SA( 7));
	A08: AND2TO1_1BIT PORT MAP (EA1( 8),EA2( 8),SA( 8));
	A09: AND2TO1_1BIT PORT MAP (EA1( 9),EA2( 9),SA( 9));
	A10: AND2TO1_1BIT PORT MAP (EA1(10),EA2(10),SA(10));
	A11: AND2TO1_1BIT PORT MAP (EA1(11),EA2(11),SA(11));
	A12: AND2TO1_1BIT PORT MAP (EA1(12),EA2(12),SA(12));
	A13: AND2TO1_1BIT PORT MAP (EA1(13),EA2(13),SA(13));
	A14: AND2TO1_1BIT PORT MAP (EA1(14),EA2(14),SA(14));
	A15: AND2TO1_1BIT PORT MAP (EA1(15),EA2(15),SA(15));
	A16: AND2TO1_1BIT PORT MAP (EA1(16),EA2(16),SA(16));
	A17: AND2TO1_1BIT PORT MAP (EA1(17),EA2(17),SA(17));
	A18: AND2TO1_1BIT PORT MAP (EA1(18),EA2(18),SA(18));
	A19: AND2TO1_1BIT PORT MAP (EA1(19),EA2(19),SA(19));
	A20: AND2TO1_1BIT PORT MAP (EA1(20),EA2(20),SA(20));
	A21: AND2TO1_1BIT PORT MAP (EA1(21),EA2(21),SA(21));
	A22: AND2TO1_1BIT PORT MAP (EA1(22),EA2(22),SA(22));
	A23: AND2TO1_1BIT PORT MAP (EA1(23),EA2(23),SA(23));
	A24: AND2TO1_1BIT PORT MAP (EA1(24),EA2(24),SA(24));
	A25: AND2TO1_1BIT PORT MAP (EA1(25),EA2(25),SA(25));
	A26: AND2TO1_1BIT PORT MAP (EA1(26),EA2(26),SA(26));
	A27: AND2TO1_1BIT PORT MAP (EA1(27),EA2(27),SA(27));
	A28: AND2TO1_1BIT PORT MAP (EA1(28),EA2(28),SA(28));
	A29: AND2TO1_1BIT PORT MAP (EA1(29),EA2(29),SA(29));
	A30: AND2TO1_1BIT PORT MAP (EA1(30),EA2(30),SA(30));
	A31: AND2TO1_1BIT PORT MAP (EA1(31),EA2(31),SA(31));
end AND2TO1_32BIT;
