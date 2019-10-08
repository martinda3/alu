LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ADD_SUB IS
  PORT(A  :   IN  STD_LOGIC := '0';
	   B  :   IN  STD_LOGIC := '0';
       CI :   IN  STD_LOGIC := '0';
       S  :  OUT  STD_LOGIC := '0';
       CO :  OUT  STD_LOGIC := '0');
END ADD_SUB;

ARCHITECTURE BEHAVIOR OF ADD_SUB IS
	
  BEGIN
    PROCESS(A, B, CI)
    VARIABLE B_NEW : STD_LOGIC := '0';
	  BEGIN
	    B_NEW := B XOR CI;
		S <= A XOR B_NEW XOR CI;
		CO <= (A AND CI) OR (B_NEW AND CI) OR (A AND B_NEW);
	END PROCESS;
END BEHAVIOR;



