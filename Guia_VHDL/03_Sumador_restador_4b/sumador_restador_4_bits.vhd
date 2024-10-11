library ieee;
use ieee.std_logic_1164.all;

entity sumador_restador_4_bits is
    port (
        a, b : in std_logic_vector(3 downto 0); 
        sr: in std_logic; -- suma = 0, resta = 1
        s : out std_logic_vector(3 downto 0);
        co: out std_logic
    );
end entity sumador_restador_4_bits;

architecture sumador_restador_4_bits_arq of sumador_restador_4_bits is

    component sumador_completo is
        port (
            a, b, ci: in std_logic;
            s, co: out std_logic
        );
    end component sumador_completo;

    signal c0, c1, c2 : std_logic;
    -- esto es para la resta
    signal temporal : std_logic_vector(3 downto 0);

begin

    -- si se requiere una resta se debe cambiar el valor de b
    temporal(3) <= b(3) xor sr;
    temporal(2) <= b(2) xor sr;
    temporal(1) <= b(1) xor sr;
    temporal(0) <= b(0) xor sr;

    -- instancias
    sumador_0 : sumador_completo
    port map (
        a => a(0),
        b => temporal(0),
        ci => sr,
        s => s(0),
        co => c0
    );

    sumador_1 : sumador_completo
    port map (
        a => a(1),
        b => temporal(1),
        ci => c0,
        s => s(1),
        co => c1
    );


    sumador_2 : sumador_completo
    port map (
        a => a(2),
        b => temporal(2),
        ci => c1,
        s => s(2),
        co => c2
    );


    sumador_3 : sumador_completo
    port map (
        a => a(3),
        b => temporal(3),
        ci => c2,
        s => s(3),
        co => co
    );

end architecture sumador_restador_4_bits_arq;