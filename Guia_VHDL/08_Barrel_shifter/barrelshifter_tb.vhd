library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity barrelshifter_tb is
end;

architecture barrelshifter_tb_arq of barrelshifter_tb is

    component barrelshifter is
        generic( 
            N : natural := 8; 
            M : natural := 3
        );
        port(
            ent_i	: in  std_logic_vector (N-1 downto 0);
            sal_o	: out std_logic_vector (N-1 downto 0);						
            des_i	: in  std_logic_vector (M-1 downto 0)
        );
    end component;

    constant N_tb: natural := 8;
    constant M_tb: natural := 3;

    signal ent_i_tb: std_logic_vector (N_tb-1 downto 0) := "00110000";
    signal sal_o_tb: std_logic_vector (N_tb-1 downto 0);
    signal des_i_tb: std_logic_vector (M_tb-1 downto 0) := "000";

begin

    des_i_tb <= "010" after 50 ns;

    DUT: barrelshifter 
        generic map(
            N => N_tb,
            M => M_tb
        )
        port map(
            ent_i => ent_i_tb,
            sal_o => sal_o_tb,
            des_i => des_i_tb
        );
end;