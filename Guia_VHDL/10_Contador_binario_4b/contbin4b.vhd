library IEEE;
use IEEE.std_logic_1164.all;

entity contbin4b is
	generic( N : natural := 4 );
	port(
		clk_i	: in  std_logic;						
		rst_i	: in  std_logic;
        hab_i   : in  std_logic;
        sal_o   : out std_logic_vector(N-1 downto 0)
	);
end;

architecture contbin4b_arq of contbin4b is

    component ff_d is
        port(
            i_ent : in std_logic;  -- entrada D
            i_clk : in std_logic;  -- entrada de reloj
            i_hab : in std_logic;  -- entrada de habilitacion
            i_rst : in std_logic;  -- entrada de reset
            o_sal : out std_logic  -- salida Q        
        );
    end component;

    signal aux: std_logic_vector(N-1 downto 0);
    signal aux_o : std_logic_vector(N-1 downto 0) := "0000";

begin

    aux(0) <= hab_i xor aux_o(0);

    FF_D_0: ff_d
    port map(
        i_ent => aux(0),
        i_clk => clk_i,
        i_hab => '1',
        i_rst => rst_i,
        o_sal => aux_o(0)        
    );

    aux(1) <= (hab_i and aux_o(0)) xor aux_o(1);
    FF_D_1: ff_d
    port map(
        i_ent => aux(1),
        i_clk => clk_i,
        i_hab => '1',
        i_rst => rst_i,
        o_sal => aux_o(1)        
    );

    aux(2) <= (hab_i and aux_o(0) and aux_o(1)) xor aux_o(2);
    FF_D_2: ff_d
    port map(
        i_ent => aux(2),
        i_clk => clk_i,
        i_hab => '1',
        i_rst => rst_i,
        o_sal => aux_o(2)        
    );

    aux(3) <= (hab_i and aux_o(0) and aux_o(1) and aux_o(2)) xor aux_o(3);
    FF_D_3: ff_d
    port map(
        i_ent => aux(3),
        i_clk => clk_i,
        i_hab => '1',
        i_rst => rst_i,
        o_sal => aux_o(3)        
    );

    sal_o <= aux_o;

end architecture contbin4b_arq;