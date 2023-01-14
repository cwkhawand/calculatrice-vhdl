library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Processeur_tb is
--  Port ( );
end Processeur_tb;

architecture Behavioral of Processeur_tb is
   signal Clk                     : STD_LOGIC := '1';
   signal Reset, ToucheEstAppuyee : STD_LOGIC := '0';
   signal EffectueCalcul          : STD_LOGIC;
   signal Operation, SelAffichage : STD_LOGIC_VECTOR (1 downto 0);
   signal Touche                  : STD_LOGIC_VECTOR (3 downto 0);
   signal Num1, Num2              : STD_LOGIC_VECTOR (7 downto 0);
begin

Clk <= '0' after 5 ns when Clk='1' else
       '1' after 5 ns when Clk='0';

processeur : entity work.Processeur(Behavioral)
port map(Clk, Reset, ToucheEstAppuyee, Touche, Num1, Num2, Operation, SelAffichage, EffectueCalcul);
            
process
begin
    wait for 20 ns;
    Touche <= x"5";
    ToucheEstAppuyee <= '1';
    wait for 200 ns;
    ToucheEstAppuyee <= '0';
    wait for 200 ns;
    Touche <= x"6";
    ToucheEstAppuyee <= '1';
    wait for 200 ns;
    ToucheEstAppuyee <= '0';
    wait for 200 ns;
    Touche <= x"c";
    ToucheEstAppuyee <= '1';
    wait for 200 ns;
    ToucheEstAppuyee <= '0';
    wait for 200 ns;
    Touche <= x"6";
    ToucheEstAppuyee <= '1';
    wait for 200 ns;
    ToucheEstAppuyee <= '0';
    wait for 200 ns;
    Touche <= x"1";
    ToucheEstAppuyee <= '1';
    wait for 200 ns;
    ToucheEstAppuyee <= '0';
    wait for 200 ns;
    Touche <= x"d";
    ToucheEstAppuyee <= '1';
    wait for 200 ns;

end process;

end Behavioral;
