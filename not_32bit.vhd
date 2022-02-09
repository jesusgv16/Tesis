---------------------------------------------------------------------------------------------------
--
-- Title       : NOT_32BIT
-- Design      : SHA1_IAB27
-- Author      : IAB27
-- Company     : INAOE
--
---------------------------------------------------------------------------------------------------
--
-- File        : NOT_32BIT.vhd
-- Generated   : Mon Jan 19 14:38:31 2004
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

entity NOT_32BIT is
	 port(
		 EN : in STD_LOGIC_VECTOR(31 downto 0);
		 SN : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end NOT_32BIT;

architecture NOT_32BIT of NOT_32BIT is
	component NOT_1BIT is
	 port(
		 EN : in STD_LOGIC;
		 SN : out STD_LOGIC
	     );
	end component;
begin
	N00: NOT_1BIT PORT MAP (EN( 0),SN( 0));
	N01: NOT_1BIT PORT MAP (EN( 1),SN( 1));
	N02: NOT_1BIT PORT MAP (EN( 2),SN( 2));
	N03: NOT_1BIT PORT MAP (EN( 3),SN( 3));
	N04: NOT_1BIT PORT MAP (EN( 4),SN( 4));
	N05: NOT_1BIT PORT MAP (EN( 5),SN( 5));
	N06: NOT_1BIT PORT MAP (EN( 6),SN( 6));
	N07: NOT_1BIT PORT MAP (EN( 7),SN( 7));
	N08: NOT_1BIT PORT MAP (EN( 8),SN( 8));
	N09: NOT_1BIT PORT MAP (EN( 9),SN( 9));
	N10: NOT_1BIT PORT MAP (EN(10),SN(10));
	N11: NOT_1BIT PORT MAP (EN(11),SN(11));
	N12: NOT_1BIT PORT MAP (EN(12),SN(12));
	N13: NOT_1BIT PORT MAP (EN(13),SN(13));
	N14: NOT_1BIT PORT MAP (EN(14),SN(14));
	N15: NOT_1BIT PORT MAP (EN(15),SN(15));
	N16: NOT_1BIT PORT MAP (EN(16),SN(16));
	N17: NOT_1BIT PORT MAP (EN(17),SN(17));
	N18: NOT_1BIT PORT MAP (EN(18),SN(18));
	N19: NOT_1BIT PORT MAP (EN(19),SN(19));
	N20: NOT_1BIT PORT MAP (EN(20),SN(20));
	N21: NOT_1BIT PORT MAP (EN(21),SN(21));
	N22: NOT_1BIT PORT MAP (EN(22),SN(22));
	N23: NOT_1BIT PORT MAP (EN(23),SN(23));
	N24: NOT_1BIT PORT MAP (EN(24),SN(24));
	N25: NOT_1BIT PORT MAP (EN(25),SN(25));
	N26: NOT_1BIT PORT MAP (EN(26),SN(26));
	N27: NOT_1BIT PORT MAP (EN(27),SN(27));
	N28: NOT_1BIT PORT MAP (EN(28),SN(28));
	N29: NOT_1BIT PORT MAP (EN(29),SN(29));
	N30: NOT_1BIT PORT MAP (EN(30),SN(30));
	N31: NOT_1BIT PORT MAP (EN(31),SN(31));

end NOT_32BIT;
