
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Eje18_top is
    Port ( clk : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (3 downto 0);
           sw : in STD_LOGIC_VECTOR (1 downto 0));
end Eje18_top;

architecture Behavioral of Eje18_top is

component contBCD_gen is
    generic(
        N: natural := 4
    );
	port(
		clk_i: in std_logic; --clk de 125Mhz
		rst_i: in std_logic;
		ena_i: in std_logic;
		s_o: out std_logic_vector(3 downto 0)
	);
end component;

begin

	DUT: contBCD_gen
		generic map(
			N => 125000000
		)
		port map(
			clk_i => clk,
			rst_i => sw(0),
			ena_i => sw(1),
			s_o => led
		);

end Behavioral;