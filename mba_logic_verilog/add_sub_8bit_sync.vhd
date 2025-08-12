library IEEE; --gemini ile yapılmıştır
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity asd is
port(
a_i         : in std_logic_vector(7 downto 0);
b_i         : in std_logic_vector(7 downto 0);
clk         : in std_logic;
op_i        : in std_logic;
rst_n       : in std_logic;
result_o    : out std_logic_vector(7 downto 0)   
);
end entity asd;

architecture behavioral of asd is
    signal a_unsigned   : unsigned(7 downto 0);
    signal b_unsigned   : unsigned(7 downto 0);
    signal res          : unsigned(7 downto 0);
begin
    a_unsigned  <= unsigned(a_i);
    b_unsigned  <= unsigned(b_i);

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            res <= (others => '0');
        elsif rising_edge(clk) then
            if op_i = '0' then
                res <= a_unsigned + b_unsigned;
            else
                res <= a_unsigned - b_unsigned;
            end if;
        end if;
    end process;

result_o <= std_logic_vector(res);
    
end architecture behavioral;

