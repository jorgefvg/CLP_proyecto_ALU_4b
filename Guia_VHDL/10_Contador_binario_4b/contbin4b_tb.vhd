library IEEE;
use IEEE.std_logic_1164.all;

entity contbin4b_tb is
end;

architecture contbin4b_tb_arq of contbin4b_tb is

    component contbin4b is
        generic( 
            N : natural := 4 
        );
	    port(
		    clk_i	: in  std_logic;						
		    rst_i	: in  std_logic;
            hab_i   : in  std_logic;
            sal_o   : out std_logic_vector(N-1 downto 0)
	    );
    end component;

    constant N_tb : natural := 4;

    -- Declaracion de senales de prueba
	signal clk_i_tb: std_logic := '0';
	signal rst_i_tb: std_logic := '0';
    signal hab_i_tb: std_logic := '1';
	signal sal_o_tb: std_logic_vector(N_tb-1 downto 0) := "0000";

begin

    clk_i_tb <= not clk_i_tb after 10 ns;

    DUT: contbin4b
        generic map (N => N_tb)
        port map (
            clk_i => clk_i_tb,
            rst_i => rst_i_tb,
            hab_i => hab_i_tb,
            sal_o => sal_o_tb
        );

end architecture contbin4b_tb_arq;