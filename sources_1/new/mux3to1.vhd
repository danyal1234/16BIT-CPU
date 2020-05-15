----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2020 03:09:13 PM
-- Design Name: 
-- Module Name: mux3to1 - Behavioral
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

entity mux3to1 is
port ( IN1 : in std_logic_vector (15 downto 0);
       IN2 : in std_logic_vector (15 downto 0);
       IN3 : in std_logic_vector (15 downto 0);
       OUTPUT : out std_logic_vector (15 downto 0);
       SEL : in std_logic_vector (1 downto 0));
end mux3to1;

architecture Behavioral of mux3to1 is

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
			 OUTPUT <= "0000000000000000";
		end case;
		
	end process;


end Behavioral;
