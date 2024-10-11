-- Sumador de 1 bit
library IEEE;
use IEEE.std_logic_1164.all;

-- Definimos la entidad 'sum1b', que representa un sumador de un bit con acarreo
entity sum1b is
	port(
		a_i: in std_logic;  -- operando a
		b_i: in std_logic;  -- operando b
		ci_i: in std_logic; -- carry entrada
		s_o: out std_logic; -- salida o suma
		co_o: out std_logic -- carry salida
	);
end;

-- Definimos la arquitectura del sumador de un bit
architecture sum1b_arq of sum1b is
	-- seccion declarativa
begin
	-- seccion descriptiva

	-- salida o suma 's_o' <= se calcula utilizando la operación XOR en los bits de entrada y el acarreo de entrada
	s_o <= a_i xor b_i xor ci_i;
	
	-- carry de salida 'co_o' <= se calcula utilizando las operaciones AND y OR en los bits de entrada y el acarreo de entrada
	co_o <= (a_i and b_i) or (a_i and ci_i) or (b_i and ci_i);
	
end;