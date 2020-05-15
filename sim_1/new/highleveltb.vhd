----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2020 06:30:46 PM
-- Design Name: 
-- Module Name: highleveltb - Behavioral
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

entity highleveltb is
--  Port ( );
end highleveltb;

architecture Behavioral of highleveltb is
component highleveldesign is
    Port ( switchin : in std_logic_vector (3 downto 0);
           pcreset: in std_logic;
           clock: in std_logic;
           fibonacciout : out std_logic_vector (15 downto 0));
end component;

signal fibonacciout:  std_logic_vector(15 downto 0);
signal switchin  : std_logic_vector(3 downto 0);
signal pcreset, clock : std_logic;

begin
    uut: highleveldesign port map(
        switchin => switchin,
        pcreset => pcreset,
        clock => clock,
        fibonacciout => fibonacciout
    );  
    
    clock_divider: process        -- create system clock divder
    begin
        clock <= '0';
        wait for 2ns;
        clock <= '1';
        wait for 2ns;
    end process;
    
    test_bench: process
    begin
        pcreset <= '1';
        wait for 1 ns;
        pcreset <= '0';
        switchin <= "0111"; --- change input
        wait;
        
    end process;

end Behavioral;
