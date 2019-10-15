LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY TOP_LEVEL IS
    PORT (
	CLK      :  IN STD_LOGIC;
	REGWR    :  IN STD_LOGIC;
	ALUCTR   :  IN STD_LOGIC_VECTOR(2  DOWNTO 0);
	RS       :  IN STD_LOGIC_VECTOR(4  DOWNTO 0);
	RT       :  IN STD_LOGIC_VECTOR(4  DOWNTO 0);
	RD       :  IN STD_LOGIC_VECTOR(4  DOWNTO 0);
	RESULT   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	ZERO     : OUT STD_LOGIC;
	CARRYOUT : OUT STD_LOGIC;
	OVERFLOW : OUT STD_LOGIC);
END TOP_LEVEL;

ARCHITECTURE SIMPLE OF TOP_LEVEL IS

  CONSTANT HOLD : TIME := 4 NS;
  
  SIGNAL DATAA : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL DATAB : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL BUFF  : STD_LOGIC_VECTOR(31 DOWNTO 0);
  
  BEGIN
  
  REG : 
    ENTITY WORK.REGISTER_FILE(BEHAVIOR)
    PORT MAP(
       REGWRITE  => REGWR,
       REGS      => RS,
       REGT      => RT,
       REGD      => RD,
       WRITEDATA => BUFF,
       READDATA1 => DATAA,
       READDATA2 => DATAB);
 --
  ALU : 
    ENTITY WORK.ALU(STRUCTURAL)
    PORT MAP(
         ALUOP  => ALUCTR,
	     DATA1  => DATAA,
	     DATA2  => DATAB,
	     RESULT => BUFF,
	     ZERO   => ZERO,
	     CARRY  => CARRYOUT,
	     OVER   => OVERFLOW);
 --
	RESULT <= BUFF WHEN BUFF'STABLE(HOLD);
END SIMPLE;