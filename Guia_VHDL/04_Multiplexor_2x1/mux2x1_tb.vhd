library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_tb is
end;

architecture mux2x1_tb_arq of mux2x1_tb is

	-- Declaracion de componente
	component mux2x1 is
		port(
			in1: in std_logic;
			in2: in std_logic;
			sel: in std_logic;
			sal: out std_logic
		);
	end component;
	
	-- Declaracion de senales de prueba
	signal in1_tb: std_logic := '1';
	signal in2_tb: std_logic := '0';
	signal sel_tb: std_logic := '0';
	signal sal_tb: std_logic;

begin

	in1_tb <= '0' after 500 ns;
	in2_tb <= '1' after 600 ns;
	sel_tb <= not sel_tb after 100 ns;

	DUT: mux2x1
		port map(
			in1	=> in1_tb, 
			in2	=> in2_tb,
			sel => sel_tb,
			sal	=> sal_tb
		);
	
end;