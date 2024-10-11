
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity divider4b is
    port(
        clk : in std_logic;                          -- Señal de reloj
        dividend : in std_logic_vector(3 downto 0);  -- Dividendo de 4 bits
        divisor : in std_logic_vector(3 downto 0);   -- Divisor de 4 bits
        quotient : out std_logic_vector(3 downto 0); -- Cociente
        remainder : out std_logic_vector(3 downto 0) -- Resto
    );
end entity divider4b;

architecture divider4b_arq of divider4b is
    signal dividend_reg, divisor_reg : unsigned(3 downto 0);
    signal quot_reg, rem_reg : unsigned(3 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            -- Registrar las entradas en cada flanco de subida del reloj
            dividend_reg <= unsigned(dividend);
            divisor_reg <= unsigned(divisor);
            
            -- División
            if divisor_reg /= 0 then
                -- Si el divisor no es cero, realizar la división normal
                quot_reg <= dividend_reg / divisor_reg;  -- Cálculo del cociente
                rem_reg <= dividend_reg rem divisor_reg; -- Cálculo del resto
            else
                -- División por cero
                quot_reg <= (others => '1');  -- Todos unos para indicar error
                rem_reg <= dividend_reg;      -- El dividendo se convierte en el resto
            end if;
        end if;
    end process;

    -- Asignar los resultados a las salidas
    quotient <= std_logic_vector(quot_reg);
    remainder <= std_logic_vector(rem_reg);
end architecture divider4b_arq;