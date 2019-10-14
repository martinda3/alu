library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GEN_ADD_SUB is
    Port ( DATA1_IN :  in STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
           DATA2_IN :  in STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
           RESULT   : out STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
           C        : out STD_LOGIC := '0'; -- CARR/BORROW
           OP       :  IN STD_LOGIC := '0'; -- 0 = ADD, 1 = SUB
           Z        : out STD_LOGIC := '0'; -- ZERO FLAG
           V        : out STD_LOGIC := '0');-- OVERFLOW
end GEN_ADD_SUB;

architecture Behavioral of GEN_ADD_SUB is
  
  SIGNAL CARRYOUT : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
  SIGNAL BUFF     : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
  SIGNAL Z_FLAG   : STD_LOGIC := '0';
begin
 
 LSB : ENTITY WORK.ADD_SUB(BEHAVIOR)
 PORT MAP(A => DATA1_IN(0), 
          B => DATA2_IN(0), 
          S => RESULT(0),      
          CI => OP, 
          CO => CARRYOUT(0));
             
 GEN : FOR N IN 1 TO 30 GENERATE
 -- ADDER SUBTRACTOR
 OTHER : ENTITY WORK.ADD_SUB(BEHAVIOR)
 PORT MAP(A => DATA1_IN(N), 
          B => DATA2_IN(N), 
          S => RESULT(N),      
          CI => CARRYOUT(N - 1), 
          CO => CARRYOUT(N));
 END GENERATE GEN;
 
 MSB : ENTITY WORK.ADD_SUB(BEHAVIOR)
 PORT MAP(A => DATA1_IN(31), 
          B => DATA2_IN(31), 
          S => RESULT(31),      
          CI => CARRYOUT(30), 
          CO => CARRYOUT(31));
          
C <= CARRYOUT(31);  
V <= CARRYOUT(30) XOR CARRYOUT(31);
end Behavioral;
