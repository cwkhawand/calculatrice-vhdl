----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2022 17:54:03
-- Design Name: 
-- Module Name: RegistreD - Behavioral
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

entity RegistreD is
    Generic (
        N : integer := 8
    );
    Port ( Clk, Reset : in STD_LOGIC;
           D          : in STD_LOGIC_VECTOR ((N-1) downto 0);
           Q          : out STD_LOGIC_VECTOR ((N-1) downto 0));
end RegistreD;

architecture Behavioral of RegistreD is
begin

process (Clk, Reset)
begin
    if (Reset='1') then
        Q <= (others => '0');
    elsif (rising_edge(Clk)) then
        Q <= D;
    end if;
end process;

end Behavioral;
