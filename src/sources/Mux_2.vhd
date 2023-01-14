----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2022 11:46:30 AM
-- Design Name: 
-- Module Name: Mux_2 - Behavioral
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

entity Mux_2 is
    Port ( SEL : in STD_LOGIC_VECTOR (1 downto 0);
           An_out : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2;

architecture Behavioral of Mux_2 is
begin

With SEL select
An_out <= "1110" when "00",
          "1101" when "01",
          "1011" when "10",
          "0111" when "11",
          "1111" when others;

end Behavioral;
