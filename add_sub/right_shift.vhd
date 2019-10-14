library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GEN_rleft is
    Port ( DATA1_IN :  in STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000100000000000";
           RESULT   : out STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
           V : out std_logic);-- OVERFLOW
end GEN_rleft;

architecture Behavioral of GEN_rleft is
  signal holder : std_logic_vector(32 downto 0):= "000000000000000000000000000000000";
begin      
 GEN : FOR N IN 32 DOWNTO 0 GENERATE
 OTHER : ENTITY WORK.sleft(BEHAVIOR)
 PORT MAP(A => DATA1_IN(N - 1), 
          S => holder(N));
 END GENERATE GEN;
 RESULT(31 downto 0) <= holder(32 downto 1);
 V <= holder(0);
end Behavioral;