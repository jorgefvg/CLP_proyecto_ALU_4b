library IEEE;
use IEEE.std_logic_1164.all;

entity sum1b_tb is
end;

architecture sum1b_tb_arq of sum1b_tb is

	-- Declaracion de componente
	component sum1b is
		port(
			a_i: in std_logic; --poner senal aca
			b_i: in std_logic; -- aca
			ci_i: in std_logic; -- aca
			s_o: out std_logic; -- capturar lo que salga de aca y de
			co_o: out std_logic -- aca
		);
	end component;
	
	-- Declaracion de senales de prueba
	signal a_tb: std_logic := '0';
	signal b_tb: std_logic := '0';
	signal ci_tb: std_logic := '0';
	signal s_tb: std_logic;
	signal co_tb: std_logic;

begin

	-- a_tb <= '1' after 100 ns, '0' after 500 ns;
	-- b_tb <= '1' after 200 ns, '0' after 400 ns;
	-- ci_tb <= '1' after 150 ns, '0' after 900 ns;
	a_tb <= not a_tb after 20 ns; --esta es una senal a_tb que va cambiar cada 10 ns su estado
	b_tb <= not b_tb after 40 ns;
	ci_tb <= not ci_tb after 80 ns;

	DUT: sum1b   -- dispositivo bajo pruba sera el sumador sum1b
		port map(
			a_i	 => a_tb, 
			b_i	 => b_tb,
			ci_i => ci_tb,
			s_o	 => s_tb,
			co_o => co_tb
		);
	
end;