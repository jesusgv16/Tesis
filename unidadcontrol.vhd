
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity UnidadControl is
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
end UnidadControl;
 
architecture UnidadControl of UnidadControl is
component Contador6bit is
 port(
	 CLK : in STD_LOGIC;
	 RST : in STD_LOGIC;
	 SC : out STD_LOGIC_VECTOR(5 downto 0)
     );
end component;
	signal TCC: STD_LOGIC_VECTOR(5 DOWNTO 0);
	signal TCR: std_logic;
	
type Control_type is (INICIO,CARGA,RONDAm16,RONDAm16_1,RONDAF,RONDAF_0,DECIDIR,REINICIO);
signal Control_ACT, Control_SIG : Control_type;

BEGIN
process (CLK, Control_ACT, EC_CIFRAR, TCC)
begin
	SELS1 		<= '1';	 	
    TCR 		<= '0';
	SC_LISTO   	<= '0';  
	SELH0 		<= '1';
	SELB1 		<= '0';
	WRB1  		<= '0';
	case Control_ACT is
		when INICIO =>
			TCR 	<= '1';
    		SELH0 	<= '0';
			IF EC_CIFRAR='1' THEN
				Control_SIG <= CARGA;
			END IF;
		when CARGA =>
			SELS1 	<= '0';	 	
    		SELB1  	<= '1';
			WRB1  	<= '1';
			Control_SIG <= RONDAm16_1;
		when RONDAm16_1 =>
			SELS1 	<= '0';	 	
    		SELH0 	<= '0';
			Control_SIG <= RONDAm16;
		when RONDAm16 =>
			SELS1 <= '0';
			IF 	(TCC="001110") THEN
				Control_SIG <= RONDAF_0;
			END IF;
		when RONDAF_0 =>
			SELS1 <= '1';
			Control_SIG <= RONDAF;
		when RONDAF =>
			IF (TCC="111110") THEN
				Control_SIG <= DECIDIR;
			END IF;		   
		when DECIDIR  =>
			SC_LISTO	<= '1';
    		TCR 	<= '1';
    		IF (EC_CIFRAR='1') THEN
				Control_SIG <= REINICIO;
			ELSE
				Control_SIG <= INICIO;
			END IF;		   
		when REINICIO => 
			SELS1 		<= '0';
			SELH0 		<= '0';
			WRB1  		<= '1';
			Control_SIG <= RONDAm16_1;
	end case;	

end process;

PROCESS(CLK,RST)
BEGIN
	if RST='1' then
		Control_ACT <= INICIO;
	elsIF RISING_EDGE(CLK) THEN
		Control_ACT <= Control_SIG;
	END IF;						   
END PROCESS;

C01: Contador6bit	PORT MAP (CLK,TCR,TCC);
ADDKT <= TCC;

end UnidadControl;