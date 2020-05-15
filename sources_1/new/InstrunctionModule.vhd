----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2020 01:20:14 PM
-- Design Name: 
-- Module Name: InstrunctionModule - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstrunctionModule is
    port ( ADDR : in std_logic_vector (15 downto 0);
           INSTRUNCTION: out std_logic_vector (15 downto 0));
end InstrunctionModule; 

architecture Behavioral of InstrunctionModule is
    type instruction is array (0 to 32) of std_logic_vector(15 downto 0); 
    
    signal instructions: instruction :=  ("0000010000010000",-- 0 add t2, one, zero
                                          "0000001000010000",-- 1 add t0, one, zero
                                          "0000001100010001",-- 2 add t1, one, one
                                          "0000011100010000",-- 3 add so, one, zero
                                          "0110010100000000", --4 lw, t3, input
                                          "1001100101010000", --5 beq zero, t3, exit
                                          "0000011101110001",-- 6 add s0, s0, one
                                          "1001011101010001", --7 beq one, t3, exit
                                          "1001011001010100", --8 loop: beq t3, t2 exit
                                          "0000011000100010", --9 add t4 ,t1, t1
                                          "0000011100110110", --10 add s0, t2, t4
                                          "0000001000110000", --11 add t1, t0, zero
                                          "0000001101110000", --12 add so, t1, zero
                                          "0000010001000001", --13 add t2, t2, one
                                          "1010000000001000", --14 jump: loop
                                          "0111000000010111", -- 15 exit: sw so, one
                                          others => "1010000000010000"); -- jump exit
    
begin
    process(ADDR)
		begin
		  INSTRUNCTION <= instructions(conv_integer(ADDR));
	end process;

end Behavioral;
