----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2022 15:57:17
-- Design Name: 
-- Module Name: Additionneur_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplieur_tb is
--  Port ( );
end Multiplieur_tb;

architecture Behavioral of Multiplieur_tb is
signal numero_1, numero_2 : STD_LOGIC_VECTOR(7 downto 0);
signal resultat : STD_LOGIC_VECTOR(15 downto 0);
begin

Multiplieur: entity work.Multiplieur(Behavioral)
port map (numero_1, numero_2, resultat);

process
begin
    numero_1 <= x"00";
    numero_2 <= x"00";
    wait for 10 ns;
    numero_1 <= x"01";
    numero_2 <= x"00";
    wait for 10 ns;
    numero_1 <= x"01";
    numero_2 <= x"01";
    wait for 10 ns;
    numero_1 <= x"01";
    numero_2 <= x"02";
    wait for 10 ns;
    numero_1 <= x"04";
    numero_2 <= x"02";
    wait for 10 ns;
    numero_1 <= x"04";
    numero_2 <= x"04";
    wait for 10 ns;
    numero_1 <= x"0a";
    numero_2 <= x"0a";
    wait for 10 ns;
    numero_1 <= x"0a";
    numero_2 <= x"06";
    wait for 10 ns;
end process;

end Behavioral;
