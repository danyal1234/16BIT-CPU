----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2020 02:50:53 PM
-- Design Name: 
-- Module Name: mux2to1 - Behavioral
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

entity mux2to1 is
port ( IN1 : in std_logic_vector (15 downto 0);
       IN2 : in std_logic_vector (15 downto 0);
       OUTPUT : out std_logic_vector (15 downto 0);
       SEL : in std_logic);
end mux2to1;

architecture Behavioral of mux2to1 is

begin
	process(SEL, IN1, IN2)
		begin
		case (SEL) is
			when '0' =>
				OUTPUT <= IN1;
			when '1' =>
				OUTPUT <= IN2;
			when others =>
			 OUTPUT <= "0000000000000000";
		end case;
		
	end process;


end Behavioral;
