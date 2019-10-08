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
           CARRY    : out STD_LOGIC := '0';
           FLAG     :  IN STD_LOGIC := '0';
           ZERO     : out STD_LOGIC := '0';
           OVERFLOW : out STD_LOGIC := '0');
end FULL_BIT;

architecture Behavioral of FULL_BIT is

begin
 GEN : FOR N IN 31 DOWNTO 0 GENERATE
    ADDSUB : ENTITY WORK.ADD_SUB(BEHAVIOR)
        PORT MAP(DATA1_IN(N), DATA2_IN(N), FLAG, RESULT(N), CARRY);
 END GENERATE GEN;



end Behavioral;
