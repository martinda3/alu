library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.numeric_std.ALL;

ENTITY Register_File is
  PORT(
       RegWrite : IN  std_logic := '0';
       RegS     : IN  STD_LOGIC_VECTOR(4  DOWNTO 0) := "00000";
       RegT     : IN  STD_LOGIC_VECTOR(4  DOWNTO 0) := "00000";
       RegD     : IN  STD_LOGIC_VECTOR(4  DOWNTO 0) := "00000";
       WriteData: IN  STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
       ReadData1: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
       ReadData2: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000"
       );
END Register_File;

ARCHITECTURE behavior OF Register_File IS

	signal R0 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R1 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000001";
	signal R2 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000010";
	signal R3 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000011";
	signal R4 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R5 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R6 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R7 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R8 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R9 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	
	signal R10 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R11 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R12 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R13 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R14 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R15 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R16 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R17 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R18 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R19 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	
	signal R20 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R21 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R22 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R23 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R24 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R25 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R26 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R27 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R28 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R29 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	
	signal R30 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R31 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal CLK : STD_LOGIC := '0';
	
  
  BEGIN
    CLOCK: PROCESS
        BEGIN
            WHILE 1 = 1 LOOP
                CLK <= NOT CLK; 
	        WAIT FOR 1 NS;
            END LOOP;
        END PROCESS CLOCK;

    PROCESS(CLK)
      BEGIN
        if (CLK = '1') Then
          case to_integer(unsigned(RegS)) is
            when 0 => 
              ReadData1 <= R0;
            when 1 => 
              ReadData1 <= R1;
            when 2 => 
              ReadData1 <= R2;
            when 3 => 
              ReadData1 <= R3;
            when 4 => 
              ReadData1 <= R4;
            when 5 => 
              ReadData1 <= R5;
            when 6 => 
              ReadData1 <= R6;
            when 7 => 
              ReadData1 <= R7;
			      when 8 => 
              ReadData1 <= R8;
            when 9 => 
              ReadData1 <= R9;
            when 10 => 
              ReadData1 <= R10;
            when 11 => 
              ReadData1 <= R11;
            when 12 => 
              ReadData1 <= R12;
            when 13 => 
              ReadData1 <= R13;
            when 14 => 
              ReadData1 <= R14;
            when 15 => 
              ReadData1 <= R15;
            when 16 => 
              ReadData1 <= R16;
            when 17 => 
              ReadData1 <= R17;
			      when 18 => 
              ReadData1 <= R18;
            when 19 => 
              ReadData1 <= R19;
			      when 20 => 
              ReadData1 <= R20;
            when 21 => 
              ReadData1 <= R21;
            when 22 => 
              ReadData1 <= R22;
            when 23 => 
              ReadData1 <= R23;
            when 24 => 
              ReadData1 <= R24;
            when 25 => 
              ReadData1 <= R25;
            when 26 => 
              ReadData1 <= R26;
            when 27 => 
              ReadData1 <= R27;
			      when 28 => 
              ReadData1 <= R28;
            when 29 => 
              ReadData1 <= R29;
			      when 30 => 
              ReadData1 <= R30;
            when 31 => 
              ReadData1 <= R31;
            when others =>
            end case;
      else
        
      end if; 
    END PROCESS;
    
   PROCESS(CLK)
      BEGIN
        if (CLK = '1') Then
          case to_integer(unsigned(RegT)) is
            when 0 => 
              ReadData2 <= R0;
            when 1 => 
              ReadData2 <= R1;
            when 2 => 
              ReadData2 <= R2;
            when 3 => 
              ReadData2 <= R3;
            when 4 => 
              ReadData2 <= R4;
            when 5 => 
              ReadData2 <= R5;
            when 6 => 
              ReadData2 <= R6;
            when 7 => 
              ReadData2 <= R7;
			      when 8 => 
              ReadData2 <= R8;
            when 9 => 
              ReadData2 <= R9;
            when 10 => 
              ReadData2 <= R10;
            when 11 => 
              ReadData2 <= R11;
            when 12 => 
              ReadData2 <= R12;
            when 13 => 
              ReadData2 <= R13;
            when 14 => 
              ReadData2 <= R14;
            when 15 => 
              ReadData2 <= R15;
            when 16 => 
              ReadData2 <= R16;
            when 17 => 
              ReadData2 <= R17;
			      when 18 => 
              ReadData2 <= R18;
            when 19 => 
              ReadData2 <= R19;
			      when 20 => 
              ReadData2 <= R20;
            when 21 => 
              ReadData2 <= R21;
            when 22 => 
              ReadData2 <= R22;
            when 23 => 
              ReadData2 <= R23;
            when 24 => 
              ReadData2 <= R24;
            when 25 => 
              ReadData2 <= R25;
            when 26 => 
              ReadData2 <= R26;
            when 27 => 
              ReadData2 <= R27;
			      when 28 => 
              ReadData2 <= R28;
            when 29 => 
              ReadData2 <= R29;
			      when 30 => 
              ReadData2 <= R30;
            when 31 => 
              ReadData2 <= R31;
            when others =>
            end case;
      else
        
      end if; 
    END PROCESS; 
	 
	 PROCESS(CLK)
      BEGIN
        if (RegWrite = '1') AND (CLK = '0') Then
          case to_integer(unsigned(RegD)) is
            when 0 => 
              R0 <= WriteData;
            when 1 => 
              R1 <= WriteData;
            when 2 => 
              R2 <= WriteData;
            when 3 => 
              R3 <= WriteData;
            when 4 => 
              R4 <= WriteData;
            when 5 => 
              R5 <= WriteData;
            when 6 => 
              R6 <= WriteData;
            when 7 => 
              R7 <= WriteData;
			      when 8 => 
              R8 <= WriteData;
            when 9 => 
              R9 <= WriteData;
            when 10 => 
              R10 <= WriteData;
            when 11 => 
              R11 <= WriteData;
            when 12 => 
              R12 <= WriteData;
            when 13 => 
              R13 <= WriteData;
            when 14 => 
              R14 <= WriteData;
            when 15 => 
              R15 <= WriteData;
            when 16 => 
              R16 <= WriteData;
            when 17 => 
              R17 <= WriteData;
			      when 18 => 
              R18 <= WriteData;
            when 19 => 
              R19 <= WriteData;
			      when 20 => 
              R20 <= WriteData;
            when 21 => 
              R21 <= WriteData;
            when 22 => 
              R22 <= WriteData;
            when 23 => 
              R23 <= WriteData;
            when 24 => 
              R24 <= WriteData;
            when 25 => 
              R25 <= WriteData;
            when 26 => 
              R26 <= WriteData;
            when 27 => 
              R27 <= WriteData;
			      when 28 => 
              R28 <= WriteData;
            when 29 => 
              R29 <= WriteData;
			      when 30 => 
              R30 <= WriteData;
            when 31 => 
              R31 <= WriteData;
            when others =>
            end case;
      else
        
      end if; 
    END PROCESS; 
	 
END behavior;


