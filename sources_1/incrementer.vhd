----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2020 11:36:52 AM
-- Design Name: 
-- Module Name: incrementer - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity incrementer is
port ( INPUT : in std_logic_vector (7 downto 0);
       OUTPUT : out std_logic_vector (7 downto 0));
end incrementer;
architecture Behavioral of incrementer is
begin
    process(INPUT)
    begin
        OUTPUT <= INPUT + "00000001";
    end process;

end Behavioral;