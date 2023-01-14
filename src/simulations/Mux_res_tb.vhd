----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/18/2022 08:47:07 PM
-- Design Name: 
-- Module Name: Mux_res_tb - Behavioral
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

entity Mux_res_tb is
--  Port ( );
end Mux_res_tb;

architecture Behavioral of Mux_res_tb is
Signal Num_1     : STD_LOGIC_VECTOR (15 downto 0);
Signal Num_2     : STD_LOGIC_VECTOR (15 downto 0);
Signal Res       : STD_LOGIC_VECTOR (15 downto 0);
Signal Sel       : STD_LOGIC_VECTOR (1 downto 0);
Signal Affichage : STD_LOGIC_VECTOR (15 downto 0);
begin

Mux_res: entity work.Mux_res(Behavioral)
port map(Num_1, Num_2, Res, Sel, Affichage);

process
begin
    Num_1 <= x"0000";
    Num_2 <= x"00ff";
    Res <= x"ffff";
    Sel <= "00";
    wait for 10 ns;
    Sel <= "01";
    wait for 10 ns;
    Sel <= "10";
    wait for 10 ns;
end process;

end Behavioral;
