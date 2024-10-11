library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplier4b is
    port(
        a : in std_logic_vector(3 downto 0);        -- Multiplicando de 4 bits.
        b : in std_logic_vector(3 downto 0);        -- Multiplicador de 4 bits.
        product : out std_logic_vector(7 downto 0)  -- Producto de 8 bits.
    );
end entity multiplier4b;

architecture multiplier4b_arq of multiplier4b is
begin
    -- Proceso que se activa cuando cambian las señales 'a' o 'b'.
    process(a, b)
        variable temp_product: unsigned(7 downto 0) := (others => '0'); -- Aqui se almacena el producto temporalmente.
        variable partial_product: unsigned(7 downto 0);                 -- Producto parcial para cada bit.
    begin
        temp_product := (others => '0');                                -- Se inicializa el producto temporal

        -- Calcula productos parciales y los acumula
        for i in 0 to 3 loop
            if b(i) = '1' then
                -- Desplaza 'a' y genera el producto parcial
                partial_product := unsigned("0000" & a) sll i;
                -- Suma el producto parcial al producto temporal
                temp_product := temp_product + partial_product;
            end if;
        end loop;

        -- Asigna el producto calculado a la salida.
        product <= std_logic_vector(temp_product);
    end process;
end architecture multiplier4b_arq;