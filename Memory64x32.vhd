library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Memory64x32 is
	 port(
		 A : in STD_LOGIC_VECTOR(5 downto 0);
		 SPO : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end Memory64x32;

architecture Memory64x32 of Memory64x32 is
begin
	with A select
	SPO <= 	
x"428a2f98" when "000000",
x"71374491" when "000001",
x"b5c0fbcf" when "000010",
x"e9b5dba5" when "000011",
x"3956c25b" when "000100",
x"59f111f1" when "000101", 
x"923f82a4" when "000110", 
x"ab1c5ed5" when "000111", 
x"d807aa98" when "001000", 
x"12835b01" when "001001", 
x"243185be" when "001010", 
x"550c7dc3" when "001011", 
x"72be5d74" when "001100", 
x"80deb1fe" when "001101", 
x"9bdc06a7" when "001110", 
x"c19bf174" when "001111", 
x"e49b69c1" when "010000", 
x"efbe4786" when "010001", 
x"0fc19dc6" when "010010", 
x"240ca1cc" when "010011", 
x"2de92c6f" when "010100", 
x"4a7484aa" when "010101", 
x"5cb0a9dc" when "010110", 
x"76f988da" when "010111", 
x"983e5152" when "011000", 
x"a831c66d" when "011001", 
x"b00327c8" when "011010", 
x"bf597fc7" when "011011", 
x"c6e00bf3" when "011100", 
x"d5a79147" when "011101", 
x"06ca6351" when "011110", 
x"14292967" when "011111", 
x"27b70a85" when "100000", 
x"2e1b2138" when "100001", 
x"4d2c6dfc" when "100010", 
x"53380d13" when "100011", 
x"650a7354" when "100100", 
x"766a0abb" when "100101", 
x"81c2c92e" when "100110", 
x"92722c85" when "100111", 
x"a2bfe8a1" when "101000", 
x"a81a664b" when "101001", 
x"c24b8b70" when "101010", 
x"c76c51a3" when "101011", 
x"d192e819" when "101100", 
x"d6990624" when "101101", 
x"f40e3585" when "101110", 
x"106aa070" when "101111", 
x"19a4c116" when "110000", 
x"1e376c08" when "110001", 
x"2748774c" when "110010", 
x"34b0bcb5" when "110011", 
x"391c0cb3" when "110100", 
x"4ed8aa4a" when "110101", 
x"5b9cca4f" when "110110", 
x"682e6ff3" when "110111", 
x"748f82ee" when "111000", 
x"78a5636f" when "111001", 
x"84c87814" when "111010", 
x"8cc70208" when "111011", 
x"90befffa" when "111100", 
x"a4506ceb" when "111101", 
x"bef9a3f7" when "111110", 
x"c67178f2" when others;

end Memory64x32;