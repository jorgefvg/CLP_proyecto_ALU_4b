library IEEE;
use IEEE.std_logic_1164.all;


entity reg_tb is
end;

architecture reg_tb_arq of reg_tb is

	-- Declaracion de componente
	component reg is
		generic(
			N: natural := 4
		);
		port(
			clk_i	: in std_logic;		                  -- clock
			rst_i	: in std_logic;		                  -- reset sincronico
			ena_i	: in std_logic;		                  -- habilitador
			d_i		: in std_logic_vector(N-1 downto 0);  -- dato de entrada
			q_o		: out std_logic_vector(N-1 downto 0)  -- dato de salida
		);
	end component;	
	
	constant N_tb: natural := 5;
	
	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '0';
	signal ena_tb: std_logic := '1';
	signal d_tb: std_logic_vector(N_tb-1 downto 0) := "00111";
	signal q_tb: std_logic_vector(N_tb-1 downto 0);
	
begin

	clk_tb <= not clk_tb after 10 ns;
	d_tb <= "01000" after 300 ns;
	ena_tb <= '0' after 50 ns, '1' after 400 ns;
	rst_tb <= '1' after 612 ns;
	
	DUT: reg
		generic map(
			N => N_tb
		)
		port map(
			clk_i	=> clk_tb,
            rst_i	=> rst_tb,
            ena_i	=> ena_tb,
            d_i		=> d_tb,
			q_o		=> q_tb
        );

end;