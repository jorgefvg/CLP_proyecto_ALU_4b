library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- Contador binario 4 bits por comportamiento

entity contbin4b_comp is
	generic( N : natural := 4 );
	port(
		clk_i	: in  std_logic;						
		rst_i	: in  std_logic;
        hab_i   : in  std_logic;
        sal_o   : out std_logic_vector(N-1 downto 0)
	);
end;

architecture contbin4b_comp_arq of contbin4b_comp is

    signal aux_o : std_logic_vector(N-1 downto 0) := "0000";

begin
    p_Contador: process (clk_i, rst_i)
    begin
        if (rst_i = '1') then
            aux_o <= "0000";
        else 
            if (rising_edge(clk_i)) then
                if (hab_i = '1') then
                    aux_o <= std_logic_vector(unsigned(aux_o) + 1);
                    sal_o <= aux_o;
                end if;
            end if;
        end if;
        
    end process;
end architecture contbin4b_comp_arq;