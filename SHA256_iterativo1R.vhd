library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE IEEE.std_logic_unsigned.all; 

entity SHA256_iterativo1R is
 port(
 	 PALABRA: IN STD_logic_VECTOR (31 DOWNTO 0);
 	 RESUMIR: IN STD_LOGIC;
 	 CLK 	: in STD_LOGIC;
	 RST 	: in STD_LOGIC;	 
	 LISTO  : OUT STD_LOGIC;
	 RESUMEN: OUT STD_LOGIC_VECTOR(255 downto 0)
     );
end SHA256_iterativo1R;

architecture SHA256_iterativo1R of SHA256_iterativo1R is
component UnidadProcesamiento is
	 port(
		 WT   : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
		 CLK  : in  STD_LOGIC;
		 RST  : in  STD_LOGIC;	
		 WRB1 : IN  STD_logic ;
		 SELB1: IN  STD_logic ;
		 SELH0: IN  STD_logic ;
		 SELS1: IN  STD_logic ;
		 ADDKT: IN  STd_logic_Vector( 5 DOWNTO  0);
		 HASH : out STD_LOGIC_VECTOR(255 DOWNTO 0)
	     );
end component; 
component UnidadControl is
 port(
 		 EC_CIFRAR : in STD_LOGIC;	
 		 CLK  : in   STD_LOGIC;
		 RST  : in   STD_LOGIC;	
		 WRB1 : out  STD_logic ;
		 SELB1: out  STD_logic ;
		 SELH0: out  STD_logic ;
		 SELS1: out  STD_logic ;
		 ADDKT: out  STd_logic_Vector( 5 DOWNTO  0);
		 SC_LISTO : out STD_LOGIC
		 );	
end component;
component REGTEMP_1BIT is
	 port(
		 ERD : in STD_LOGIC;
		 ERW : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 RST : in STD_LOGIC;
		 SRQ : out STD_LOGIC
	     );
end component;
SIGNAL WRB1,SELB1,SELH0,SELS1,TLISTO: STD_LOGIC;
SIGNAL ADDKT: STD_LOGIC_VECTOR(5 DOWNTO 0);
begin				   
	U_P:	UnidadProcesamiento PORT MAP (PALABRA,CLK,RST,WRB1,SELB1,SELH0,SELS1,ADDKT,RESUMEN);
	U_C:	UnidadControl PORT MAP (RESUMIR,CLK,RST,WRB1,SELB1,SELH0,SELS1,ADDKT,TLISTO);
	AVI: 	REGTEMP_1BIT PORT MAP (TLISTO,'1',CLK,RST,LISTO);
end SHA256_iterativo1R;