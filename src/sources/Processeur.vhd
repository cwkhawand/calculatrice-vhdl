library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Processeur is
    Port ( Clk, Reset, ToucheEstAppuyee                     : in STD_LOGIC;
           Touche                                           : in STD_LOGIC_VECTOR (3 downto 0);
           Num1, Num2                                       : out STD_LOGIC_VECTOR (7 downto 0);
           Operation, SelAffichage                          : out STD_LOGIC_VECTOR (1 downto 0);
           EffectueCalcul                                   : out STD_LOGIC);
end Processeur;

architecture Behavioral of Processeur is
Signal EffectueCalcul_int           : STD_LOGIC := '0';
Signal Num1_estNeg_int, Num1_estNeg_out, Num2_estNeg_int, Num2_estNeg_out : STD_LOGIC_VECTOR(1 downto 0) := "00";
Signal Num1_int, Num2_int           : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
Signal Num1_out, Num2_out           : STD_LOGIC_VECTOR (7 downto 0);
Signal Operation_int, Operation_out : STD_LOGIC_VECTOR(1 downto 0) := "00";
Signal ToucheEstAppuyeeAv           : STD_LOGIC := '0';
begin
    Num1 <= Num1_out;
    Num2 <= Num2_out;
    Operation <= Operation_out;
    EffectueCalcul <= EffectueCalcul_int;

    -- Registre indiquant si le numero 1 est negatif ou pas
    Numero_1_estNeg: entity work.RegistreD(Behavioral)
    generic map(2)
    port map(Clk, Reset, Num1_estNeg_int, Num1_estNeg_out);

    -- Registre contenant le 1er operande
    Numero_1: entity work.RegistreD(Behavioral)
    port map(Clk, Reset, Num1_int, Num1_out);

    -- Registre indiquant si le numero 2 est negatif ou pas
    Numero_2_estNeg: entity work.RegistreD(Behavioral)
    generic map(2)
    port map(Clk, Reset, Num2_estNeg_int, Num2_estNeg_out);

    -- Registre contenant le 2eme operande
    Numero_2: entity work.RegistreD(Behavioral)
    port map(Clk, Reset, Num2_int, Num2_out);

    -- Registre contenant l'operation a faire
    Operateur: entity work.RegistreD(Behavioral)
    generic map(2)
    port map(Clk, Reset, Operation_int, Operation_out);

    SelAffichage <= "00" when Operation_out = "00" and EffectueCalcul_int='0' else
                    "01" when Operation_out /= "00" and EffectueCalcul_int='0' else
                    "10" when Operation_out /= "00" and EffectueCalcul_int='1';

    process (Clk, Reset) is
    Variable Num1_proc, Num2_proc : integer;
    begin
        if (Reset = '1') then
            Num1_int <= (others => '0');
            Num2_int <= (others => '0');
            Num1_estNeg_int <= "00";
            Num2_estNeg_int <= "00";
            Operation_int <= "00";
            EffectueCalcul_int <= '0';
        elsif (rising_edge(Clk)) then
            ToucheEstAppuyeeAv <= ToucheEstAppuyee;
            if (ToucheEstAppuyee = '1' and ToucheEstAppuyeeAv = '0') then
                if (Touche <= x"9") then
                    if (Operation_out = "00") then
                        Num1_proc := to_integer(signed(Num1_out)) rem 10;
                        if (Num1_estNeg_int = "00") then
                            Num1_proc := Num1_proc*10 + to_integer(unsigned(Touche));
                        else
                            Num1_proc := Num1_proc*10 - to_integer(unsigned(Touche));
                        end if;
                        Num1_int <= std_logic_vector(to_signed(Num1_proc, Num1_int'length));
                    else
                        Num2_proc := to_integer(signed(Num2_out)) rem 10;
                        if (Num2_estNeg_int = "00") then
                            Num2_proc := Num2_proc*10 + to_integer(unsigned(Touche));
                        else
                            Num2_proc := Num2_proc*10 - to_integer(unsigned(Touche));
                        end if;
                        Num2_int <= std_logic_vector(to_signed(Num2_proc, Num2_int'length));
                    end if;
                elsif (Touche = x"b") then
                    if (Num2_int = x"00") then
                        Operation_int <= "11";
                    end if;
                elsif (Touche = x"c") then
                    if (Num2_int = x"00") then
                        Operation_int <= "01";
                    end if;
                elsif (Touche = x"d") then
                    if (Operation_int /= "00") then
                        EffectueCalcul_int <= '1';
                    end if;
                elsif (Touche = x"e") then
                    if (Num1_int = x"00") then
                        Num1_estNeg_int <= "11";
                    elsif (Operation_int = "00") then
                        Operation_int <= "10";
                    elsif (Operation_int /= "00" and Num2_int = x"00") then
                        Num2_estNeg_int <= "11";
                    end if;
                end if;
            end if;
        end if;
    end process;
end Behavioral;
