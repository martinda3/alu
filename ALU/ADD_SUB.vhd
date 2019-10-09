LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ADD_SUB IS
  PORT(A  :   IN  STD_LOGIC := 'U';
	     B  :   IN  STD_LOGIC := 'U';
       CI :   IN  STD_LOGIC := 'U';
       --
       S  :  OUT  STD_LOGIC := 'U';
       CO :  OUT  STD_LOGIC := 'U');
END ADD_SUB;

ARCHITECTURE BEHAVIOR OF ADD_SUB IS
  
	
  BEGIN
    --PROCESS(A, B, CI)
	  --BEGIN 
		  S <= A XOR B XOR CI ;
		  CO <= (A AND CI) OR (B AND CI) OR (A AND B);
	--END PROCESS;
END BEHAVIOR;



