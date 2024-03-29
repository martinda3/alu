LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY TOP_LEVEL IS
    PORT (
	--CLK      :  IN STD_LOGIC;
	REGWR    :  IN STD_LOGIC;
	ALUCTR   :  IN STD_LOGIC_VECTOR(2  DOWNTO 0);
	RS       :  IN STD_LOGIC_VECTOR(4  DOWNTO 0);
	RT       :  IN STD_LOGIC_VECTOR(4  DOWNTO 0);
	RD       :  IN STD_LOGIC_VECTOR(4  DOWNTO 0);
	RESULT   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
	ZERO     : OUT STD_LOGIC;
	CARRYOUT : OUT STD_LOGIC;
	OVERFLOW : OUT STD_LOGIC);
END TOP_LEVEL;

ARCHITECTURE SIMPLE OF TOP_LEVEL IS

  CONSTANT HOLD : TIME := 3 NS;
  
  SIGNAL DATAA : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL DATAB : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL BUFF  : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
  SIGNAL B_ZERO : STD_LOGIC;
  SIGNAL B_OVER : STD_LOGIC;
  SIGNAL B_CARRY : STD_LOGIC;
  
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
	     ZERO   => B_ZERO,
	     CARRY  => B_CARRY,
	     OVER   => B_OVER);
 --
	RESULT <= BUFF WHEN BUFF'STABLE(HOLD)ELSE 
	          "00000000000000000000000000000000" WHEN BUFF = "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU";
	ZERO     <= B_ZERO WHEN BUFF'STABLE(HOLD);
	CARRYOUT <= B_CARRY WHEN BUFF'STABLE(HOLD);
	OVERFLOW <= B_OVER WHEN BUFF'STABLE(HOLD);
	
END SIMPLE;