Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_arith.all;
Use ieee.std_logic_unsigned.all;

entity decodeur is
  port (
    Code_Out: in std_logic_vector (4 downto 0);
    Sept_seg: out std_logic_vector (6 downto 0)
  );
end entity decodeur;

architecture Behavioral of decodeur is
begin 
  with Code_Out select
    Sept_seg <= "1000000" when "00000",
                "1111001" when "00001",
                "0100100" when "00010",
                "0110000" when "00011",
                "0011001" when "00100",
                "0010010" when "00101",
                "0000010" when "00110",
                "1111000" when "00111",
                "0000000" when "01000",
                "0010000" when "01001",
                "0001000" when "01010",
                "0000011" when "01011",
                "1000110" when "01100",
                "0100001" when "01101",
                "0000110" when "01110",
                "0001110" when "01111",
                "0111111" when "10000",
                "1001110" when "10001",
                "1110111" when "UUUU" | "XXXX",
                "1111111" when "11111",
                "1111110" when others;
    
end Behavioral;