----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2020 11:57:26 AM
-- Design Name: 
-- Module Name: microstore - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity microstore is
port ( INPUT : in std_logic_vector (7 downto 0);
       PCWrite: out std_logic;
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
end microstore;

architecture Behavioral of microstore is
    type opcodes is array (0 to 162) of std_logic_vector(21 downto 0); 
    
    signal opcode: opcodes :=  (others => "0000000000000000000101");

begin
    -- add opcode 0000
    opcode(0)  <= "0000010000000000110000"; -- decode
    opcode(1)  <= "0000010010010101000000"; -- execute
    opcode(2)  <= "0000010000000010000000"; -- write back
    opcode(3)  <= "0100100110000000000101"; -- fetch next
    
    -- sub opcode 0001
    opcode(16)  <= "0000010000000000110000"; -- decode
    opcode(17)  <= "0000010010110101000000"; -- execute
    opcode(18)  <= "0000010000000010000000"; -- write back
    opcode(19)  <= "0100100110000000000101"; -- fetch next
    
    -- and opcode 0010
    opcode(32)  <= "0000010000000000110000"; -- decode
    opcode(33)  <= "0000010000010101000000"; -- execute
    opcode(34)  <= "0000010000000010000000"; -- write back
    opcode(35)  <= "0100100110000000000101"; -- fetch next
    
    -- or opcode 0011
    opcode(48)  <= "0000010000000000110000"; -- decode
    opcode(49)  <= "0000010000110101000000"; -- execute
    opcode(50)  <= "0000010000000010000000"; -- write back
    opcode(51)  <= "0100100110000000000101"; -- fetch next
    
    -- xor opcode 0100
    opcode(64)  <= "0000010000000000110000"; -- decode
    opcode(65)  <= "0000010001110101000000"; -- execute
    opcode(66)  <= "0000010000000010000000"; -- write back
    opcode(67)  <= "0100100110000000000101"; -- fetch next
    
    -- slt opcode 0101
    opcode(80)  <= "0000010000000000110000"; -- decode
    opcode(81)  <= "0000010011010101000000"; -- execute
    opcode(82)  <= "0000010000000010000000"; -- write back
    opcode(83)  <= "0100100110000000000101"; -- fetch next
                    
    -- lw opcode 0110
    opcode(96)  <= "0000000000000000110000"; -- decode
    opcode(97)  <= "1000000010010101000000"; -- execute
    opcode(98)  <= "0000000000000010000000"; -- write back
    opcode(99)  <= "0100100110000000000101"; -- fetch next
        
    -- sw opcode 0111
    opcode(112)  <= "0000000000000000110000"; -- decode
    opcode(113)  <= "0001000010011001000000"; -- execute
    opcode(114)  <= "0100100110000000000101"; -- fetch next
   
    -- addi opcode 1000
    opcode(128)  <= "0000010000000000110000"; -- decode
    opcode(129)  <= "0000010011011001000000"; -- execute
    opcode(130)  <= "0000010000000010000000"; -- write back
    opcode(131)  <= "0100100110000000000101"; -- fetch next
    
    -- beq opcode 1001
    opcode(144)  <= "0000000000000000110000"; -- decode
    opcode(145)  <= "0000000010001001000000"; -- execute
    opcode(146)  <= "0010001011110100000000"; -- write back
    opcode(147)  <= "0100100110000000000101"; -- fetch next
    
    -- jump opcode 1010
    opcode(160)  <= "0000000000000000000000"; -- decode
    opcode(161)  <= "0100100000000000000101"; -- jump

	process(INPUT)
    begin
    
    MDRen <= opcode(conv_integer(INPUT))(21);
    PCWrite <= opcode(conv_integer(INPUT))(20);
    PCWRITECOND <= opcode(conv_integer(INPUT))(19);
    MemWrite <= opcode(conv_integer(INPUT))(18);
    IrWrite <= opcode(conv_integer(INPUT))(17);
    MemToReg <= opcode(conv_integer(INPUT))(16);
    PCSrc <= opcode(conv_integer(INPUT))(15 downto 14);
    ALUSel <= opcode(conv_integer(INPUT))(13 downto 11);
    ALUSrcA <= opcode(conv_integer(INPUT))(10);
    ALUSrcB <= opcode(conv_integer(INPUT))(9 downto 8);
    RegWrite <= opcode(conv_integer(INPUT))(7);
    ALUEN <= opcode(conv_integer(INPUT))(6);
    AregEN <= opcode(conv_integer(INPUT))(5);
    BregEN <= opcode(conv_integer(INPUT))(4);
    Cin <= opcode(conv_integer(INPUT))(3);
    OUTPUTMUX <= opcode(conv_integer(INPUT))(2 downto 1);
    OUTPUTEN <= opcode(conv_integer(INPUT))(0);
   
    end process;

end Behavioral;
