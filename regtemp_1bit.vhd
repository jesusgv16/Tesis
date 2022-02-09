---------------------------------------------------------------------------------------------------
--
-- Title       : REGTEMP_1BIT
-- Design      : AES_IAB27
-- Author      : IAB27
-- Company     : INAOE
--
---------------------------------------------------------------------------------------------------
--
-- File        : REGTEMP_1BIT.vhd
-- Generated   : Mon Jan 12 10:17:28 2004
-- From        : TLAX
-- By          : AZTEC Ver. 1.0
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity REGTEMP_1BIT is
	 port(
		 ERD : in STD_LOGIC;
		 ERW : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 RST : in STD_LOGIC;
		 SRQ : out STD_LOGIC
	     );
end REGTEMP_1BIT;

architecture REGTEMP_1BIT of REGTEMP_1BIT is
begin
	PROCESS(RST,CLK,ERD,ERW)
	BEGIN		
		IF RST='1' THEN
			SRQ <= '0';
		ELSIF(RISING_EDGE(CLK)) THEN
			IF ERW='1' THEN
				SRQ <= ERD;
			END IF;
		END IF;	
	END PROCESS;
end REGTEMP_1BIT;
