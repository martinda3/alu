LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ALU IS
    PORT (
	--CLK    :  IN STD_LOGIC := '0';
	ALUOP  :  IN STD_LOGIC_VECTOR(2 DOWNTO 0) := "001";
	DATA1  :  IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000011";
	DATA2  :  IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000001";
	RESULT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
	ZERO   : OUT STD_LOGIC := '0';
	CARRY  : OUT STD_LOGIC := '0';
	OVER   : OUT STD_LOGIC := '0');
END ALU;

ARCHITECTURE STRUCTURAL OF ALU IS
    --SIGNAL CARRYOUT : STD_LOGIC_VECTOR(32 DOWNTO 0);
    SIGNAL BUFFADD : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL BUFFSUB : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL D2_1COMP : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL CLK : STD_LOGIC := '0'; 
    SIGNAL CARRYA : STD_LOGIC := '0'; 
    SIGNAL CARRYS : STD_LOGIC := '0'; 
    
BEGIN
  D2_1COMP <= NOT DATA2;
  
  ADDER : ENTITY WORK.GEN_ADD_SUB(Behavioral)
          Port MAP( 
            DATA1_IN => DATA1,
            DATA2_IN => DATA2,
            RESULT   => BUFFADD,
            C        => CARRYA,
            OP       => '0',
            Z        => ZERO,
            V        => OVER);
            
  SUBBER : ENTITY WORK.GEN_ADD_SUB(Behavioral)
          Port MAP( 
            DATA1_IN => DATA1,
            DATA2_IN => D2_1COMP,
            RESULT   => BUFFSUB,
            C        => CARRYS,
            OP       => '1',
            Z        => ZERO,
            V        => OVER);
            
    CLOCK: PROCESS
        BEGIN
            WHILE 1 = 1 LOOP
                CLK <= NOT CLK; 
	        WAIT FOR 5 NS;
            END LOOP;
        END PROCESS CLOCK;
        
PROCESS(CLK, ALUOP)
  BEGIN
    
	IF (CLK = '1') THEN
      CASE ALUOP is 
        WHEN "000" => -- ADD
           RESULT <= BUFFADD;
           CARRY <= CARRYA;
        WHEN "001" => -- ADD
           RESULT <= BUFFSUB;
           CARRY <= CARRYS;
        WHEN OTHERS => -- SHOULD NOT HAPPEN
      END CASE;
    END IF;
    END PROCESS;
    
END STRUCTURAL;