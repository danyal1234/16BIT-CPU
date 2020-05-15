----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2020 05:20:58 PM
-- Design Name: 
-- Module Name: mcutb - Behavioral
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

entity mcutb is
--  Port ( );
end mcutb;

architecture Behavioral of mcutb is

    component microcontrolunit is
        Port ( clock : in STD_LOGIC;
               reset : in STD_LOGIC;
               switchin : in std_logic_vector (3 downto 0);
               pcwrite: out std_logic;
               pcwritecond: out std_logic;
               memwrite: out std_logic;
               irwrite: out std_logic;
               memtoreg: out std_logic;
               pcsrc: out std_logic_vector (1 downto 0);
               alusel: out std_logic_vector (2 downto 0);
               alusrcA: out std_logic;
               alusrcB: out std_logic_vector (1 downto 0);
               regwrite: out std_logic;
               aluen: out std_logic;
               Aregen: out std_logic;
               Bregen: out std_logic;
               cin: out std_logic;
               mdren: out std_logic);
    end component;
    
    signal clock, reset, pcwrite, pcwritecond, memwrite, irwrite, memtoreg: std_logic;
    signal alusrcA, regwrite, aluen, Aregen, Bregen, cin, mdren: std_logic;
    signal switchin: std_logic_vector (3 downto 0);
    signal pcsrc: std_logic_vector (1 downto 0);
    signal alusel: std_logic_vector (2 downto 0);
    signal alusrcB: std_logic_vector (1 downto 0);
    
begin
    
    uut: microcontrolunit port map (
        clock => clock,
        reset => reset,
        switchin => switchin,
        pcwrite => pcwrite,
        pcwritecond => pcwritecond,
        memwrite => memwrite,
        irwrite => irwrite,
        memtoreg => memtoreg,
        pcsrc => pcsrc,
        alusel => alusel,
        alusrcA => alusrcA,
        alusrcB => alusrcB,
        regwrite => regwrite,
        aluen => aluen,
        Aregen => Aregen,
        Bregen => Bregen,
        cin => cin,
        mdren => mdren
    );
    
    btnclock_process: process
    begin
        clock <= '1';
        wait for 5ns;
        clock<= '0';
        wait for 5ns;
    end process;

    test_bench: process
    begin
        reset <= '0';
        switchin <= "0000";
        wait for 40ns;
        reset <= '0';
        switchin <= "0001";
        wait for 40ns;
        reset <= '0';
        switchin <= "0010";
        wait for 40ns;
        reset <= '0';
        switchin <= "0011";
        wait for 40ns;
        reset <= '0';
        switchin <= "0100";
        wait for 40ns;
        reset <= '0';
        switchin <= "0101";
        wait for 40ns;
        reset <= '0';
        switchin <= "0110";
        wait for 40ns;
        reset <= '0';
        switchin <= "0111";
        wait for 40ns;
        reset <= '0';
        switchin <= "1000";
        wait for 40ns;
        reset <= '0';
        switchin <= "1001";
        wait for 40ns;
        reset <= '0';
        switchin <= "1010";
        wait for 40ns;
        
    end process;

end Behavioral;
