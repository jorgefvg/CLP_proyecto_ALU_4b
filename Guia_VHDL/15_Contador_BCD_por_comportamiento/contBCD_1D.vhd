library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Contador BCD de 1 digito por comportamiento

entity contBCD_1D is
    port(
        clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		sal_o: out std_logic_vector(3 downto 0);
        ovf_o: out std_logic
    ); 
end;

architecture contBCD_1D_arq of contBCD_1D is

    signal aux : std_logic_vector(3 downto 0) := "0000";

begin

proceso: process(clk_i)
    begin
        if (rising_edge(clk_i)) then
            if (ena_i = '1') then
                if (rst_i = '1') then
                    aux <= "0000";
                else
                    if (unsigned(aux) = 9) then
                        aux <= "0000";
                        ovf_o <= '1';
                    else
                        aux <= std_logic_vector(unsigned(aux) + 1);
                        ovf_o <= '0';
                    end if;    
                end if;
                sal_o <= aux;
            end if;
        end if;
    end process;

end architecture;