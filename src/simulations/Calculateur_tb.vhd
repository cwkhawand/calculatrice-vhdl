----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/18/2022 11:49:51 AM
-- Design Name: 
-- Module Name: Calculateur_tb - Behavioral
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

entity Calculateur_tb is
--  Port ( );
end Calculateur_tb;

architecture Behavioral of Calculateur_tb is
    signal Clk                     : STD_LOGIC := '1';
    signal Reset, EffectueCalcul   : STD_LOGIC := '0';
    signal Operation               : STD_LOGIC_VECTOR (1 downto 0);
    signal Num1, Num2              : STD_LOGIC_VECTOR (7 downto 0);
    signal Resultat                : STD_LOGIC_VECTOR (15 downto 0);
begin
 
Clk <= '0' after 5 ns when Clk='1' else
      '1' after 5 ns when Clk='0';

Calculateur: entity work.Calculateur(Behavioral)
port map(Clk, Reset, EffectueCalcul, Num1, Num2, Operation, Resultat);

process
begin
   Operation <= "01";
   Num1 <= x"00";
   Num2 <= x"00";
   wait for 1 ns;
   EffectueCalcul <= '1';
   wait for 200 ns;
   EffectueCalcul <= '0';
   Num1 <= x"0a";
   Num2 <= x"00";
   wait for 1 ns;
   EffectueCalcul <= '1';
   wait for 200 ns;
   EffectueCalcul <= '0';
   Num1 <= x"01";
   Num2 <= x"01";
   wait for 1 ns;
   EffectueCalcul <= '1';
   wait for 200 ns;
   EffectueCalcul <= '0';
   Num1 <= x"0f";
   Num2 <= x"10";
   wait for 1 ns;
   EffectueCalcul <= '1';
   wait for 200 ns;
   Operation <= "11";
   EffectueCalcul <= '0';
   Num1 <= x"00";
   Num2 <= x"00";
   wait for 1 ns;
   EffectueCalcul <= '1';
   wait for 200 ns;
   EffectueCalcul <= '0';
   Num1 <= x"01";
   Num2 <= x"01";
   wait for 1 ns;
   EffectueCalcul <= '1';
   wait for 200 ns;
   EffectueCalcul <= '0';
   Num1 <= x"01";
   Num2 <= x"05";
   wait for 1 ns;
   EffectueCalcul <= '1';
   wait for 200 ns;
   EffectueCalcul <= '0';
   Num1 <= x"05";
   Num2 <= x"06";
   wait for 1 ns;
   EffectueCalcul <= '1';
   wait for 200 ns;
   EffectueCalcul <= '0';
end process;

end Behavioral;
