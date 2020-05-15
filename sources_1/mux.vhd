----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2020 10:57:29 AM
-- Design Name: 
-- Module Name: mux - Behavioral
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

entity mux is
port ( IN1 : in std_logic_vector (7 downto 0);
       IN2 : in std_logic_vector (7 downto 0);
       IN3 : in std_logic_vector (7 downto 0);
       OUTPUT : out std_logic_vector (7 downto 0);
       SEL : in std_logic_vector (1 downto 0));
end mux;

architecture Behavioral of mux is

	
begin
	process(SEL, IN1, IN2, IN3)
		begin
		case (SEL) is
			when "00" =>
				OUTPUT <= IN1;
			when "01" =>
				OUTPUT <= IN2;
			when "10" =>
                OUTPUT <= IN3;
			when others =>
			 OUTPUT <= "00000000";
		end case;
		
	end process;

end Behavioral;
