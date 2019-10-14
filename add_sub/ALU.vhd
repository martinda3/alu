LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ALU IS
    PORT (
	--CLK    :  IN STD_LOGIC := '0';
	ALUOP  :  IN STD_LOGIC_VECTOR(2 DOWNTO 0) := "111";
	DATA1  :  IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "10000011100000000111000000000011";
	DATA2  :  IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000001100100000001100000000001";
	RESULT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
	ZERO   : OUT STD_LOGIC := '0';
	CARRY  : OUT STD_LOGIC := '0';
	OVER   : OUT STD_LOGIC := '0');
END ALU;

ARCHITECTURE STRUCTURAL OF ALU IS
    SIGNAL BUFFand : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL BUFFrsl : STD_LOGIC_VECTOR(31 DOWNTO 0);
    
    
    SIGNAL BUFFasr : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL BUFFlsl : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL BUFFor : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL BUFFADD : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL BUFFSUB : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL D2_1COMP : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL CLK : STD_LOGIC := '0'; 
    SIGNAL CARRYA : STD_LOGIC := '0'; 
    SIGNAL CARRYS : STD_LOGIC := '0'; 
    
BEGIN
  D2_1COMP <= NOT DATA2;
  
  sleft : ENTITY WORK.GEN_sleft(Behavioral)
          Port MAP( 
            DATA1_IN => DATA1,
            RESULT   => BUFFlsl);
            
  artri : ENTITY WORK.GEN_aright(Behavioral)
          Port MAP( 
            DATA1_IN => DATA1,
            RESULT   => BUFFasr);
                     
  rleft : ENTITY WORK.GEN_rleft(Behavioral)
          Port MAP( 
            DATA1_IN => DATA1,
            RESULT   => BUFFrsl);
  ander : ENTITY WORK.GEN_and(Behavioral)
          Port MAP( 
            DATA1_IN => DATA1,
            DATA2_IN => DATA2,
            RESULT   => BUFFand);
            
  orrer : ENTITY WORK.GEN_or(Behavioral)
          Port MAP( 
            DATA1_IN => DATA1,
            DATA2_IN => DATA2,
            RESULT   => BUFFor);
            
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
        WHEN "001" => -- sub
           RESULT <= BUFFSUB;
           CARRY <= CARRYS;
        WHEN "010" => -- and
           RESULT <= BUFFand;
        WHEN "011" => -- and
           RESULT <= BUFFor;
        WHEN "100" => -- lls
           RESULT <= BUFFlsl;
        WHEN "101" => -- lrs
           RESULT <= BUFFRsl;
        WHEN "110" => -- als
           RESULT <= BUFFlsl;
        WHEN "111" => -- ars
           RESULT <= BUFFasr;
        WHEN OTHERS => -- SHOULD NOT HAPPEN
      END CASE;
    END IF;
    END PROCESS;
    
END STRUCTURAL;