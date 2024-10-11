library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity divider4b_tb is
end;

architecture divider4b_tb_arq of divider4b_tb is
    
	-- Componente
    component divider4b
        port(
            clk : in std_logic;
            dividend : in std_logic_vector(3 downto 0);
            divisor : in std_logic_vector(3 downto 0);
            quotient : out std_logic_vector(3 downto 0);
            remainder : out std_logic_vector(3 downto 0)
        );
    end component;
	
	-- Declaracion de senales de prueba
    signal clk : std_logic := '0';
    signal dividend : std_logic_vector(3 downto 0) := "0000";
    signal divisor : std_logic_vector(3 downto 0) := "0000";
    signal quotient : std_logic_vector(3 downto 0);
    signal remainder : std_logic_vector(3 downto 0);

    constant clk_period : time := 50 ns;
	
begin

    -- Instancia
    DUT: entity work.divider4b
        port map(
            clk => clk,
            dividend => dividend,
            divisor => divisor,
            quotient => quotient,
            remainder => remainder
        );

    -- Clock
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    -- Test
    process
    begin
        -- caso 1: 8 / 2
        dividend <= "1000";  -- 8
        divisor <= "0010";   -- 2
        wait for clk_period;
        
        -- caso 2: 15 / 3
        dividend <= "1111";  -- 15
        divisor <= "0011";   -- 3
        wait for clk_period;
        
        wait;
    end process;
	
end architecture divider4b_tb_arq;