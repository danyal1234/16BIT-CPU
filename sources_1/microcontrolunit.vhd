----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2020 04:12:48 PM
-- Design Name: 
-- Module Name: microcontrolunit - Behavioral
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

entity microcontrolunit is
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
end microcontrolunit;


architecture Behavioral of microcontrolunit is

    component microstore is
        port ( INPUT : in std_logic_vector (7 downto 0);
               pcwrite: out std_logic;
               PCWRITECOND: out std_logic;
               MemWrite: out std_logic;
               IrWrite: out std_logic;
               MemToReg: out std_logic;
               PCSrc: out std_logic_vector (1 downto 0);
               ALUSel: out std_logic_vector (2 downto 0);
               ALUSrcA: out std_logic;
               ALUSrcB: out std_logic_vector (1 downto 0);
               RegWrite: out std_logic;
               ALUEN: out std_logic;
               AregEN: out std_logic;
               BregEN: out std_logic;
               Cin: out std_logic;
               MDRen: out std_logic;
               OUTPUTMUX : out std_logic_vector (1 downto 0);
               OUTPUTEN: out std_logic);
    end component;
    
    component mux is
        port ( IN1 : in std_logic_vector (7 downto 0);
               IN2 : in std_logic_vector (7 downto 0);
               IN3 : in std_logic_vector (7 downto 0);
               OUTPUT : out std_logic_vector (7 downto 0);
               SEL : in std_logic_vector (1 downto 0));
   end component;
   
   component upc is
       port ( INPUT : in std_logic_vector (7 downto 0);
              OUTPUT : out std_logic_vector (7 downto 0);
              CLK, RESET: in std_logic);
  end component;
  
  component logicmapper is 
        port ( INPUT : in std_logic_vector (3 downto 0);
               OUTPUT : out std_logic_vector (7 downto 0));
   end component;   
   
   component instrunctionregister is 
         port ( INPUT : in std_logic_vector (3 downto 0);
                CLK : in std_logic;
                EN : in std_logic;
                OUTPUT : out std_logic_vector (3 downto 0));
    end component; 
    
    component incrementer is 
         port ( INPUT : in std_logic_vector (7 downto 0);
                OUTPUT : out std_logic_vector (7 downto 0));
    end component; 
    
    signal irout: std_logic_vector (3 downto 0);
    signal mapperout: std_logic_vector (7 downto 0);
    signal muxout: std_logic_vector (7 downto 0);
    signal upcout: std_logic_vector (7 downto 0);
    signal incrementout: std_logic_vector (7 downto 0);
    signal enablemicroout: std_logic;
    signal selectmicroout: std_logic_vector (1 downto 0);
    
    
begin
    iregister: instrunctionregister port map (switchin, clock, enablemicroout, irout);
    decoder: logicmapper port map (irout, mapperout); 
    multiplexer: mux port map (incrementout, "00000000", mapperout, muxout, selectmicroout); 
    pc: upc port map (muxout, upcout, clock, reset);
    increm: incrementer port map (upcout, incrementout);
    microcodestore: microstore port map (upcout, pcwrite, pcwritecond, memwrite, irwrite, memtoreg,
                                         pcsrc, alusel, alusrcA, alusrcB, regwrite, aluen, Aregen,
                                         Bregen, Cin, mdren, selectmicroout, enablemicroout);
   
end Behavioral;
