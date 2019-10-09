----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/08/2019 05:26:11 PM
-- Design Name: 
-- Module Name: FULL_BIT - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FULL_BIT is
    Port ( DATA1_IN :  in STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
           DATA2_IN :  in STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
           RESULT   : out STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
           CARRY31  : out STD_LOGIC := 'U';
           CARRY30  : out STD_LOGIC := 'U';
           FLAG     :  IN STD_LOGIC := 'U';
           ZERO     : out STD_LOGIC := 'U';
           OVERFLOW : out STD_LOGIC := 'U');
end FULL_BIT;

architecture Behavioral of FULL_BIT is
  SIGNAL CARRYOUT : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";

begin
  
  
 GEN : FOR N IN 31 DOWNTO 0 GENERATE
   G1: IF (N = 0) GENERATE
    RESULT(0)   <= DATA1_IN(0) XOR DATA2_IN(0) XOR FLAG;
    CARRYOUT(0) <= (DATA1_IN(0) AND FLAG) OR (DATA2_IN(0) AND FLAG) OR (DATA1_IN(0) AND DATA2_IN(0));
   END GENERATE G1;
   G2 : IF (N > 0) GENERATE
    OTHER : ENTITY WORK.ADD_SUB(BEHAVIOR)
    PORT MAP(A => DATA1_IN(N), B => DATA2_IN(N), S =>RESULT(N), CI => CARRYOUT(N-1), CO => CARRYOUT(N));
   END GENERATE G2;
 END GENERATE GEN;
 
 CARRY31 <= CARRYOUT(31);
 CARRY30 <= CARRYOUT(30);

end Behavioral;
