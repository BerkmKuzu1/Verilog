library IEEE;
use IEEE.std_logic_1164.all;

entity d_flip_flop_rst is
port(
d_i     : in std_logic;
clk     : in std_logic;
rst_n   : in std_logic;
q_o     : out std_logic   
);
end entity d_flip_flop_rst;

architecture behavioral of d_flip_flop_rst is
    signal q    : std_logic;
begin

    process (clk, rst_n)
    begin
        if rst_n = '0' then
            q <= d_i;
        elsif rising_edge(clk) then
            q <= d_i;
        end if;
    end process;

q_o <= q;

end architecture behavioral;