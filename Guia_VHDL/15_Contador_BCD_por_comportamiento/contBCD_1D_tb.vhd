library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Contador BCD de 1 digito por comportamiento test bench

entity contBCD_1D_tb is 
end;

architecture contBCD_1D_tb_arq of contBCD_1D_tb is 
    component contBCD_1D is 
        port(
            clk_i: in std_logic;
            rst_i: in std_logic;
            ena_i: in std_logic;
            sal_o: out std_logic_vector(3 downto 0);
            ovf_o: out std_logic
        );
    end component;

    signal clk_i_tb: std_logic := '0';
    signal rst_i_tb: std_logic := '0';
    signal ena_i_tb: std_logic := '1';
    signal sal_o_tb: std_logic_vector(3 downto 0);
    signal ovf_o_tb: std_logic;

begin
    clk_i_tb <= not clk_i_tb after 10 ns;
    rst_i_tb <= '1' after 65 ns, '0' after 75 ns;
    ena_i_tb <= '0' after 200 ns, '1' after 300 ns;

    DUT: contBCD_1D
    port map(
        clk_i => clk_i_tb,
        rst_i => rst_i_tb,
        ena_i => ena_i_tb,
        sal_o => sal_o_tb,
        ovf_o => ovf_o_tb
    );
end architecture;