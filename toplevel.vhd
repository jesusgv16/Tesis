library IEEE;
 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity toplevel is
 port(
 	 A: IN STD_logic_VECTOR (31 DOWNTO 0);
 	 CLK 	: in STD_LOGIC;
	 RST 	: in STD_LOGIC;	 
	 finalizado  : OUT STD_LOGIC;
	 salidafinal: OUT STD_LOGIC_VECTOR(255 downto 0)
     );
end toplevel;

architecture behavioral of toplevel is
 -----------------------  signals de cada componente---------------------
     ----------CAOS------------
     signal out0 : STD_LOGIC;
     signal salida_caos : std_logic_vector (112  downto 0);
     -------------big2small-------
     signal entrada_b2s : std_logic_vector ( 112 downto 0);
     signal iniciar_b2s :  std_logic;
     signal salida_b2s  :  std_logic_vector (31 downto 0);     
     -------------small2big-------
     signal entrada_s2b :  std_logic_vector ( 31 downto 0);
     signal salida_s2b  :  std_logic_vector (112 downto 0);
      signal big2sha  :  std_logic_vector (112 downto 0);
     signal iniciar_s2b :  std_logic;
    -------------------multiplier-------------
 	 signal ax : std_logic_vector(112 downto 0); 
	 signal bx : std_logic_vector(112 downto 0);	 
	 signal cx : std_logic_vector(112 downto 0);		-- cx = ax*bx mod Fx
	 signal done  :std_logic;
 -------------------------------fsm----------------------
     signal x, full_s2b, done_ecc, done_b2s, done_hash : std_logic;
     signal z :  std_logic;
     ------------------SHA--------------------
     signal PALABRA:  STD_logic_VECTOR (31 DOWNTO 0);
     signal RESUMIR:  STD_LOGIC;
     signal LISTO  :  STD_LOGIC;
     signal RESUMEN:  STD_LOGIC_VECTOR(255 downto 0);     
 ---------------------------------------------------------------------------
 ------------componentes-----------------------
 component CaosAlAl
     Port ( clk : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           out0 : out  STD_LOGIC;
           salida_caos: out std_logic_vector (112 downto 0)
           );
 end component CaosAlAl;
 ---------------------
component big2small
     Port(entrada_b2s : in std_logic_vector ( 112 downto 0);
    	  clk   : in std_logic;
    	  iniciar_b2s : in std_logic;
    	  salida_b2s  : out std_logic_vector (31 downto 0);
    	  done_b2s : out std_logic
    	  
    	  );           
end component big2small;
----------------------
component small2big
        port (
                entrada_s2b : in std_logic_vector ( 31 downto 0);
                clk   : in std_logic;
                salida_s2b  : out std_logic_vector (112 downto 0);
                iniciar_s2b : in std_logic
              );
end component small2big;

--------------------------
component serial_multiplier_113
	port(
	 	ax : in  std_logic_vector(112 downto 0); 
		bx : in  std_logic_vector(112 downto 0);	 
		cx : out std_logic_vector(112 downto 0);		-- cx = ax*bx mod Fx
		RST : in std_logic;
		clk	  : in std_logic;
		done  : out std_logic
	);	
end component serial_multiplier_113;
-----------------------------------
component fsm
    port (        
        clk : in  std_logic;
        RST : in std_logic;
        x, full_s2b, done_ecc, done_b2s, done_hash : in std_logic;
        z, iniciar_s2b,iniciar_b2s : out std_logic
    );
end component fsm;           
---------------------sha256------------------------
component SHA256_iterativo1R
 	port(
 	 PALABRA: IN STD_logic_VECTOR (31 DOWNTO 0);
 	 RESUMIR: IN STD_LOGIC;
 	 CLK 	: in STD_LOGIC;
	 RST 	: in STD_LOGIC;	 
	 LISTO  : OUT STD_LOGIC;
	 RESUMEN: OUT STD_LOGIC_VECTOR(255 downto 0)
     );
end component SHA256_iterativo1R;
---------------------------------

 ---------------- end components--------------------
 
 --lado izq pines y lado derecho los cables, lo izq no se modfica
 ---lado derecho si se bautiza, es el nombre que le doy al cable
begin
 
  BIG2SMALL_1: big2small  
  port map(
        entrada_b2s => cx,
        clk  => clk, 
        salida_b2s => PALABRA,  
        iniciar_b2s => iniciar_b2s,
        done_b2s => RESUMIR
           );
   ECC: serial_multiplier_113 
	port map (
	 	ax => salida_s2b,
		bx => salida_caos,
		cx => cx,
		RST => RST,
		clk => clk,
		done => done
	);	
SMALL2BIG_1: small2big
  port map(
        entrada_s2b => A,
        clk  => clk, 
        salida_s2b => salida_s2b,  
        iniciar_s2b => iniciar_s2b
           );	
CHAOS: CaosAlAl	
	port map(clk  => clk, 
           RST => RST,
           out0 => out0,
           salida_caos => salida_caos
           );
SHA2: sha256_iterativo1R	
	port map( 	
	 PALABRA => PALABRA,
 	 RESUMIR => RESUMIR, 
 	 CLK => clk,
	 RST => RST,
	 LISTO => LISTO,
	 RESUMEN => RESUMEN
           );	
           
FSMachine: fsm
     port map (
        clk => clk,
        RST => RST,
        x => x,
        full_s2b => full_s2b,
        done_ecc => done_ecc,
        done_b2s => done_b2s,
        done_hash => done_hash,
        z =>z,
        iniciar_s2b => iniciar_s2b,
        iniciar_b2s => iniciar_b2s
         );
end architecture;








