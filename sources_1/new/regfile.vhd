----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2020 01:46:11 PM
-- Design Name: 
-- Module Name: regfile - Behavioral
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
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity regfile is
    generic (
            Dwidth : integer := 16); -- Address Width (i.e. 2^4 = 16 registers)
    port (
            ReadA1, ReadA2, WriteA : in std_logic_vector(3 downto 0);
            DataO1, DataO2 : out std_logic_vector(Dwidth-1 downto 0);
            DataIn : in std_logic_vector(Dwidth-1 downto 0);
            WE : in std_logic);
end regfile;

architecture Behavioral of regfile is
    type memory is array (0 to 15) of std_logic_vector(Dwidth-1 downto 0); 
    signal memoryArray: memory :=  ("0000000000000000", --zero 0
                                    "0000000000000001", --one 1
                                    others => "0000000000000000");
    
    attribute ram_style: string;
    attribute ram_style of memoryArray : signal is "distrubuted";

begin
   
    process (WE, ReadA1, ReadA2)
    begin
        DataO1 <= memoryArray(conv_integer(ReadA1));
        DataO2 <= memoryArray(conv_integer(ReadA2));
        if (WE = '1') then
            memoryArray(conv_integer(WriteA)) <= DataIn;
        end if;
    end process;

end Behavioral;
