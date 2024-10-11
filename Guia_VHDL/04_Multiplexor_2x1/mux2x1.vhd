library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
  port
  (
    in1 : in std_logic;
    in2 : in std_logic;
    sel : in std_logic;
    sal : out std_logic
  );
end mux2x1;

architecture mux2x1_arq of mux2x1 is
begin
    sal <= in1 when sel = '0' else in2; 
end mux2x1_arq;