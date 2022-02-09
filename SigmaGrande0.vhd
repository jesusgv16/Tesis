library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SIGMAGRANDE0 is
	 port(
		 EX : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
		 SF : out STD_LOGIC_VECTOR(31 DOWNTO 0)
	     );
end SIGMAGRANDE0;
 
architecture SIGMAGRANDE0 of SIGMAGRANDE0 is
COMPONENT XOR2TO1_32BIT is
	 port(
		 EX1 : in STD_LOGIC_VECTOR(31 downto 0);
		 EX2 : in STD_LOGIC_VECTOR(31 downto 0);
		 SX : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end COMPONENT;		   
SIGNAL SX1: STD_LOGIC_VECTOR (31 DOWNTO 0);
begin	   
	XOR1: XOR2TO1_32BIT PORT MAP (
		EX1(31 DOWNTO 30)=>EX( 1 DOWNTO 0),
		EX1(29 DOWNTO  0)=>EX(31 DOWNTO 2),
		EX2(31 DOWNTO 19)=>EX(12 DOWNTO 0),
		EX2(18 DOWNTO  0)=>EX(31 DOWNTO 13),
		SX =>SX1
		);
	XOR2: XOR2TO1_32BIT PORT MAP (
		EX1(31 DOWNTO 10)=>EX(21 DOWNTO 0),
		EX1( 9 DOWNTO  0)=>EX(31 DOWNTO 22),
		EX2=>SX1,
		SX =>SF
		);
end SIGMAGRANDE0;