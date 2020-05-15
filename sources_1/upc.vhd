----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2020 11:29:35 AM
-- Design Name: 
-- Module Name: upc - Behavioral
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

entity upc is
port ( INPUT : in std_logic_vector (7 downto 0);
       OUTPUT : out std_logic_vector (7 downto 0);
       CLK, RESET: in std_logic);
end upc;

architecture Behavioral of upc is
    
begin
    process(CLK, RESET)
        begin
        
        if (falling_edge(CLK)) then
            OUTPUT <= INPUT;
        end if;
        
        if RESET = '1' then
            OUTPUT <= "00000000";
        end if;
            
    end process;


end Behavioral;
