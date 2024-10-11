library ieee;
use ieee.std_logic_1164.all;

entity ff_d is
  port
  (
    i_ent : in std_logic;  -- entrada D
    i_clk : in std_logic;  -- entrada de reloj
    i_hab : in std_logic;  -- entrada de habilitacion
    i_rst : in std_logic;  -- entrada de reset
    o_sal : out std_logic  -- salida Q
  );
end ff_d;

architecture ff_d_arq of ff_d is
begin
    FF_D_process:
    process(i_clk) begin
        if (rising_edge(i_clk)) then
            if (i_hab = '1') then
                if (i_rst = '1') then
                    o_sal <= '0';
                else
                    o_sal <= i_ent;
                end if;
            end if;
        end if; 
    end process;
end ff_d_arq;