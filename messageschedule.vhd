

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MessageSchedule is
	 port(
		 WIN : in  STD_LOGIC_VECTOR(31 downto 0);
		 SEE : in  STD_LOGIC;
		 CLK : in  STD_LOGIC;
		 RST : in  STD_LOGIC;
		 WOU : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end MessageSchedule;

architecture MessageSchedule of MessageSchedule is
component MUX2TO1_32BIT is
	 port(
		 EM1 : in STD_LOGIC_VECTOR(31 downto 0);
		 EM2 : in STD_LOGIC_VECTOR(31 downto 0);
		 EMS : in STD_LOGIC;
		 SM : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end component;
component REGTEMP_512BIT is
	 port(
		 ERD : in STD_LOGIC_VECTOR(511 DOWNTO 0);
		 ERW : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 RST : in STD_LOGIC;
		 SRQ : out STD_LOGIC_VECTOR(511 DOWNTO 0)
	     );
end component;
COMPONENT SUMADOR2T01_32BITSMOD32 is
	 port(
		 ESA : in STD_LOGIC_VECTOR(31 downto 0);
		 ESB : in STD_LOGIC_VECTOR(31 downto 0);
		 SS : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end COMPonent; 
COMPONENT SIGMACHICA1 is
	 port(
		 EX : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
		 SF : out STD_LOGIC_VECTOR(31 DOWNTO 0)
	     );
end COMPONENT;
COMPONENT SIGMACHICA0 is
	 port(
		 EX : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
		 SF : out STD_LOGIC_VECTOR(31 DOWNTO 0)
	     );
end COMPONENT;
SIGNAL SCO1,SCO0,SMEN,SSM3,SSM2,SSM1: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL SREG:STD_LOGIC_VECTOR(511 DOWNTO 0);
begin
MEN: MUX2TO1_32BIT  PORT MAP (SSM3, WIN, SEE, SMEN);
RE1: REGTEMP_512BIT PORT MAP (
	ERD(511 DOWNTO 480)=>SMEN,
	ERD(479 DOWNTO   0)=>SREG(511 DOWNTO 32),
	ERW=>'1',
	CLK=>CLK,
	RST=>RST,
	SRQ=>SREG);
--SC1: SIGMACHICA1  PORT MAP(SREG(479 DOWNTO 448),SCO1);
--SC0: SIGMACHICA0  PORT MAP(SREG( 63 DOWNTO  32),SCO0);
--SU1: SUMADOR2T01_32BITSMOD32 PORT MAP (SCO1,SREG(319 DOWNTO 288),SSM1);
--SU2: SUMADOR2T01_32BITSMOD32 PORT MAP (SCO0,SREG( 31 DOWNTO   0),SSM2);
--SU3: SUMADOR2T01_32BITSMOD32 PORT MAP (SSM1,SSM2,SSM3);			  
--WOU <= SREG(511 DOWNTO 480); 

SC1: SIGMACHICA1  PORT MAP(SREG(479 DOWNTO 448),SCO1);
SC0: SIGMACHICA0  PORT MAP(SREG( 63 DOWNTO  32),SCO0);
SU1: SUMADOR2T01_32BITSMOD32 PORT MAP (SCO1,SREG(319 DOWNTO 288),SSM1);
SU2: SUMADOR2T01_32BITSMOD32 PORT MAP (SCO0,SREG( 31 DOWNTO   0),SSM2);
SU3: SUMADOR2T01_32BITSMOD32 PORT MAP (SSM1,SSM2,SSM3);	
WOU <= SREG(511 DOWNTO 480);
end MessageSchedule;