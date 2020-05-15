----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2020 01:44:21 PM
-- Design Name: 
-- Module Name: genericregister - Behavioral
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

entity genericregister is
port ( INPUT : in std_logic_vector (15 downto 0);
       OUTPUT : out std_logic_vector (15 downto 0);
       EN: in std_logic;
       CLK: in std_logic);
end genericregister;

architecture Behavioral of genericregister is

begin
    process(EN, INPUT, CLK)
        begin
        
        if rising_edge(CLK) then
            if (EN = '1') then
                OUTPUT <= INPUT;
            end if;
        end if;
    end process;    

end Behavioral;
