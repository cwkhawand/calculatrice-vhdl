----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/18/2022 01:58:24 AM
-- Design Name: 
-- Module Name: Calculatrice_tb - Behavioral
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

entity Calculatrice_tb is
--  Port ( );
end Calculatrice_tb;

architecture Behavioral of Calculatrice_tb is
Signal JB :  STD_LOGIC_VECTOR (7 downto 0) := x"00";
Signal clk:  STD_LOGIC := '1';
Signal CA :  STD_LOGIC;
Signal CB :  STD_LOGIC;
Signal CC :  STD_LOGIC;
Signal CD :  STD_LOGIC;
Signal CE :  STD_LOGIC;
Signal CF :  STD_LOGIC;
Signal CG :  STD_LOGIC;
Signal Anodex : STD_LOGIC_VECTOR(3 downto 0);
begin

clk <= '0' after 5 ns when clk='1' else
       '1' after 5 ns when clk='0';

Calculatrice: entity work.Calculatrice(Structural)
port map(JB, clk, CA, CB, CC, CD, CE, CF, CG, Anodex);

process
begin
    JB(3) <= '0';
    JB(2) <= '0';
    JB(1) <= '1';
    JB(0) <= '0';
    wait for 20 ms;
    JB(3 downto 0) <= x"4";
    wait for 20 ms;
    JB(3 downto 0) <= x"c";
    wait for 20 ms;
    JB(3 downto 0) <= x"6";
    wait for 20 ms;
    JB(3 downto 0) <= x"1";
    wait for 20 ms;
    JB(3 downto 0) <= x"d";
    wait for 20 ms;

end process;
end Behavioral;
