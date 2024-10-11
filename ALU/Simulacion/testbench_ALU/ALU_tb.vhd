library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU_tb is
end entity ALU_tb;

architecture ALU_tb_arq of ALU_tb is

    -- Componente ALU
    component ALU
        port(
            clk : in std_logic;
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            ALU_Sel : in std_logic_vector(1 downto 0);
            Result : out std_logic_vector(7 downto 0);
            CarryOut : out std_logic
        );
    end component;

    -- Senales de prueba
    signal clk : std_logic := '0';
    signal A : std_logic_vector(3 downto 0);
    signal B : std_logic_vector(3 downto 0);
    signal ALU_Sel : std_logic_vector(1 downto 0);
    signal Result : std_logic_vector(7 downto 0);
    signal CarryOut : std_logic;

    -- Clock
    constant clk_period : time := 10 ns;

begin

    -- Instancia
    DUT: ALU
        port map (
            clk => clk,
            A => A,
            B => B,
            ALU_Sel => ALU_Sel,
            Result => Result,
            CarryOut => CarryOut
        );

    -- process Clock 
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- test
    stim_proc: process
    begin
        -- Inicializacion
        A <= "0000";
        B <= "0000";
        ALU_Sel <= "00";

        -- espera global
        wait for 20 ns;

        -- caso 1: Suma 
        A <= "0010"; B <= "0011"; ALU_Sel <= "00";
        wait for clk_period;
        report "Suma Resultado: " & integer'image(to_integer(unsigned(Result))) & " CarryOut: " & std_logic'image(CarryOut);

        -- caso 2: Resta
        A <= "0100"; B <= "0010"; ALU_Sel <= "01";
        wait for clk_period;
        report "Resta resultado: " & integer'image(to_integer(unsigned(Result))) & " CarryOut: " & std_logic'image(CarryOut);

        -- case 3: Multiplicacion
        A <= "0011"; B <= "0011"; ALU_Sel <= "10";
        wait for clk_period;
        report "Multiplicacion Resultado: " & integer'image(to_integer(unsigned(Result))) & " CarryOut: " & std_logic'image(CarryOut);

        -- case 4: Division
        A <= "0100"; B <= "0010"; ALU_Sel <= "11";
        wait for clk_period;
        report "Division Resultado: " & integer'image(to_integer(unsigned(Result))) & " CarryOut: " & std_logic'image(CarryOut);

        wait;
    end process;

end architecture ALU_tb_arq;
