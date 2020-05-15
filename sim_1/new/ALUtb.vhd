----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2020 06:49:42 PM
-- Design Name: 
-- Module Name: ALUtb - Behavioral
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

entity ALUtb is
--  Port ( );
end ALUtb;

architecture Behavioral of ALUtb is
component ALU is
    port ( IN1, IN2 : in std_logic_vector (15 downto 0);
           ALU_OUT : out std_logic_vector (15 downto 0);
           SEL : in std_logic_vector (2 downto 0);
           Cin : in std_logic;
           Zero : out std_logic);
end component;

signal Cin, Zero: std_logic;
signal IN1, IN2, ALU_OUT:  std_logic_vector(15 downto 0);
signal SEL : std_logic_vector(2 downto 0);

begin

    uut: ALU port map(
        Cin => Cin,
        Zero => Zero,
        IN1 => IN1,
        IN2 => IN2,
        ALU_OUT => ALU_OUT,
        SEL => SEL
    );        
    
    test_bench : process
    begin		
        Cin <= '0';
        -- AND
       SEL <= "000";
       IN1 <= "0000000011110000";
       IN2 <= "0000000011001111";
       wait for 50 ns;
       -- OR
       SEL <= "001";
       IN1 <= "0000000011110000";
       IN2 <= "0000000010101010";
       wait for 50 ns;
       -- unsigned add
       SEL <= "010";
       IN1 <= "0000000000000001";
       IN2 <= "0000000011111111";
       wait for 50 ns;        
       --XOR
       SEL <= "011";
       IN1 <= "0000000010101010";
       IN2 <= "0000000011110000";
       wait for 50 ns;    
       -- signed add
       SEL <= "100";
       IN1 <= "0000000000001111";
       IN2 <= "0000000000000001";
       wait for 50 ns;     
       -- signed subtraction
       Cin <= '1';
       SEL <= "101";
       IN1 <= "0000000011110000";
       IN2 <= "0000000000110000";
       wait for 50 ns;  
       Cin <= '0';   
       --less than
       SEL <= "110";
       IN1 <= "0000000011111110";
       IN2 <= "0000000011111111";
       wait for 50 ns;    
       -- branch if equal
       SEL <= "111";
       IN1 <= "0000000011110000";
       IN2 <= "0000000011110000";
       wait for 50 ns; 
       -- AND
       SEL <= "000";
       IN1 <= "0000000000000001";
       IN2 <= "0000000011001111";
       wait for 50 ns;
       -- OR
       SEL <= "001";
       IN1 <= "0000000000000000";
       IN2 <= "0000000010101010";
       wait for 50 ns;
       -- unsigned add
       SEL <= "010";
       IN1 <= "0000000000000001";
       IN2 <= "0000000000000111";
       wait for 50 ns;        
       -- XOR
       SEL <= "011";
       IN1 <= "0000000000000000";
       IN2 <= "0000000011110000";
       wait for 50 ns;    
       -- signed add
       SEL <= "100";
       IN1 <= "0000000010000001";
       IN2 <= "0000000010000001";
       wait for 50 ns;     
       -- signed subtraction
       Cin <= '1';
       SEL <= "101";
       IN1 <= "0000000010000000";
       IN2 <= "0000000000000001";
       wait for 50 ns;  
       Cin <= '0';     
       -- less than
       SEL <= "110";
       IN1 <= "0000000011111000";
       IN2 <= "0000000011111000";
       wait for 50 ns;    
       -- branch if equal
       SEL <= "111";
       IN1 <= "0000000011110000";
       IN2 <= "0000000000000000";
       wait for 50 ns;     
       -- signed add
       SEL <= "100";
       IN1 <= "0000000011111011";
       IN2 <= "0000000000000001";
       wait for 50 ns;   
      wait;
   end process;

END;
