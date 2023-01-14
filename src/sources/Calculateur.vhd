----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/18/2022 11:40:16 AM
-- Design Name: 
-- Module Name: Calculateur - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Calculateur is
    Port ( Clk, Reset           : in STD_LOGIC;
           EffectueCalcul       : in STD_LOGIC;
           Num1                 : in STD_LOGIC_VECTOR (7 downto 0);
           Num2                 : in STD_LOGIC_VECTOR (7 downto 0);
           Operation            : in STD_LOGIC_VECTOR (1 downto 0);
           Resultat             : out STD_LOGIC_VECTOR (15 downto 0));
end Calculateur;

architecture Behavioral of Calculateur is
Signal Resultat_int, Resultat_out : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
Signal Num1_dec, Num2_dec : STD_LOGIC_VECTOR(7 downto 0);
Signal EffectueCalculAv : STD_LOGIC := '0';
begin

Resultat <= Resultat_out;

-- Registre contenant le resultat
Res: entity work.RegistreD(Behavioral)
generic map(16)
port map(Clk, Reset, Resultat_int, Resultat_out);

process(Clk, Reset)
begin
    if (Reset = '1') then
        Resultat_int <= (others => '0');
    elsif (rising_edge(Clk)) then
        EffectueCalculAv <= EffectueCalcul;
        if (EffectueCalcul = '1' and EffectueCalculAv = '0') then
            if (Operation = "01") then
                Resultat_int <= std_logic_vector(resize(signed(Num1), 16) + resize(signed(Num2), 16));
            elsif (Operation = "10") then
                Resultat_int <= std_logic_vector(resize(signed(Num1), 16) - resize(signed(Num2), 16));
            elsif (Operation = "11") then
                Resultat_int <= std_logic_vector(signed(Num1) * signed(Num2));
            end if;
        end if;
    end if;
end process;

end Behavioral;
