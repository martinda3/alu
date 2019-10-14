library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GEN_aleft is
    Port ( DATA1_IN :  in STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000100000000000";
           RESULT   : out STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000");-- OVERFLOW
end GEN_aleft;

architecture Behavioral of GEN_aleft is
  signal holder : std_logic_vector(32 downto 0):= "000000000000000000000000000000000";
begin      
 GEN : FOR N IN 0 TO 31 GENERATE
 OTHER : ENTITY WORK.sleft(BEHAVIOR)
 PORT MAP(A => DATA1_IN(N), 
          S => holder(N + 1));
 END GENERATE GEN;
 RESULT(31 downto 0) <= holder(31 downto 0);
 RESULT(31) <= holder(30);
end Behavioral;