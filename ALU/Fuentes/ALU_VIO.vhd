library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU_VIO is
    port(
        clk : in std_logic;                         -- Reloj para la ALU
        A : in std_logic_vector(3 downto 0);        -- Entrada A de 4 bits
        B : in std_logic_vector(3 downto 0);        -- Entrada B de 4 bits
        ALU_Sel : in std_logic_vector(1 downto 0);  -- Selector de operaci贸n
        Result : out std_logic_vector(7 downto 0);  -- Resultado de la operaci贸n (se utilizan 8 bits para manejar multiplicaci贸n)
        CarryOut : out std_logic                    -- Salida de acarreo o pr茅stamo
    );
end entity ALU_VIO;

architecture ALU_VIO_arq of ALU_VIO is

    -- Se帽ales internas para las operaciones
    signal Sum: std_logic_vector(3 downto 0);
    signal Difference: std_logic_vector(3 downto 0);
    signal Product: std_logic_vector(7 downto 0);
    signal Quotient: std_logic_vector(3 downto 0);
    signal Remainder: std_logic_vector(3 downto 0);
    signal Carry: std_logic;
    signal Borrow: std_logic;
    
    -- Declaraci髇 del componente VIO
    COMPONENT vio_0
      PORT (
        clk : IN STD_LOGIC;
        probe_in0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);   -- Monitorea int_result (ahora 8 bits)
        probe_in1 : IN STD_LOGIC;                      -- Monitorea int_carryout (ancho de 1 bit)
        probe_out0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- Controla A
        probe_out1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- Controla B
        probe_out2 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)  -- Controla ALU_Sel
      );
    END COMPONENT;

    -- Se帽ales para conectar el VIO con la ALU
    signal vio_A: std_logic_vector(3 downto 0);
    signal vio_B: std_logic_vector(3 downto 0);
    signal vio_ALU_Sel: std_logic_vector(1 downto 0);

    -- Se帽ales internas para los resultados de cada operacion
    signal int_result: std_logic_vector(7 downto 0);
    signal int_carryout: std_logic;

begin
    -- Instancia del sumador de 4 bits usando sumNb (que a la vez uriliza sub1b)
    sumador_inst: entity work.sumNb
        generic map(N => 4)
        port map(
            a_i => vio_A,
            b_i => vio_B,
            ci_i => '0',
            s_o => Sum,
            co_o => Carry
        );

    -- Instancia de la resta de 4 bits
    subtractor_inst: entity work.subtractor4b
        port map(
            a => vio_A,
            b => vio_B,
            diff => Difference,
            borrow => Borrow
        );

    -- Instancia del multiplicador de 4 bits
    multiplier_inst: entity work.multiplier4b
        port map(
            a => vio_A,
            b => vio_B,
            product => Product
        );

    -- Instancia del divisor de 4 bits
    divider_inst: entity work.divider4b
        port map(
            clk => clk, -- Conectar el reloj
            dividend => vio_A,
            divisor => vio_B,
            quotient => Quotient,
            remainder => Remainder
        );
		
    -- Proceso para seleccionar la operaci贸n que debe realizar la ALU
    process(clk)
    begin
        if rising_edge(clk) then
            case vio_ALU_Sel is
                when "00" =>                           -- Operaci贸n de suma
                    int_result <= "0000" & Sum;        -- Extender el resultado a 8 bits
                    int_carryout <= Carry;
                when "01" =>                           -- Operaci贸n de resta
                    int_result <= "0000" & Difference; -- Extender el resultado a 8 bits
                    int_carryout <= Borrow;            -- Usar Borrow para indicar el pr茅stamo
                when "10" =>                           -- Operaci贸n de multiplicaci贸n
                    int_result <= Product;
                    int_carryout <= '0';               -- No se usa CarryOut en multiplicaci贸n
                when "11" =>                           -- Operaci贸n de divisi贸n
                    int_result <= "0000" & Quotient;   -- Extender el cociente a 8 bits
                    int_carryout <= '0';               -- No se usa CarryOut en divisi贸n
                when others =>
                    int_result <= (others => '0');     -- Estado por defecto (sin operaci贸n)
                    int_carryout <= '0';
            end case;

            -- Aque se actualiza el resultado en las salidas
            Result <= int_result;
            CarryOut <= int_carryout;
        end if;
    end process;
    
    -- Instancia del VIO para controlar y monitorear se馻les
    vio_inst: vio_0
        port map (
            clk => clk,                 -- Conectar el reloj
            probe_in0 => int_result,    -- Monitorea int_result
            probe_in1 => int_carryout,  -- Monitorea int_carryout (debe ser de 1 bit)
            probe_out0 => vio_A,        -- Controla A
            probe_out1 => vio_B,        -- Controla B
            probe_out2 => vio_ALU_Sel   -- Controla ALU_Sel
        );

end architecture ALU_VIO_arq;