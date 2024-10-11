library ieee;
use ieee.std_logic_1164.all;

entity sumador_completo is
    port (
        a, b, ci: in std_logic;
        s, co: out std_logic
    );
end entity sumador_completo;

architecture sumador_completo_arq of sumador_completo is
begin
    s <= a xor b xor ci;
    co <= (a and b) or (ci and (a xor b));
end architecture sumador_completo_arq;