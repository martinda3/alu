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

    TYPE EN_ARRAY  IS ARRAY (1 TO 3) OF STD_LOGIC;
    TYPE DATAARRAY IS ARRAY (1 TO 3) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
    CONSTANT DELAY    :  time := 10 ns;
    CONSTANT OP_IN    :  EN_ARRAY  := ('0',     '1',   '1');
    
    CONSTANT D1_IN   :  DATAARRAY := ("00000000000000000000000000000000", "00000000000000000000000000000000",
                                      "00000000000000000000000000000000");
                                         
    CONSTANT D2_IN   :  DATAARRAY := ("00000000000000000000000000000000", "00000000000000000000000000000000",
                                      "00000000000000000000000000000000");

    SIGNAL DATA1_IN :  STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
    SIGNAL DATA2_IN :  STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
    SIGNAL RESULT   :  STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
    SIGNAL CARRY31    :  STD_LOGIC := 'U';
    SIGNAL CARRY30    :  STD_LOGIC := 'U';
    SIGNAL FLAG     :  STD_LOGIC := 'U';
    SIGNAL ZERO     :  STD_LOGIC := 'U';
    SIGNAL OVERFLOW :  STD_LOGIC := 'U';


COMPONENT FULL_BIT
    Port ( DATA1_IN :  in STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
           DATA2_IN :  in STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
           RESULT   : out STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
           CARRY31    : out STD_LOGIC := 'U';
           CARRY30    : out STD_LOGIC := 'U';
           FLAG     :  IN STD_LOGIC := 'U';
           ZERO     : out STD_LOGIC := 'U';
           OVERFLOW : out STD_LOGIC := 'U');
END COMPONENT; 

begin
TEST : PROCESS
    variable i : integer := 1;
    BEGIN
      FOR i IN 1 TO 3 LOOP
        DATA1_IN   <= D1_IN(i);
        DATA2_IN  <= D2_IN(i);
        FLAG      <= OP_IN(i);
        wait for (DELAY/2);
        
      end loop;
      wait;
    end process TEST;

  










DUT  : FULL_BIT  
    PORT MAP ( 
         DATA1_IN => DATA1_IN,
         DATA2_IN => DATA2_IN,
         RESULT    => RESULT,
         CARRY31     => CARRY31,
         CARRY30     => CARRY30,
         FLAG      => FLAG,
         ZERO     => ZERO,
         OVERFLOW => OVERFLOW);
end Behavioral;
