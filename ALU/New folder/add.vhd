LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY adder_8 is
	PORT(
		a : IN std_logic_vector(7 downto 0);
		b : IN std_logic_vector(7 downto 0);
		mode : IN std_logic;
		cin: IN std_logic;
		sum : OUT std_logic_vector(7 downto 0);
		cout: OUT std_logic);
END adder_8;

ARCHITECTURE behavioral OF adder_8 IS
	SIGNAL carry : std_logic_vector(7 downto 0);
	begin
	--use a process here because we need sequential statements
	add : PROCESS(a, b, mode, cin, carry)
		BEGIN
			IF(mode = '0') THEN
				cout<= '0';
				sum <= (OTHERS => '0');
			ELSE
		--the first bit is a special case because of cin
				sum(0) <= a(0) XOR b(0) XOR cin;
				carry(0) <= (a(0) AND cin) OR (b(0) AND cin) OR (a(0) AND b(0));
		--now do the rest of the N bits
				FOR i IN 1 TO 7 LOOP
					sum(i) <= a(i) XOR b(i) XOR carry(i-1);
					carry(i) <= (a(i) AND carry(i-1)) OR (b(i) AND carry(i-1)) OR (a(i) AND b(i));
				END LOOP;
		--assign coutfrom carry of last adder
				cout<= carry(7);
			END IF;
	END PROCESS add;
END behavioral;
