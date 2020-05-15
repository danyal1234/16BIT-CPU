----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2020 03:26:26 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    port ( IN1, IN2 : in std_logic_vector (15 downto 0);
           ALU_OUT : out std_logic_vector (15 downto 0);
           SEL : in std_logic_vector (2 downto 0);
           Cin : in std_logic;
           Zero : out std_logic);
end ALU;

architecture Structural of ALU is
    component ALU1BIT is
        port ( IN1, IN2 : in std_logic;
               ALU_OUT : out std_logic;
               SEL : in std_logic_vector (2 downto 0);
               Cin : in std_logic;
               Zero, Cout : out std_logic);
    end component;
    
    signal c: std_logic_vector (15 downto 0);
    signal z: std_logic_vector (15 downto 0);
    signal output: std_logic_vector (15 downto 0);

begin
    A1: ALU1BIT port map (IN1(0), IN2(0), output(0), SEL, Cin, z(0), c(0));
    A2: ALU1BIT port map (IN1(1), IN2(1), output(1), SEL, c(0), z(1), c(1));
    A3: ALU1BIT port map (IN1(2), IN2(2), output(2), SEL, c(1), z(2), c(2));
    A4: ALU1BIT port map (IN1(3), IN2(3), output(3), SEL, c(2), z(3), c(3));
    A5: ALU1BIT port map (IN1(4), IN2(4), output(4), SEL, c(3), z(4), c(4));
    A6: ALU1BIT port map (IN1(5), IN2(5), output(5), SEL, c(4), z(5), c(5));
    A7: ALU1BIT port map (IN1(6), IN2(6), output(6), SEL, c(5), z(6), c(6));
    A8: ALU1BIT port map (IN1(7), IN2(7), output(7), SEL, c(6), z(7), c(7));
    A9: ALU1BIT port map (IN1(8), IN2(8), output(8), SEL, c(7), z(8), c(8));
    A10: ALU1BIT port map (IN1(9), IN2(9), output(9), SEL, c(8), z(9), c(9));
    A11: ALU1BIT port map (IN1(10), IN2(10), output(10), SEL, c(9), z(10), c(10));
    A12: ALU1BIT port map (IN1(11), IN2(11), output(11), SEL, c(10), z(11), c(11));
    A13: ALU1BIT port map (IN1(12), IN2(12), output(12), SEL, c(11), z(12), c(12));
    A14: ALU1BIT port map (IN1(13), IN2(13), output(13), SEL, c(12), z(13), c(13));
    A15: ALU1BIT port map (IN1(14), IN2(14), output(14), SEL, c(13), z(14), c(14));
    A16: ALU1BIT port map (IN1(15), IN2(15), output(15), SEL, c(14), z(15), c(15));

    ALU_OUT <= output;
    process(z, SEL)
        begin
        case (SEL) is
            when "111" =>
               Zero <= z(0) AND z(1) AND z(2) AND z(3)AND z(4)AND z(5)AND z(6)AND z(7)
                       AND z(8) AND z(9) AND z(10)AND z(11)AND z(12)AND z(13) AND z(14) AND z(15);
            when others =>
                Zero <= '0';
        end case;
        
    end process;
    
--    Zero <=  z(0) AND z(1) AND z(
end Structural;
