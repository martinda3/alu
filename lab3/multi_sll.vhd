LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY GEN_SLEFT IS
    PORT ( DATA1_IN :  IN STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000100000000000";
           RESULT   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000");-- OVERFLOW
END GEN_SLEFT;

ARCHITECTURE BEHAVIORAL OF GEN_SLEFT IS

  SIGNAL HOLDER : STD_LOGIC_VECTOR(32 DOWNTO 0):= "000000000000000000000000000000000";
  
BEGIN      

 GEN : 
   FOR N IN 0 TO 31 GENERATE
   OTHER : 
     ENTITY WORK.SLEFT(BEHAVIOR)
     PORT MAP(A => DATA1_IN(N), S => HOLDER(N + 1));
 END GENERATE GEN;
 --
 RESULT(31 DOWNTO 0) <= HOLDER(31 DOWNTO 0);
END BEHAVIORAL;