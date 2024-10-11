library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- Contador binario N bits por comportamiento

entity contbinNb is
	generic( N : natural := 5 );
	port(
		clk_i	: in  std_logic;						
		rst_i	: in  std_logic;
        hab_i   : in  std_logic;
        sal_o   : out std_logic_vector(N-1 downto 0)
	);
end;

architecture contbinNb_arq of contbinNb is

    signal aux_o : std_logic_vector(N-1 downto 0) := std_logic_vector(to_unsigned(0, N));

begin
    p_Contador: process (clk_i, rst_i)
    begin
        if (rst_i = '1') then
            aux_o <= std_logic_vector(to_unsigned(0, N));
        else 
            if (rising_edge(clk_i)) then
                if (hab_i = '1') then
                    aux_o <= std_logic_vector(unsigned(aux_o) + 1);
                    sal_o <= aux_o;
                end if;
            end if;
        end if;
        
    end process;
end architecture contbinNb_arq;