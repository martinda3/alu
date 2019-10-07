library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

ENTITY OPMUX is
  PORT(OP     :  IN  std_logic_vector(2 downto 0) := "UUU";
	   ADD    :  OUT STD_LOGIC := 'U';
	   SUB    :  OUT STD_LOGIC := 'U';
	   SAL    :  OUT STD_LOGIC := 'U';
	   SAR    :  OUT STD_LOGIC := 'U';
	   SLLL   :  OUT STD_LOGIC := 'U';
	   SLR    :  OUT STD_LOGIC := 'U';
	   ANDD   :  OUT STD_LOGIC := 'U';
	   ORR    :  OUT STD_LOGIC := 'U';
		);

END OPMUX;

ARCHITECTURE behavior OF OPMUX IS
	
  BEGIN

    PROCESS
	  BEGIN
		CASE OP is 
		  WHEN "000" => -- ADD
			ADD <= '1';
			SUB <= '0';
			SAL <= '0';
			SAR <= '0';
			SLLL <= '0';
			SLR <= '0';
			ANDD <= '0';
			ORR  <= '0';
		  WHEN "001" => -- SHIFT LEFT ARTHIMATIC
			ADD <= '0';
			SUB <= '0';
			SAL <= '1';
			SAR <= '0';
			SLLL <= '0';
			SLR <= '0';
			ANDD <= '0';
			ORR  <= '0';
		  WHEN "010" => -- SHIFT LEFT LOGICAL
			ADD <= '0';
			SUB <= '0';
			SAL <= '0';
			SAR <= '0';
			SLLL <= '1';
			SLR <= '0';
			ANDD <= '0';
			ORR  <= '0';
		  WHEN "011" => -- OR
			ADD <= '0';
			SUB <= '0';
			SAL <= '0';
			SAR <= '0';
			SLLL <= '0';
			SLR <= '0';
			ANDD <= '0';
			ORR  <= '1';
		  WHEN "100" => -- SUB
			ADD <= '0';
			SUB <= '1';
			SAL <= '0';
			SAR <= '0';
			SLLL <= '0';
			SLR <= '0';
			ANDD <= '0';
			ORR  <= '0';
		  WHEN "101" => -- SHIFT RIGHT ARTHIMATIC
			ADD <= '0';
			SUB <= '0';
			SAL <= '0';
			SAR <= '1';
			SLLL <= '0';
			SLR <= '0';
			ANDD <= '0';
			ORR  <= '0';
		  WHEN "110" => -- SHIFT LEFT ARTHIMATIC
			ADD <= '0';
			SUB <= '0';
			SAL <= '1';
			SAR <= '0';
			SLLL <= '0';
			SLR <= '0';
			ANDD <= '0';
			ORR  <= '0';
		  WHEN "111" => -- AND
			ADD <= '0';
			SUB <= '0';
			SAL <= '0';
			SAR <= '0';
			SLLL <= '0';
			SLR <= '0';
			ANDD <= '1';
			ORR  <= '0';
		  WHEN OTHERS =>
		END CASE;
    END PROCESS;
	 
END behavior;

