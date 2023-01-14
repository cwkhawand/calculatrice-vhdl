----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2022 19:23:18
-- Design Name: 
-- Module Name: Mux_res - Behavioral
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

entity Mux_res is
    Port ( Num_1     : in STD_LOGIC_VECTOR (19 downto 0);
           Num_2     : in STD_LOGIC_VECTOR (19 downto 0);
           Res       : in STD_LOGIC_VECTOR (19 downto 0);
           Sel       : in STD_LOGIC_VECTOR (1 downto 0);
           Affichage : out STD_LOGIC_VECTOR (19 downto 0));
end Mux_res;

architecture Behavioral of Mux_res is

begin

With Sel select
Affichage <= Num_1 when "00",
             Num_2 when "01",
             Res when "10",
             x"00000" when others;

end Behavioral;
