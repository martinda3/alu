----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/08/2019 06:08:01 PM
-- Design Name: 
-- Module Name: FULLBIT_TB - Behavioral
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

entity FULLBIT_TB is
--  Port ( );
end FULLBIT_TB;

architecture Behavioral of FULLBIT_TB is

    TYPE EN_ARRAY  IS ARRAY (1 TO 10) OF STD_LOGIC;
    TYPE DATAARRAY IS ARRAY (1 TO 10) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
    CONSTANT DELAY    :  time := 10 ns;
    CONSTANT OP_IN    :  EN_ARRAY  := ('0',     '1',   '0',   '1',   '0',   '1',   '0',   '0',   '0',   '0');
    
    CONSTANT D1_IN   :  DATAARRAY := ("00000000000000000000000000000001", "00000000000000000000000000000001",
                                      "00000000000000000000000000000000", "00000000000000000000000000000000",
                                      "00000000000000000000000000000000", "00000000000000000000000000000000",
                                      "00000000000000000000000000000000", "00000000000000000000000000000000",
                                      "00000000000000000000000000000000", "00000000000000000000000000000000");
                                         
    CONSTANT D2_IN   :  DATAARRAY := ("00000000000000000000000000000010", "00000000000000000000000000000010",
                                      "00000000000000000000000000000000", "00000000000000000000000000000000",
                                       "00000000000000000000000000000000", "00000000000000000000000000000000",
                                       "00000000000000000000000000000000", "00000000000000000000000000000000",
                                       "00000000000000000000000000000000", "00000000000000000000000000000000");

    SIGNAL DATA1_IN :  STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
    SIGNAL DATA2_IN :  STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
    SIGNAL RESULT   :  STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
    SIGNAL CARRY    :  STD_LOGIC := '0';
    SIGNAL FLAG     :  STD_LOGIC := '0';
    SIGNAL ZERO     :  STD_LOGIC := '0';
    SIGNAL OVERFLOW :  STD_LOGIC := '0';


COMPONENT FULL_BIT
    Port ( DATA1_IN :  in STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
           DATA2_IN :  in STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
           RESULT   : out STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
           CARRY    : out STD_LOGIC := '0';
           FLAG     :  IN STD_LOGIC := '0';
           ZERO     : out STD_LOGIC := '0';
           OVERFLOW : out STD_LOGIC := '0');
END COMPONENT; 

begin
TEST : PROCESS
    variable i : integer := 1;
    BEGIN
      FOR i IN 1 TO 3 LOOP
        DATA1_IN   <= D1_IN(i);
        DATA2_IN  <= D1_IN(i);
        FLAG      <= OP_IN(i);
        wait for DELAY;
      end loop;
      wait;
    end process TEST;

DUT  : FULL_BIT  
    PORT MAP ( 
         DATA1_IN => DATA1_IN,
         DATA2_IN => DATA2_IN,
         RESULT    => RESULT,
         CARRY     => CARRY,
         FLAG      => FLAG,
         ZERO     => ZERO,
         OVERFLOW => OVERFLOW);
end Behavioral;
