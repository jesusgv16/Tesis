library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Buffer8x32 is
	 port(
		 H0R : in STD_LOGIC_VECTOR(255 DOWNTO 0);
		 SEL : in STD_LOGIC;
		 ERW : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 RST : in STD_LOGIC;
		 H0F : out STD_LOGIC_VECTOR(255 DOWNTO 0)
	     );
end Buffer8x32;

architecture Buffer8x32 of Buffer8x32 is
component MUX2TO1_128BIT is
	 port(
		 EM1 : in STD_LOGIC_VECTOR(127 downto 0);
		 EM2 : in STD_LOGIC_VECTOR(127 downto 0);
		 EMS : in STD_LOGIC;
		 SM : out STD_LOGIC_VECTOR(127 downto 0)
	     );
end component;
component REGTEMP_128BIT is
	 port(
		 ERD : in STD_LOGIC_VECTOR(127 downto 0);
		 ERW : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 RST : in STD_LOGIC;
		 SRQ : out STD_LOGIC_VECTOR(127 downto 0)
	     );
end component;
SIGNAL SM1,SM2: STD_logic_VEctor(127 DOWNTO 0);
begin	
	MP1: MUX2TO1_128BIT PORT MAP(x"5be0cd191f83d9ab9b05688c510e527f",H0R(255 DOWNTO 128),SEL,SM1);
	MP2: MUX2TO1_128BIT	PORT MAP(x"a54ff53a3c6ef372bb67ae856a09e667",H0R(127 DOWNTO   0),SEL,SM2);
	RP1: REGTEMP_128BIT	PORT MAP(SM1,ERW,CLK,RST,H0F(255 DOWNTO 128));
	RP2: REGTEMP_128BIT	PORT MAP(SM2,ERW,CLK,RST,H0F(127 DOWNTO   0)); 
	
end Buffer8x32;