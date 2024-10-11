library IEEE;
use IEEE.std_logic_1164.all;

entity genhab_tb is
end;

architecture genhab_tb_arq of genhab_tb is 
    component genhab is
        generic(
            N: natural := 7
        );
        port(
            clk_i: in std_logic;
            rst_i: in std_logic;
            ena_i: in std_logic;
            q_o: out std_logic
        );
    end component;

    constant N_tb : natural := 7;
    signal clk_i_tb : std_logic := '0';
    signal rst_i_tb : std_logic := '0';
    signal ena_i_tb : std_logic := '1';
    signal q_o_tb : std_logic;

begin

    clk_i_tb <= not clk_i_tb after 10 ns;

    DUT: genhab
    generic map (N => N_tb)
    port map (
        clk_i => clk_i_tb,
        rst_i => rst_i_tb,
        ena_i => ena_i_tb,
        q_o => q_o_tb
    );

end;