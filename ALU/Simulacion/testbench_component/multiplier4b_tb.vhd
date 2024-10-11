library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplier4b_tb is
end;

architecture multiplier4b_tb_arq of multiplier4b_tb is

	 -- Componente
    component multiplier4b
        port(
            a : in std_logic_vector(3 downto 0);
            b : in std_logic_vector(3 downto 0);
            product : out std_logic_vector(7 downto 0)
        );
    end component;
	
	-- Declaracion de senales de prueba
    signal a_tb : std_logic_vector(3 downto 0) := "0000";
    signal b_tb : std_logic_vector(3 downto 0) := "0000";
    signal product_tb : std_logic_vector(7 downto 0);
	
begin
    
	-- Instancia
    DUT: entity work.multiplier4b
        port map(
            a => a_tb,
            b => b_tb,
            product => product_tb
        );

    -- Test
    process
    begin
        -- caso 1: 3 * 2
        a_tb <= "0011";  -- 3 en binario
        b_tb <= "0010";  -- 2 en binario
        wait for 10 ns;
        
        -- caso 2: 7 * 5
        a_tb <= "0111";  -- 7 en binario
        b_tb <= "0101";  -- 5 en binario
        wait for 10 ns;
        
        wait;
    end process;
end architecture multiplier4b_tb_arq;