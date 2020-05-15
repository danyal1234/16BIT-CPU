----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2020 03:04:36 PM
-- Design Name: 
-- Module Name: ALU1BIT - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU1BIT is
    port ( IN1, IN2 : in std_logic;
           ALU_OUT : out std_logic;
           SEL : in std_logic_vector (2 downto 0);
           Cin : in std_logic;
           Zero, Cout : out std_logic);
end ALU1BIT;

architecture Behavioral of ALU1BIT is

		signal unsignedAdd : std_logic_vector(1 downto 0);
		
begin
process(SEL, IN1, IN2, Cin, unsignedAdd)
		begin
		Cout <= '0';
        Zero <= '0';
		-- Case SEL emulates a mux
		case (SEL) is
			when "000" =>
				ALU_OUT <= IN1 AND IN2;
			when "001" =>
				ALU_OUT <= IN1 OR IN2;
			when "010" =>
			 -- FULL ADDER LOGIC
                ALU_OUT <= IN1 XOR IN2 XOR Cin;
                Cout <= ((IN1 XOR IN2) AND Cin) OR (IN1 AND IN2);
			when "011" =>
				ALU_OUT <= IN1 XOR IN2;
			when "100" =>
                 -- FULL ADDER LOGIC
                 ALU_OUT <= IN1 XOR IN2 XOR Cin;
                 Cout <= ((IN1 XOR IN2) AND Cin) OR (IN1 AND IN2);
			when "101" =>
                  -- FULL ADDER LOGIC SUBTRACTION
                  ALU_OUT <= IN1 XOR (NOT IN2) XOR Cin;
                  Cout <= ((IN1 XOR (NOT IN2)) AND Cin) OR (IN1 AND (NOT IN2));
			when "110" =>
			when "111" =>
			      Zero <= IN1 XNOR IN2;
			when others =>
			    ALU_OUT <= '0';
		end case;
		
	end process;
end Behavioral;
