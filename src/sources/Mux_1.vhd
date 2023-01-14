----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2022 11:46:30 AM
-- Design Name: 
-- Module Name: Mux_1 - Behavioral
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

entity Mux_1 is
    Port ( Sel        : in STD_LOGIC_VECTOR (1 downto 0);
           U          : in STD_LOGIC_VECTOR (4 downto 0);
           D          : in STD_LOGIC_VECTOR (4 downto 0);
           C          : in STD_LOGIC_VECTOR (4 downto 0);
           M          : in STD_LOGIC_VECTOR (4 downto 0);
           Digit      : out STD_LOGIC_VECTOR (4 downto 0));
end Mux_1;

architecture Behavioral of Mux_1 is
begin

Digit <= U when Sel = "00" else
         D when Sel = "01" else
         C when Sel = "10" else
         M when Sel = "11";

end Behavioral;
