library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity contBCD_gen is
    generic(
        N: natural := 4
    );
	port(
		clk_i: in std_logic; --clk de 100Mhz
		rst_i: in std_logic;
		ena_i: in std_logic;
		s_o: out std_logic_vector(3 downto 0)
	);
end contBCD_gen;


architecture contBCD_gen_arq of contBCD_gen is

	component contBCD_com is
		port(
			clk_i	: in std_logic;
			rst_i	: in std_logic;
			ena_i	: in std_logic;
			s_o		: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component genEna is
		generic(
			N		: natural := 4
		);
		port(
			clk_i	: in std_logic;
			rst_i	: in std_logic;
			ena_i	: in std_logic;
			q_o		: out std_logic
		);
	end component;

	signal ena_pulse: std_logic;
	signal ena_aux	: std_logic;
	
begin

	ena_aux <= ena_i and ena_pulse;
	
	inst_gen_ena: genEna
		generic map(
			N => N
		)
		port map(
			clk_i 	=> clk_i,
			rst_i 	=> rst_i,
			ena_i	=> ena_i,
			q_o 	=> ena_pulse
		);
		
	inst_contBCD: contBCD_com
		port map(
			clk_i => clk_i,
			rst_i => rst_i,
			ena_i => ena_aux,
			s_o => s_o
		);
 		
end contBCD_gen_arq ; -- arch