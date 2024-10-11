library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contBCD_com is
	port(
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		s_o: out std_logic_vector(3 downto 0)
	);
end;

architecture contBCD_com_arq of contBCD_com is

    signal salComp: std_logic;
	signal salMux: std_logic_vector(3 downto 0);
	signal salReg: std_logic_vector(3 downto 0);
	signal salInc: std_logic_vector(3 downto 0);
		
	signal rst_aux: std_logic;


begin

    rst_aux <= (salComp or rst_i);

    contBCD_com_inst : process( clk_i )
    begin
        if rising_edge (clk_i) then
            if (rst_i = '1') then
                salReg <= (others=>'0');
            elsif (ena_i = '1') then
                if(salReg = "1001") then
                    salReg <= (others=>'0');
                else
                    salReg <= std_logic_vector(unsigned(salReg)+1);
                end if;
            else
            end if;
        end if;
    s_o <= salReg;
    end process;
end contBCD_com_arq ;