library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

ENTITY ADDER is
  PORT(A     :  IN  std_logic_vector(31 downto 0) := "00000000000000000000000000000001";
	   B     :  IN  std_logic_vector(31 downto 0) := "00000000000000000000000000000001";
       CIN   :  IN  std_logic := '0';
       COUT  : OUT  std_logic := '0';
	   SUM   : OUT  std_logic_vector(31 downto 0) := "00000000000000000000000000000000"
       );
END ADDER;

ARCHITECTURE behavior OF ADDER IS
	
  SIGNAL CARRY : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
  BEGIN

    PROCESS(A, B, CIN, CARRY)
	  variable li : line;	  
	  BEGIN
		SUM(0) <= A(0) XOR B(0) XOR CIN;
		CARRY(0) <= (A(0) AND CIN) OR (B(0) AND CIN) OR (A(0) AND B(0));
		FOR i IN 1 TO 31 LOOP
		  SUM(i) <= A(i) XOR B(i) XOR CARRY(i-1);
		  CARRY(i) <= (A(i) AND CARRY(i-1)) OR (B(i) AND CARRY(i-1)) OR (A(i) AND B(i));
		END LOOP;
		COUT <= CARRY(31);
		write (li, to_hstring(SUM));
		WRITELINE(OUTPUT, li);
	END PROCESS;
	 
END behavior;



