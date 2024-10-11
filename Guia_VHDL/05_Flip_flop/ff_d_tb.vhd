library ieee;
use ieee.std_logic_1164.all;

entity ff_d_tb is
end;

architecture ff_d_tb_arq of ff_d_tb is

	-- Declaracion de componente
	component ff_d is
		port(
            i_ent : in std_logic;  -- entrada D
            i_clk : in std_logic;  -- entrada de reloj
            i_hab : in std_logic;  -- entrada de habilitacion
            i_rst : in std_logic;  -- entrada de reset
            o_sal : out std_logic  -- salida Q
		);
	end component;
	
	-- Declaracion de senales de prueba
	signal i_ent_tb: std_logic := '0';
	signal i_clk_tb: std_logic := '0';
	signal i_hab_tb: std_logic := '0';
    signal i_rst_tb: std_logic := '0';
	signal o_sal_tb: std_logic;

begin

	i_clk_tb <= not i_clk_tb after 10 ns;
	i_ent_tb <= not i_ent_tb after 30 ns;
    i_hab_tb <= '1' after 100 ns, '0' after 150 ns, '1' after 200 ns; 
	i_rst_tb <= '1' after 250 ns, '0' after 300 ns;

	DUT: ff_d
		port map(
			i_ent => i_ent_tb, 
			i_clk => i_clk_tb,
			i_hab => i_hab_tb,
			i_rst => i_rst_tb,
            o_sal => o_sal_tb
		);
	
end;