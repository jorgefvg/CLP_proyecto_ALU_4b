library IEEE;
use IEEE.std_logic_1164.all;

entity reg is
	generic(
		N		: natural := 4
	);
	port(
		clk_i	: in std_logic;						 -- clock
		rst_i	: in std_logic;						 -- reset sincronico
		ena_i	: in std_logic;						 -- habilitador
		d_i		: in std_logic_vector(N-1 downto 0); -- dato de entrada
		q_o		: out std_logic_vector(N-1 downto 0) -- dato de salida
	);
end;

architecture reg_arq of reg is
begin
	process(clk_i)
	begin
		if rising_edge(clk_i) then
			if rst_i = '1' then
				q_o <= (others => '0');
			elsif ena_i = '1' then
				q_o <= d_i;
			end if;
		end if;
	end process;

end;