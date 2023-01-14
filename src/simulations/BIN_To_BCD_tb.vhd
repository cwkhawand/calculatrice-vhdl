----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2022 18:53:39
-- Design Name: 
-- Module Name: BIN_To_BCD_tb - Behavioral
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

entity BIN_To_BCD_tb is
--  Port ( );
end BIN_To_BCD_tb;

architecture Behavioral of BIN_To_BCD_tb is
Signal binary : STD_LOGIC_VECTOR(15 downto 0);
Signal U, D, C, M : STD_LOGIC_VECTOR(3 downto 0);
begin

bin_to_bcd: entity work.BIN_to_BCD(Behavioral)
port map(binary, U, D, C, M);

process
begin
    binary <= x"0038";
    wait for 10 ns;
    binary <= x"0001";
    wait for 10 ns;
    binary <= x"000a";
    wait for 10 ns;
    binary <= x"001a";
    wait for 10 ns;
    binary <= x"00b5";
    wait for 10 ns;
    binary <= x"0c01";
    wait for 10 ns;
end process;

end Behavioral;
