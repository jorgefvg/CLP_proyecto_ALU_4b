library IEEE;
use IEEE.std_logic_1164.all;

entity sum1b is
	port(
		a_i: in std_logic; -- operando a
		b_i: in std_logic; -- operando b
		ci_i: in std_logic; -- carry entrada
		s_o: out std_logic; -- salida o suma
		co_o: out std_logic -- carry salida
	);
end;

architecture sum1b_arq of sum1b is
	-- seccion declarativa

begin
	-- seccion descriptiva, como se suman dos numeros binario, con una xor exclusiva,
	s_o <= a_i xor b_i xor ci_i; -- esto es cuando la suma me da 1
	co_o <= (a_i and b_i) or (a_i and ci_i) or (b_i and ci_i); -- esto es cuando de aparece me aparece un 1, si a y b son 1, a y ci son 1, b y ci son 1
	
end;