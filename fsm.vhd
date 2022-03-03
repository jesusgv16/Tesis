library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity fsm is
    port (        
        clk : in  std_logic;
        RST : in std_logic;
        x, full_s2b, done_ecc, done_b2s, done_hash : in std_logic;
        z, iniciar_s2b,iniciar_b2s : out std_logic
    );
end fsm;
 
architecture Behavioral of fsm is
  type estados_t is (q0,q1,q2,q3,q4);
  signal estado : estados_t; 

begin

   process (clk,RST) begin
    if(RST='1') then
      estado <= q0;
      z <= '0';
    elsif rising_edge(clk) then
      case(estado) is
        when q0 => ----- Estado Llenado S2B
         iniciar_s2b <='1';
          z <= '0';--salida
          if(full_s2b='0') then estado <= q0;
          else estado <= q1;
          end if;
        when q1 =>---estado ECC
          z <= '0';----salida
          if(done_ecc='0') then estado <= q1;
          else estado <= q2;---si done_ecc=1 se va a estado q2
          end if;
        when q2 => ---estado desfogue B2S
          z <= '0';----salida
          iniciar_b2s<='1';
          if(done_b2s='0') then estado <= q2;
          else estado <= q3; ---- si se lleno se va a SHA
          end if;
        when q3 =>
          z <= '0'; 
          if(done_hash='0') then estado <= q3;
          else estado <= q4; 
          end if;
        when q4 =>----estado final
          z <= '1';-------salida indicando que termino
          if(x='0') then estado <= q4;  --se queda atascado aqui hasta tener un reset
          else estado <= q4;
          end if;
        when others => null;
      end case;
    end if;
  end process;
 end Behavioral;
