library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;  

entity subtractor4b_tb is
end;

architecture subtractor4b_tb_arq of subtractor4b_tb is

	-- Componente
	component subtractor4b
        port(
            a : in std_logic_vector(3 downto 0);
            b : in std_logic_vector(3 downto 0);
            diff : out std_logic_vector(3 downto 0);
            borrow : out std_logic
        );
    end component;
	
	-- Declaracion de senales de prueba
    signal a_tb : std_logic_vector(3 downto 0) := "0000";
    signal b_tb : std_logic_vector(3 downto 0) := "0000";
    signal diff_tb : std_logic_vector(3 downto 0);
    signal borrow_tb : std_logic;


begin
   -- Instancia
    DUT: entity work.subtractor4b
        port map(
            a => a_tb,
            b => b_tb,
            diff => diff_tb,
            borrow => borrow_tb
        );

    -- Test 
    process
    begin
        -- caso 1: 5 - 3
        a_tb <= "0101";  -- 5 en binario
        b_tb <= "0011";  -- 3 en binario
        wait for 10 ns;
        
        -- caso 2: 0 - 1
        a_tb <= "0000";  -- 0 en binario
        b_tb <= "0001";  -- 1 en binario
        wait for 10 ns;
        
        wait;
    end process;

end architecture subtractor4b_tb_arq;
