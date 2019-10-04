library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Register_File is
  PORT(RegRead  : IN  std_logic := '0';
       RegWrite : IN  std_logic := '0';
       RegS     : IN  STD_LOGIC_VECTOR(2  DOWNTO 0) := "000";
       RegT     : IN  STD_LOGIC_VECTOR(2  DOWNTO 0) := "000";
       RegD     : IN  STD_LOGIC_VECTOR(2  DOWNTO 0) := "000";
       WriteData: IN  STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
       ReadData1: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
       ReadData2: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000"
       );
END Register_File;

ARCHITECTURE behavior OF Register_File IS

	signal R0 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
	signal R1 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00010001000100010001000100010001";
	signal R2 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00100010001000100010001000100010";
	signal R3 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00110011001100110011001100110011";
	signal R4 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "01000100010001000100010001000100";
	signal R5 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "01010101010101010101010101010101";
	signal R6 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "01100110011001100110011001100110";
	signal R7 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "01110111011101110111011101110111";
  
  BEGIN

    PROCESS(RegRead)
      BEGIN
        if (RegRead = '1') Then
          case RegS is
            when "000" => 
              ReadData1 <= R0;
            when "001" => 
              ReadData1 <= R1;
            when "010" => 
              ReadData1 <= R2;
            when "011" => 
              ReadData1 <= R3;
            when "100" => 
              ReadData1 <= R4;
            when "101" => 
              ReadData1 <= R5;
            when "110" => 
              ReadData1 <= R6;
            when "111" => 
              ReadData1 <= R7;
            when others =>
            end case;
      else
        
      end if; 
    END PROCESS;
    
   PROCESS(RegRead)
      BEGIN
        if (RegRead = '1') Then
          case RegT is
            when "000" => 
              ReadData2 <= R0;
            when "001" => 
              ReadData2 <= R1;
            when "010" => 
              ReadData2 <= R2;
            when "011" => 
              ReadData2 <= R3;
            when "100" => 
              ReadData2 <= R4;
            when "101" => 
              ReadData2 <= R5;
            when "110" => 
              ReadData2 <= R6;
            when "111" => 
              ReadData2 <= R7;
            when others =>
            end case;
      else
        
      end if; 
    END PROCESS; 
	 
	 PROCESS(RegWrite)
      BEGIN
        if (RegWrite = '1') Then
          case RegD is
            when "000" => 
              R0 <= WriteData;
            when "001" => 
              R1 <= WriteData;
            when "010" => 
              R2 <= WriteData;
            when "011" => 
              R3 <= WriteData;
            when "100" => 
              R4 <= WriteData;
            when "101" => 
              R5 <= WriteData;
            when "110" => 
              R6 <= WriteData;
            when "111" => 
              R7 <= WriteData;
            when others =>
            end case;
      else
        
      end if; 
    END PROCESS; 
	 
END behavior;


