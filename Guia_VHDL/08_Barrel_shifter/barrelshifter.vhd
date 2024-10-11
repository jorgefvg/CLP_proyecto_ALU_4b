library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity barrelshifter is
	generic( 
        N : natural := 8; 
        M : natural := 3
	);
	port(
		ent_i	: in  std_logic_vector (N-1 downto 0);
		sal_o	: out std_logic_vector (N-1 downto 0);						
		des_i	: in  std_logic_vector (M-1 downto 0)
	);
end;

architecture barrelshifter_arq of barrelshifter is
    signal aux: unsigned (N-1 downto 0);
begin

    aux <= shift_right(unsigned(ent_i), to_integer(unsigned(des_i)));
    sal_o <= std_logic_vector(aux);
    
end architecture barrelshifter_arq;