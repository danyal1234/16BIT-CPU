----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2020 11:21:40 AM
-- Design Name: 
-- Module Name: logicmapper - Behavioral
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

entity logicmapper is
port ( INPUT : in std_logic_vector (3 downto 0);
       OUTPUT : out std_logic_vector (7 downto 0));
end logicmapper;

architecture Behavioral of logicmapper is

begin
    process(INPUT)
        begin
        OUTPUT <= INPUT & "0000";
            
    end process;

end Behavioral;
