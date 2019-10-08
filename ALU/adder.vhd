library IEEE;
use IEEE.std_logic_1164.all;

ENTITY ADDER is
  PORT(A     :  IN  std_logic_vector(31 downto 0) := "00000000000000000000000000000001";
	   B     :  IN  std_logic_vector(31 downto 0) := "00000000000000000000000000000001";
       OP	 :  IN  std_logic := '0';
       ADD :  IN  std_logic := '0';
       SUB :  IN  std_logic := '0';
       COUT  : OUT  std_logic := '0';
	   SUM   : OUT  std_logic_vector(31 downto 0) := "00000000000000000000000000000000"
       );
END ADDER;

ARCHITECTURE behavior OF ADDER IS
	
  SIGNAL CARRY : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
  BEGIN

    PROCESS(OP)
	  BEGIN
		SUM(0) <= A(0) XOR B(0) XOR SUB;
		CARRY(0) <= (A(0) AND OP) OR (B(0) AND OP) OR (A(0) AND B(0));
		FOR i IN 1 TO 31 LOOP
		  SUM(i) <= A(i) XOR B(i) XOR CARRY(i-1);
		  CARRY(i) <= (A(i) AND CARRY(i-1)) OR (B(i) AND CARRY(i-1)) OR (A(i) AND B(i));
		END LOOP;
		COUT <= CARRY(31);
	END PROCESS;
	 
END behavior;



