----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2020 02:57:46 PM
-- Design Name: 
-- Module Name: highleveldesign - Behavioral
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

entity highleveldesign is
    Port ( switchin : in std_logic_vector (3 downto 0);
           pcreset: in std_logic;
           clock: in std_logic;
           fibonacciout : out std_logic_vector (15 downto 0));
end highleveldesign;

architecture Behavioral of highleveldesign is
     
     component InstrunctionModule is
         port ( ADDR : in std_logic_vector (15 downto 0);
                INSTRUNCTION: out std_logic_vector (15 downto 0));
     end component;
     
     component regfile is
         port (
                 ReadA1, ReadA2, WriteA : in std_logic_vector(3 downto 0);
                 DataO1, DataO2 : out std_logic_vector(15 downto 0);
                 DataIn : in std_logic_vector(15 downto 0);
                 WE : in std_logic);
     end component; 
     
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

    component ALU is
         port ( IN1, IN2 : in std_logic_vector (15 downto 0);
              ALU_OUT : out std_logic_vector (15 downto 0);
              SEL : in std_logic_vector (2 downto 0);
              Cin : in std_logic;
              Zero : out std_logic); 
    end component;
    
    component pcregister is
    port ( INPUT : in std_logic_vector (15 downto 0);
           OUTPUT : out std_logic_vector (15 downto 0);
           EN: in std_logic;
           RESET: in std_logic;
           CLK: in std_logic);
    end component;
    
    component genericregister is
        port ( INPUT : in std_logic_vector (15 downto 0);
               OUTPUT : out std_logic_vector (15 downto 0);
               EN: in std_logic;
               CLK: in std_logic);
    end component;
    
    component datamemory is
        port ( WRITEADDR : in std_logic_vector (15 downto 0);
               WriteData: in std_logic_vector (15 downto 0);
               DataOut: out std_logic_vector (15 downto 0);
               DataWrite: in std_logic;
               FibIn: in std_logic_vector (3 downto 0);
               FibOut: out std_logic_vector (15 downto 0));
    end component;
    
    component mux2to1 is
        port ( IN1 : in std_logic_vector (15 downto 0);
               IN2 : in std_logic_vector (15 downto 0);
               OUTPUT : out std_logic_vector (15 downto 0);
               SEL : in std_logic);
    end component;
    
    component mux3to1 is
        port ( IN1 : in std_logic_vector (15 downto 0);
               IN2 : in std_logic_vector (15 downto 0);
               IN3 : in std_logic_vector (15 downto 0);
               OUTPUT : out std_logic_vector (15 downto 0);
               SEL : in std_logic_vector (1 downto 0));
    end component;
    
    signal reset: std_logic;
    signal pcin: std_logic_vector (15 downto 0);
    signal pcout: std_logic_vector (15 downto 0);
    signal pcen: std_logic:= '1';
    signal instrout: std_logic_vector (15 downto 0);
    signal irregout: std_logic_vector (15 downto 0);
    signal irwrite: std_logic;
    signal memtoreg: std_logic;
    signal dataout: std_logic_vector (15 downto 0);
    signal mdrout: std_logic_vector (15 downto 0);
    signal regout1, regout2: std_logic_vector (15 downto 0);
    signal aluout, writedata: std_logic_vector (15 downto 0);
    signal aregout, bregout: std_logic_vector (15 downto 0);
    signal mdren: std_logic;
    signal rfwre: std_logic;
    signal aregen, bregen: std_logic;
    signal alusrca, alusrcb: std_logic_vector (15 downto 0);
    signal alusrcasel: std_logic;
    signal alusrcbsel: std_logic_vector (1 downto 0);
    signal signextend: std_logic_vector (15 downto 0);
    signal aluregisterout, aluoutput: std_logic_vector (15 downto 0);
    signal alusel: std_logic_vector (2 downto 0);
    signal carryin: std_logic;
    signal aluregen: std_logic;
    signal jumpaddress: std_logic_vector (15 downto 0);
    signal sourceselect: std_logic_vector (1 downto 0);
    signal datamemwre: std_logic;
    signal zeroflag: std_logic;
    signal pcwrite, pcwritecondition: std_logic;
    
begin
    reset <= '0';
    
    -- make the entire cpu
    
    pcen <= (zeroflag and pcwritecondition) or pcwrite;
    
    pc: pcregister port map (pcin, pcout, pcen, pcreset, clock);
    imodule: InstrunctionModule port map (pcout, instrout);
    irregister: genericregister port map (instrout, irregout, irwrite, clock);
    --mdrreg: genericregister port map (dataout, mdrout, mdren, clock);
    memtowritedata: mux2to1 port map (dataout, aluregisterout, writedata, memtoreg);
    registerfile: regfile port map (instrout(7 downto 4), instrout(3 downto 0), instrout(11 downto 8), 
                                    regout1, regout2, writedata, rfwre);
    areg: genericregister port map (regout1, aregout, aregen, clock); 
    breg: genericregister port map (regout2, bregout, bregen, clock); 
    alusrc1: mux2to1 port map (pcout, aregout, alusrca, alusrcasel);
    signextend <= "000000000000" & instrout(11 downto 8);
    alusrc2: mux3to1 port map ("0000000000000001", bregout, signextend, alusrcb, alusrcbsel);
    alucomp: ALU port map (alusrca, alusrcb, aluoutput, alusel, carryin, zeroflag);
    aluregister: genericregister port map (aluoutput, aluregisterout, aluregen, clock);
    jumpaddress <= pcout(15 downto 12) & instrout(11 downto 0);
    pcsrcselect: mux3to1 port map (jumpaddress, aluoutput, aluregisterout, pcin, sourceselect);
    datamem: datamemory port map (aluregisterout, bregout, dataout, datamemwre, switchin, fibonacciout);
    mcu: microcontrolunit port map (clock, reset, instrout(15 downto 12), pcwrite, pcwritecondition, datamemwre,
                                    irwrite, memtoreg, sourceselect, alusel, alusrcasel, alusrcbsel, rfwre,
                                    aluregen, aregen, Bregen, carryin, mdren);
         
end Behavioral;
