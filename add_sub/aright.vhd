library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GEN_aright is
    Port ( DATA1_IN :  in STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000100000000001";
           RESULT   : out STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000");-- OVERFLOW
end GEN_aright;

architecture Behavioral of GEN_aright is
  signal holder : std_logic_vector(32 downto 0):= "000000000000000000000000000000000";
begin      
 GEN : FOR N IN 31 DOWNTO 1 GENERATE
 OTHER : ENTITY WORK.sleft(BEHAVIOR)
 PORT MAP(A => DATA1_IN(N), 
          S => holder(N));
 END GENERATE GEN;
 RESULT(30 downto 0) <= holder(31 downto 1);
 RESULT(31) <= holder(31);
end Behavioral;