----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2020 10:59:07 AM
-- Design Name: 
-- Module Name: instrunctionregister - Behavioral
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

entity instrunctionregister is
port ( INPUT : in std_logic_vector (3 downto 0);
       CLK, EN : in std_logic;
       OUTPUT : out std_logic_vector (3 downto 0));
end instrunctionregister;

architecture Behavioral of instrunctionregister is
    

begin
	process(INPUT, CLK, EN)
		begin
		  
          if EN = '1' then
              OUTPUT <= INPUT;
          else
              OUTPUT <= "0000";
          end if;
end process;



end Behavioral;
