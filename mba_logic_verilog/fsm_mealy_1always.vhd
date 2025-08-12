library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_mealy_1always is
port(
x_i     : in std_logic;
clk     : in std_logic;  --Low pass reset
rst_n   : in std_logic;
y_o     : out std_logic   
);
end entity fsm_mealy_1always;

architecture behavioral of fsm_mealy_1always is
    signal A_reg    : std_logic;
    signal B_reg    : std_logic;
begin

process (clk, rst_n)
begin
    if rst_n = '0' then
        A_reg <= '0';
        B_reg <= '0';
    elsif rising_edge(clk) then
        A_reg <= (A_reg and x_i) or (B_reg and x_i);
        B_reg <= (not A_reg) and x_i;
    end if ;
end process

 y_o <= (A_reg or B_reg) and (not x_i);

end architecture behavioral;