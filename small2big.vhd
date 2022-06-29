library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity toplevel is
 port(
 	 A: IN STD_logic_VECTOR (31 DOWNTO 0);
 	 CLK 	: in STD_LOGIC;
	 RST 	: in STD_LOGIC;	 
	 
	 flag_valid_cipher  : OUT STD_LOGIC;
	 Ciphered: OUT STD_LOGIC_VECTOR(112 downto 0);
	 
	 flag_Valid_hash  : OUT STD_LOGIC;
	 SALIDA_HASH: OUT STD_LOGIC_VECTOR(255 downto 0)
     );
end toplevel;

architecture behavioral of toplevel is
 -----------------------  signals de cada componente---------------------
     -------------small2big-------
     ------------------SHA--------------------
     signal PALABRA_signal:  STD_logic_VECTOR (31 DOWNTO 0);
     signal RESUMIR_signal:  STD_LOGIC;
     ------------------PADD_SHA--------------------
      signal entrada_pad_signal :  std_logic_vector (112 downto 0);
      signal iniciar_pad_signal :  std_logic;
    -------------------multiplier-------------
 	 signal ax_signal : std_logic_vector(112 downto 0); 
	 signal bx_signal : std_logic_vector(112 downto 0);	 
	 signal cx_signal : std_logic_vector(112 downto 0);		-- cx = ax*bx mod Fx
	 signal done_signal  :std_logic;      
     ----------CAOS------------
     signal out0_signal : STD_LOGIC;
     signal salida_caos_signal : std_logic_vector (112  downto 0);
     
     	 
 ---------------------------------------------------------------------------
 ------------componentes-----------------------
----------------------
component small2big
        port (
                entrada_s2b : in std_logic_vector ( 31 downto 0);
                clk   : in std_logic;
                salida_s2b  : out std_logic_vector (112 downto 0);
                full_s2b : out std_logic
              );
end component small2big;


---------------------sha256------------------------
component SHA256_iterativo1R
 	port(
 	 PALABRA : IN STD_logic_VECTOR (31 DOWNTO 0);
 	 RESUMIR : IN STD_LOGIC;
 	 CLK 	 : in STD_LOGIC;
	 RST 	 : in STD_LOGIC;	 
	 LISTO   : OUT STD_LOGIC;
	 RESUMEN : OUT STD_LOGIC_VECTOR(255 downto 0)
     );
end component SHA256_iterativo1R;
---------------------------------


---------------------PADDER------------------------
component Pad_SHA 
 Port (
        entrada_pad : in std_logic_vector (112 downto 0);
        clk         : in std_logic;
        rst         : in std_logic;
        iniciar_pad : in std_logic;
        done_pad    : out std_logic;
        salida_pad  : out std_logic_vector (31 downto 0)
      );
end component Pad_SHA;
---------------------------------

------------Chaos-----------------------
 component CaosAlAl
     Port ( clk : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           done_chaos : out  STD_LOGIC;
           start_chaos : in STD_LOGIC;
           salida_caos: out std_logic_vector (112 downto 0)
           );
 end component CaosAlAl;
 ---------------------
----------multiplier---------
component serial_multiplier_113
	port(
	 	ax : in  std_logic_vector(112 downto 0); 
		bx : in  std_logic_vector(112 downto 0);	 
		cx : out std_logic_vector(112 downto 0);		-- cx = ax*bx mod Fx
		RST : in std_logic;
		clk	  : in std_logic;
		start_ecc : in std_logic;
		done_ecc  : out std_logic
	);	
end component serial_multiplier_113;
 ---------------- end components--------------------
 
 --lado izq pines y lado derecho los cables, lo izq no se modfica
 ---lado derecho si se bautiza, es el nombre que le doy al cable
begin

SMALL2BIG_1: small2big
   port map(
    entrada_s2b => A,
    clk  => clk, 
    salida_s2b => entrada_pad_signal,  
    full_s2b=>iniciar_pad_signal
       );	
PADDER: Pad_SHA
    port map(
     entrada_pad => entrada_pad_signal,
     clk => clk,
     rst => RST,       
     iniciar_pad => iniciar_pad_signal,
     done_pad => RESUMIR_signal,     
     salida_pad  => PALABRA_signal    
        );  
    
SHA2: sha256_iterativo1R	
	port map( 	
	 PALABRA => PALABRA_signal,
 	 RESUMIR => RESUMIR_signal, 
 	 CLK => clk,
	 RST => RST,
	 LISTO => flag_Valid_hash,
	 RESUMEN => SALIDA_HASH
           );	
 ECC: serial_multiplier_113
    port map(
    	ax  => entrada_pad_signal,
		bx  => salida_caos_signal,
		cx  => Ciphered,
		RST => RST,
		clk => clk,
		start_ecc => out0_signal,
		done_ecc => flag_valid_cipher 
    );    
    
 CHAOS: CaosAlAl	
	port map(
	       clk  => clk, 
           RST => RST,
           done_chaos => out0_signal,
           start_chaos => iniciar_pad_signal,
           salida_caos => salida_caos_signal
           );   
            
end architecture;

