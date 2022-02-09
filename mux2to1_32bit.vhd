---------------------------------------------------------------------------------------------------
--
-- Title       : MUX2TO1_128BIT
-- Design      : MD5_IAB27_B
-- Author      : IAB27
-- Company     : Home
--
---------------------------------------------------------------------------------------------------
--
-- File        : MUX2TO1_128BIT.vhd
-- Generated   : Tue Feb 24 20:54:41 2004
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

entity MUX2TO1_32BIT is
	 port(
		 EM1 : in STD_LOGIC_VECTOR(31 downto 0);
		 EM2 : in STD_LOGIC_VECTOR(31 downto 0);
		 EMS : in STD_LOGIC;
		 SM : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end MUX2TO1_32BIT;
 
architecture MUX2TO1_32BIT of MUX2TO1_32BIT is
component MUX2TO1_1BIT is
	 port(
		 EM1 : in STD_LOGIC;
		 EM2 : in STD_LOGIC;
		 EMS : in STD_LOGIC;
		 SM : out STD_LOGIC
	     );
	end component;
begin
	M000: MUX2TO1_1BIT PORT MAP (EM1(  0),EM2(  0),EMS,SM(  0));
	M001: MUX2TO1_1BIT PORT MAP (EM1(  1),EM2(  1),EMS,SM(  1));
	M002: MUX2TO1_1BIT PORT MAP (EM1(  2),EM2(  2),EMS,SM(  2));
	M003: MUX2TO1_1BIT PORT MAP (EM1(  3),EM2(  3),EMS,SM(  3));
	M004: MUX2TO1_1BIT PORT MAP (EM1(  4),EM2(  4),EMS,SM(  4));
	M005: MUX2TO1_1BIT PORT MAP (EM1(  5),EM2(  5),EMS,SM(  5));
	M006: MUX2TO1_1BIT PORT MAP (EM1(  6),EM2(  6),EMS,SM(  6));
	M007: MUX2TO1_1BIT PORT MAP (EM1(  7),EM2(  7),EMS,SM(  7));
	M008: MUX2TO1_1BIT PORT MAP (EM1(  8),EM2(  8),EMS,SM(  8));
	M009: MUX2TO1_1BIT PORT MAP (EM1(  9),EM2(  9),EMS,SM(  9));
	M010: MUX2TO1_1BIT PORT MAP (EM1( 10),EM2( 10),EMS,SM( 10));
	M011: MUX2TO1_1BIT PORT MAP (EM1( 11),EM2( 11),EMS,SM( 11));
	M012: MUX2TO1_1BIT PORT MAP (EM1( 12),EM2( 12),EMS,SM( 12));
	M013: MUX2TO1_1BIT PORT MAP (EM1( 13),EM2( 13),EMS,SM( 13));
	M014: MUX2TO1_1BIT PORT MAP (EM1( 14),EM2( 14),EMS,SM( 14));
	M015: MUX2TO1_1BIT PORT MAP (EM1( 15),EM2( 15),EMS,SM( 15));
	M016: MUX2TO1_1BIT PORT MAP (EM1( 16),EM2( 16),EMS,SM( 16));
	M017: MUX2TO1_1BIT PORT MAP (EM1( 17),EM2( 17),EMS,SM( 17));
	M018: MUX2TO1_1BIT PORT MAP (EM1( 18),EM2( 18),EMS,SM( 18));
	M019: MUX2TO1_1BIT PORT MAP (EM1( 19),EM2( 19),EMS,SM( 19));
	M020: MUX2TO1_1BIT PORT MAP (EM1( 20),EM2( 20),EMS,SM( 20));
	M021: MUX2TO1_1BIT PORT MAP (EM1( 21),EM2( 21),EMS,SM( 21));
	M022: MUX2TO1_1BIT PORT MAP (EM1( 22),EM2( 22),EMS,SM( 22));
	M023: MUX2TO1_1BIT PORT MAP (EM1( 23),EM2( 23),EMS,SM( 23));
	M024: MUX2TO1_1BIT PORT MAP (EM1( 24),EM2( 24),EMS,SM( 24));
	M025: MUX2TO1_1BIT PORT MAP (EM1( 25),EM2( 25),EMS,SM( 25));
	M026: MUX2TO1_1BIT PORT MAP (EM1( 26),EM2( 26),EMS,SM( 26));
	M027: MUX2TO1_1BIT PORT MAP (EM1( 27),EM2( 27),EMS,SM( 27));
	M028: MUX2TO1_1BIT PORT MAP (EM1( 28),EM2( 28),EMS,SM( 28));
	M029: MUX2TO1_1BIT PORT MAP (EM1( 29),EM2( 29),EMS,SM( 29));
	M030: MUX2TO1_1BIT PORT MAP (EM1( 30),EM2( 30),EMS,SM( 30));
	M031: MUX2TO1_1BIT PORT MAP (EM1( 31),EM2( 31),EMS,SM( 31));
	
end MUX2TO1_32BIT;
