library IEEE;
use IEEE.std_logic_1164.all;

ENTITY ADDER is
  PORT(A     :  IN  std_logic := '0';
       B     :  IN  std_logic := '0';
       CIN   :  IN  std_logic := '0';
       COUT  : OUT  std_logic := '0';
       SUM   : OUT  std_logic := '0';
       );
END ADDER;

ARCHITECTURE behavior OF ADDER IS
  
  signal DATA1 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
  signal DATA2 : STD_LOGIC_VECTOR(31 DOWNTO 0):= "00000000000000000000000000000000";
  
  BEGIN

    PROCESS(EN)
      BEGIN
        if (EN = '1') Then
          case ALUctr is
            when "000" => -- ADDER
              ReadData1 <= R0;
            when "001" => -- SUBBTRACTER
              ReadData1 <= R1;
            when "010" => -- AND
              ReadData1 <= R2;
            when "011" => -- OR
              ReadData1 <= R3;
            when "100" => -- LOGIC SHIFT LEFT
              ReadData1 <= R4;
            when "101" => -- LOGIC SHIFT RIGHT
              ReadData1 <= R5;
            when "110" => -- ARITHMETIC SHIFT LEFT
              ReadData1 <= R6;
            when "111" => -- ARITHMETIC SHIFT RIGHT
              ReadData1 <= R7;
            when others =>
            end case;
      else
        
      end if; 
    END PROCESS;
    
	 
END behavior;



