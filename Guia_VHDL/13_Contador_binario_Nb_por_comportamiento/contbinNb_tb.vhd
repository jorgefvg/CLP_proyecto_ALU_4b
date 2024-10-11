library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity contbinNb_tb is
end;

architecture contbinNb_tb_arq of contbinNb_tb is

    component contbinNb is
        generic( 
            N : natural := 5 
        );
	    port(
		    clk_i	: in  std_logic;						
		    rst_i	: in  std_logic;
            hab_i   : in  std_logic;
            sal_o   : out std_logic_vector(N-1 downto 0)
	    );
    end component;

    constant N_tb : natural := 5;

    -- Declaracion de senales de prueba
	signal clk_i_tb: std_logic := '0';
	signal rst_i_tb: std_logic := '0';
    signal hab_i_tb: std_logic := '1';
	signal sal_o_tb: std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(0, N_tb));


begin

    clk_i_tb <= not clk_i_tb after 10 ns;
    hab_i_tb <= '0' after 100 ns, '1' after 130 ns;
    rst_i_tb <= '1' after 200 ns, '0' after 205 ns;

    DUT: contbinNb
        generic map (N => N_tb)
        port map (
            clk_i => clk_i_tb,
            rst_i => rst_i_tb,
            hab_i => hab_i_tb,
            sal_o => sal_o_tb
        );

end architecture contbinNb_tb_arq;