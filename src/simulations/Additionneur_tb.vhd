library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Additionneur_tb is
--  Port ( );
end Additionneur_tb;

architecture Behavioral of Additionneur_tb is
signal numero_1, numero_2 : STD_LOGIC_VECTOR(7 downto 0);
signal resultat : STD_LOGIC_VECTOR(15 downto 0);
begin

Additionneur: entity work.Additionneur(Behavioral)
port map (numero_1, numero_2, resultat);

process
begin
    numero_1 <= x"00";
    numero_2 <= x"00";
    wait for 10 ns;

    numero_1 <= x"00";
    numero_2 <= x"01";
    wait for 10 ns;

    numero_1 <= x"01";
    numero_2 <= x"01";
    wait for 10 ns;

    numero_1 <= x"02";
    numero_2 <= x"04";
    wait for 10 ns;

    numero_1 <= x"09";
    numero_2 <= x"05";
    wait for 10 ns;

    numero_1 <= x"0a";
    numero_2 <= x"0a";
    wait for 10 ns;

    numero_1 <= x"0c";
    numero_2 <= x"05";
    wait for 10 ns;
end process;

end Behavioral;
