library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BIN_to_BCD is
    port ( 
        Num:     in   std_logic_vector (15 downto 0);
        U:       out  std_logic_vector (4 downto 0);
        D:       out  std_logic_vector (4 downto 0);
        C:       out  std_logic_vector (4 downto 0);
        M:       out  std_logic_vector (4 downto 0)
    );
end entity;

architecture Behavioral of BIN_to_BCD is
    signal estNegatif : integer := 0;
    signal Num_int : std_logic_vector(15 downto 0);
    alias Hex_Display_Data: std_logic_vector (15 downto 0) is Num_int;  
    alias rpm_1:    std_logic_vector (4 downto 0) is U;
    alias rpm_10:   std_logic_vector (4 downto 0) is D;
    alias rpm_100:  std_logic_vector (4 downto 0) is C;
    alias rpm_1000: std_logic_vector (4 downto 0) is M;
begin
    Num_int <= std_logic_vector(to_unsigned(-to_integer(signed(Num)), Num_int'length)) when Num(15) = '1' else
               Num;

    estNegatif <= 1 when Num(15) = '1' else
                  0;

    process (Hex_Display_Data)
        type fourbits is array (3 downto 0) of std_logic_vector(3 downto 0);
        variable bcd:   std_logic_vector (15 downto 0);
        variable bint:  std_logic_vector (13 downto 0);
        variable aMillier : integer := 0;
    begin
        if (to_integer(unsigned(Num_int)) > 9999) then
            rpm_1 <= "10001";
            rpm_10 <= "10001";
            rpm_100 <= "01110";
            rpm_1000 <= "11111";
        else
        bcd := (others => '0');
        bint := Hex_Display_Data (13 downto 0);

        for i in 0 to 13 loop
            bcd(15 downto 1) := bcd(14 downto 0);
            bcd(0) := bint(13);
            bint(13 downto 1) := bint(12 downto 0);
            bint(0) := '0';

            if i < 13 and bcd(3 downto 0) > "0100" then
                bcd(3 downto 0) := 
                    std_logic_vector (unsigned(bcd(3 downto 0)) + 3);
            end if;
            if i < 13 and bcd(7 downto 4) > "0100" then
                bcd(7 downto 4) := 
                    std_logic_vector(unsigned(bcd(7 downto 4)) + 3);
            end if;
            if i < 13 and bcd(11 downto 8) > "0100" then
                bcd(11 downto 8) := 
                    std_logic_vector(unsigned(bcd(11 downto 8)) + 3);
            end if;
            if i < 13 and bcd(15 downto 12) > "0100" then
                aMillier := 1;
                bcd(11 downto 8) := 
                    std_logic_vector(unsigned(bcd(15 downto 12)) + 3);
            end if;
        end loop;

        (rpm_1000, rpm_100, rpm_10, rpm_1) <= fourbits'( '0'&bcd (15 downto 12), '0'&bcd (11 downto 8), '0'&bcd ( 7 downto  4), '0'&bcd ( 3 downto 0));

        if (Num(15) = '1' and to_integer(unsigned(Num_int)) <= 999) then
            rpm_1000 <= "10000";
        end if;
        end if;
    end process ;
end architecture;