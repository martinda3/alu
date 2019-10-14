LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY top_level IS
    PORT (
	CLK      :  IN STD_LOGIC;
	RegWr    :  IN STD_LOGIC;
	ALUctr   :  IN STD_LOGIC_VECTOR(2  DOWNTO 0);
	Rs       :  IN STD_LOGIC_VECTOR(4  DOWNTO 0);
	Rt       :  IN STD_LOGIC_VECTOR(4  DOWNTO 0);
	Rd       :  IN STD_LOGIC_VECTOR(4  DOWNTO 0);
	Result   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	Zero     : OUT STD_LOGIC;
	Carryout : OUT STD_LOGIC;
	Overflow : OUT STD_LOGIC);
END top_level;

ARCHITECTURE simple OF top_level IS
  
  signal DataA : std_logic_vector(31 downto 0);
  signal DataB : std_logic_vector(31 downto 0);
  signal Write : std_logic_vector(31 downto 0);
  begin
  reg : ENTITY work.Register_File(behavior)
  PORT map(
       RegRead   => CLK,
       RegWrite  => RegWr,
       RegS      => Rs,
       RegT      => Rt,
       RegD      => Rd,
       WriteData => Write,
       ReadData1 => DataA,
       ReadData2 => DataB);
  
  

  
  
end simple;