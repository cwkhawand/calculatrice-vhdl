----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2022 03:29:44 PM
-- Design Name: 
-- Module Name: Compt_2 - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Compt_2 is
port (
   IN_100: in std_logic;
   Reset : in std_logic;
   Sel : out std_logic_vector(1 downto 0)
);
end Compt_2;

architecture Behavioral of Compt_2 is

signal compteur : std_logic_vector(15 downto 0);
signal compteur1 : std_logic_vector(1 downto 0);
signal out1_temp : std_logic;

begin

Sel <= compteur1; 

 process(IN_100, Reset) is
 begin 
  if Reset ='1' then 
  compteur <= (others => '0' ); 
  out1_temp <= '1';
  elsif IN_100'event and IN_100 = '1' then
    if compteur < x"C34F" then 
       compteur <= compteur + x"0001"; 
    elsif compteur = x"C34F" then
       compteur <= (others => '0' );
       out1_temp <= not(out1_temp);
    end if; 
  end if;
 end process; 

process(out1_temp, reset) is
begin
 if Reset ='1' then 
  compteur1 <= (others => '0' ); 
  compteur1 <= "00";
  elsif out1_temp'event and out1_temp = '1' then
    if compteur1 < x"3" then 
       compteur1 <= compteur1 + "01"; 
    elsif compteur1 = "11" then
       compteur1 <= (others => '0' );
    end if; 
  end if;

end process; 


end Behavioral;
