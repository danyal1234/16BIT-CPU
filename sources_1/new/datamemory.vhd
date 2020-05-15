----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2020 04:11:48 PM
-- Design Name: 
-- Module Name: datamemory - Behavioral
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

entity datamemory is
    port ( WRITEADDR : in std_logic_vector (15 downto 0);
           WriteData: in std_logic_vector (15 downto 0);
           DataOut: out std_logic_vector (15 downto 0);
           DataWrite: in std_logic;
           FibIn: in std_logic_vector (3 downto 0);
           FibOut: out std_logic_vector (15 downto 0));
end datamemory;

architecture Behavioral of datamemory is
    type datamem is array (0 to 32) of std_logic_vector(15 downto 0);
    signal datamemory: datamem :=  (others => "0000000000000000");

begin
    process(WRITEADDR, WriteData, DataWrite, FibIn)
		begin
		
		datamemory(0) <= "000000000000" & FibIn;
		
		if (DataWrite = '1') then
		  if conv_integer(WRITEADDR) < 32 then
		      datamemory(conv_integer(WRITEADDR)) <= WriteData;
          end if;
        end if;
        
        if conv_integer(WRITEADDR) < 32 then
            DataOut <= datamemory(conv_integer(WRITEADDR));
        end if;
		FibOut <= datamemory(1);
		
	end process;

end Behavioral;
