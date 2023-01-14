----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2022 10:40:40
-- Design Name: 
-- Module Name: systeme - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Calculatrice is
    Port ( JB : inout STD_LOGIC_VECTOR (7 downto 0);
           Clk : in STD_LOGIC;
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           led15 : out STD_LOGIC;
           Anodex : out STD_LOGIC_VECTOR(3 downto 0));
end Calculatrice;

architecture Structural of Calculatrice is
Signal Reset                                      : STD_LOGIC := '0';
Signal ToucheEstAppuyee                           : STD_LOGIC;
Signal EffectueCalcul                             : STD_LOGIC;
Signal EstNegatif                                 : STD_LOGIC;
Signal Operation                                  : STD_LOGIC_VECTOR(1 downto 0) := "00";
Signal SelAfficheur                               : STD_LOGIC_VECTOR(1 downto 0);
alias  Row_scanner                                : STD_LOGIC_VECTOR(3 downto 0) is JB(3 downto 0);
alias  Col_scanner                                : STD_LOGIC_VECTOR(3 downto 0) is JB(7 downto 4);
signal Touche                                     : STD_LOGIC_VECTOR(3 downto 0) := x"0";
Signal SelAffichage                               : STD_LOGIC_VECTOR(1 downto 0);
Signal Anodex_out                                 : STD_LOGIC_VECTOR(3 downto 0);
Signal Digit                                      : STD_LOGIC_VECTOR(4 downto 0);
Signal Sept_seg_digit, Sept_seg_reg               : STD_LOGIC_VECTOR(6 downto 0);
Signal Num1, Num2                                 : STD_LOGIC_VECTOR(7 downto 0);
Signal Num1_16, Num2_16, Res                      : STD_LOGIC_VECTOR(15 downto 0);
Signal Num1_BCD, Num2_BCD, Res_BCD,resAffiche     : STD_LOGIC_VECTOR(19 downto 0);
alias U                                           : STD_LOGIC_VECTOR(4 downto 0) is resAffiche(4 downto 0);
alias D                                           : STD_LOGIC_VECTOR(4 downto 0) is resAffiche(9 downto 5);
alias C                                           : STD_LOGIC_VECTOR(4 downto 0) is resAffiche(14 downto 10);
alias M                                           : STD_LOGIC_VECTOR(4 downto 0) is resAffiche(19 downto 15);
begin

process (Clk)
Variable ResetCounter : integer := 0;
begin
    if (rising_edge(Clk)) then
        if (Touche = x"a" and ToucheEstAppuyee = '1') then
            ResetCounter := ResetCounter + 1;
            if (ResetCounter = 10000000) then
                Reset <= '1';
            end if;
        else
            ResetCounter := 0;
            Reset <= '0';
        end if;
    end if;
end process;

led15 <= '1' when Res(15)='1' else
         '0';

Num1_16 <= std_logic_vector(resize(signed(Num1), 16));
Num2_16 <= std_logic_vector(resize(signed(Num2), 16));

-- Prend en charge les touches du clavier
Codeur : entity work.Codeur(Behavioral)
port map(clk, Row_scanner, Col_scanner, ToucheEstAppuyee, Touche);

-- Processeur qui gere les entrees du clavier et pilote les calculs
Processeur: entity work.Processeur(Behavioral)
port map(Clk, Reset, ToucheEstAppuyee, Touche, Num1, Num2, Operation, SelAffichage, EffectueCalcul);

-- Calculateur
Calculateur: entity work.Calculateur(Behavioral)
port map(Clk, Reset,  EffectueCalcul, Num1, Num2, Operation, Res);

-- Convertisseur de Binaire en BCD de num1
Num1_to_bcd: entity work.BIN_to_BCD(Behavioral)
port map(Num1_16, Num1_BCD(4 downto 0), Num1_BCD(9 downto 5), Num1_BCD(14 downto 10), Num1_BCD(19 downto 15));

-- Convertisseur de Binaire en BCD de num2
Num2_to_bcd: entity work.BIN_to_BCD(Behavioral)
port map(Num2_16, Num2_BCD(4 downto 0), Num2_BCD(9 downto 5), Num2_BCD(14 downto 10), Num2_BCD(19 downto 15));

-- Convertisseur de Binaire en BCD du resultat
Res_to_bcd: entity work.BIN_to_BCD(Behavioral)
port map(Res, Res_BCD(4 downto 0), Res_BCD(9 downto 5), Res_BCD(14 downto 10), Res_BCD(19 downto 15));

-- Multiplexeur qui decide quel numero afficher sur l'afficher 7seg
Mux_res: entity work.Mux_res(Behavioral)
port map(Num1_BCD, Num2_BCD, Res_BCD, SelAffichage, resAffiche);

-- Balayeur d'afficheurs 7seg
Compt_2: entity work.Compt_2(Behavioral)
port map(clk, '0', SelAfficheur);

-- Selecteur du digit qui va etre affiche sur un 7seg
Mux_1: entity work.Mux_1(Behavioral)
port map(SelAfficheur, U, D, C, M, Digit);

-- Selecteur de l'afficheur 7seg a utiliser
Mux_2: entity work.Mux_2(Behavioral)
port map(SelAfficheur, Anodex_out);

Reg4: entity work.RegistreD(Behavioral)
generic map(4)
port map(Clk, Reset, Anodex_out, Anodex);

-- Decodeur qui s'occupe de gerer les LEDs a allumer pour un numero donne
Decodeur: entity work.decodeur(Behavioral)
port map(Digit, Sept_seg_digit);

Reg7: entity work.RegistreD(Behavioral)
generic map(7)
port map(Clk, Reset, Sept_seg_digit, Sept_seg_reg);

CA <= Sept_seg_reg(0);
CB <= Sept_seg_reg(1);
CC <= Sept_seg_reg(2);
CD <= Sept_seg_reg(3);
CE <= Sept_seg_reg(4);
CF <= Sept_seg_reg(5);
CG <= Sept_seg_reg(6);
    

end Structural;
