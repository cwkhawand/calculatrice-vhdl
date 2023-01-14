Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_arith.all;
Use ieee.std_logic_unsigned.all;

Entity Codeur is
  port (
    Clk        : in std_logic;
    Row        : in std_logic_vector (3 downto 0);
    Col        : out std_logic_vector (3 downto 0);
    estAppuyee : out STD_LOGIC;
    Touche     : out std_logic_vector (3 downto 0)
  );
end entity Codeur;

architecture Behavioral of Codeur is
signal sclk           : STD_LOGIC_VECTOR (25 downto 0) := (others => '0');
signal estAppuyee_int : STD_LOGIC := '0';
begin

estAppuyee <= estAppuyee_int;

process(Clk)
Variable estAppuyeeInst : integer := 0;
begin
  if Clk'event and clk = '1' then
    -- xx ms
    if sclk = "11110100001001000000" then
      --C1
      Col <= "0111";
      sclk <= sclk+1;
      -- check row pins
    elsif sclk = "11110110100101010000" then 
      --R1
      if Row = "0111" then
        Touche <= "0001";
        estAppuyee_int <= '1';
        estAppuyeeInst := 1;
        --1
        --R2
      elsif Row = "1011" then
        Touche <= "0010";
        estAppuyee_int <= '1';
        estAppuyeeInst := 1;
        --2
        --R3
      elsif Row = "1101" then
        Touche <= "0011";
        estAppuyee_int <= '1';
        estAppuyeeInst := 1;
        --3
        --R4
      elsif Row = "1110" then
        Touche <= "1010";
        estAppuyee_int <= '1';
        estAppuyeeInst := 1;
        --A
      end if;
    
      sclk <= sclk+1;
    -- xx ms
    elsif sclk = "111101000010010000000" then
      --C2
      Col<= "1011";
      sclk <= sclk+1;
    -- check row pins
    elsif sclk = "111101010101110010000" then
      --R1
      if Row = "0111" then
        Touche <= "0100";
        estAppuyee_int <= '1';
        estAppuyeeInst := 1;
        --4
        --R2
      elsif Row = "1011" then
        Touche <= "0101";
        estAppuyee_int <= '1';
        estAppuyeeInst := 1;
        --5
        --R3
      elsif Row = "1101" then
        Touche <= "0110";
        estAppuyee_int <= '1';
        estAppuyeeInst := 1;
        --6
        --R4
      elsif Row = "1110" then
        Touche <= "1011";
        estAppuyee_int <= '1';
        estAppuyeeInst := 1;
        --B
      end if;
    
      sclk <= sclk+1;
      -- xx ms
    elsif sclk = "1011011100011011000000" then
      --C3
      Col<= "1101";
      sclk <= sclk+1;
    -- check row pins
    elsif sclk = "1011011110110111010000" then
      --R1
      if Row = "0111" then
        Touche <= "0111";
        estAppuyee_int <= '1';
        estAppuyeeInst := 1;
        --7
        --R2
      elsif Row = "1011" then
        Touche <= "1000";
        estAppuyee_int <= '1';
        estAppuyeeInst := 1;
        --8
        --R3
      elsif Row = "1101" then
        Touche <= "1001";
        estAppuyee_int <= '1';
        estAppuyeeInst := 1;
        --9
        --R4
      elsif Row = "1110" then
        Touche <= "1100";
        estAppuyee_int <= '1';
        estAppuyeeInst := 1;
        --C
      end if;

      sclk <= sclk+1;  
    
    -- xx ms
    elsif sclk = "1111010000100100000000" then
      --C4
      Col<= "1110";
      sclk <= sclk+1;
    -- check row pins
    elsif sclk = "1111010011000000010000" then
      --R1
      if Row = "0111" then
        Touche <= "0000";
        estAppuyee_int <= '1';
        estAppuyeeInst := 1;
        --0
        --R2
      elsif Row = "1011" then
        Touche <= "1111";
        estAppuyee_int <= '1';
        estAppuyeeInst := 1;
        --F
        --R3
      elsif Row = "1101" then
        Touche <= "1110";
        estAppuyee_int <= '1';
        estAppuyeeInst := 1;
        --E
        --R4
      elsif Row = "1110" then
        Touche <= "1101";
        estAppuyee_int <= '1';
        estAppuyeeInst := 1;
        --D
      end if;
      
      sclk <= (others => '0');
      if (estAppuyeeInst = 0) then
        estAppuyee_int <= '0';
      else
        estAppuyeeInst := 0;
      end if;
    else
      sclk <= sclk+1;
    end if;
  end if;
end process;
end Behavioral;