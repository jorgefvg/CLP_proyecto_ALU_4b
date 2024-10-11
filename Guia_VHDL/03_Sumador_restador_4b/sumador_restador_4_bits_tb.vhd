library ieee;
use ieee.std_logic_1164.all;

entity sumador_restador_4_bits_tb is
end entity sumador_restador_4_bits_tb;

architecture sumador_restador_4_bits_tb_arq of sumador_restador_4_bits_tb is

    component  sumador_restador_4_bits is
        port (
            a, b : in std_logic_vector(3 downto 0); 
            sr: in std_logic; -- suma = 0, resta = 1
            s : out std_logic_vector(3 downto 0);
            co: out std_logic
        );
    end component;

    signal a, b : std_logic_vector(3 downto 0); 
    signal sr: std_logic;
    signal s : std_logic_vector(3 downto 0);
    signal co: std_logic;

begin

    -- instancia a testear
    instancia : sumador_restador_4_bits
        port map (
            a => a,
            b => b,
            sr => sr,
            s => s,
            co => co
        );

    -- proceso de estimulos
    process
    begin
        a <= "1110";
        b <= "0001";
        sr <= '1';
        wait for 10 ns;

        a <= "1110";
        b <= "0001";
        sr <= '0';
        wait for 10 ns;

        wait;
    end process;

end architecture sumador_restador_4_bits_tb_arq;