----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2020 04:16:37 PM
-- Design Name: 
-- Module Name: pcregister - Behavioral
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

entity pcregister is
port ( INPUT : in std_logic_vector (15 downto 0);
       OUTPUT : out std_logic_vector (15 downto 0);
       EN: in std_logic;
       RESET: in std_logic;
       CLK: in std_logic);
end pcregister;

architecture Behavioral of pcregister is

begin
    process(EN, RESET, INPUT, CLK)
        begin
        
        if (RESET = '1') then
            OUTPUT <= "0000000000000000";
        end if;
        if rising_edge(CLK) then
            if (EN = '1') then
                OUTPUT <= INPUT;
            end if;
        end if;
    end process;

end Behavioral;
