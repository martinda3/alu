LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY GEN_OR IS
    PORT ( DATA1_IN :  IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
           DATA2_IN :  IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
           RESULT   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000");
END GEN_OR;

ARCHITECTURE BEHAVIORAL OF GEN_OR IS
BEGIN      
 GEN : FOR N IN 0 TO 31 GENERATE
   OTHER : ENTITY WORK.BITOR(BEHAVIOR)
   PORT MAP(A => DATA1_IN(N), B => DATA2_IN(N), S => RESULT(N));
 END GENERATE GEN;
END BEHAVIORAL;
