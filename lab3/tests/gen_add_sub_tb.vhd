LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 


ENTITY gen_add_sub_tb  IS 
END ; 
 
ARCHITECTURE gen_add_sub_tb_arch OF gen_add_sub_tb IS
  TYPE EN_ARRAY  IS ARRAY (1 TO 3) OF STD_LOGIC;
  TYPE DATAARRAY IS ARRAY (1 TO 3) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
  
  CONSTANT DELAY    :  time := 10 ns;
  CONSTANT OP_IN    :  EN_ARRAY  := ('0',     '1',   '0');
    
  CONSTANT D1_IN   :  DATAARRAY := ("00000000000000000000000000000011", "00000000000000000000000000000011",
                                      "00000000000000000000000000000011");
                                         
  CONSTANT D2_IN   :  DATAARRAY := ("00000000000000000000000000000010", "00000000000000000000000000000010",
                                      "00000000000000000000000000000010");
  
  
  
  
  SIGNAL DATA1_IN   :  std_logic_vector (31 downto 0) := "00000000000000000000000000000000"  ; 
  SIGNAL V          :  STD_LOGIC := 'U'  ; 
  SIGNAL Z          :  STD_LOGIC := '0'  ; 
  SIGNAL DATA2_IN   :  std_logic_vector (31 downto 0) := "00000000000000000000000000000000"  ; 
  SIGNAL OP         :  STD_LOGIC := '1'  ; 
  SIGNAL C          :  STD_LOGIC := 'U'  ; 
  SIGNAL RESULT     :  std_logic_vector (31 downto 0) := "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU"  ; 
  
  COMPONENT GEN_ADD_SUB  
    PORT ( 
      DATA1_IN  : in std_logic_vector (31 downto 0) ; 
      V  : out STD_LOGIC ; 
      Z  : out STD_LOGIC ; 
      DATA2_IN  : in std_logic_vector (31 downto 0) ; 
      OP  : in STD_LOGIC ; 
      C  : out STD_LOGIC ; 
      RESULT  : out std_logic_vector (31 downto 0) ); 
  END COMPONENT ; 
  
BEGIN
  
TEST : PROCESS
    variable i : integer := 1;
    BEGIN
      FOR i IN 1 TO 3 LOOP
        DATA1_IN   <= D1_IN(i);
        DATA2_IN  <= D2_IN(i);
        OP      <= OP_IN(i);
        wait for (DELAY/2);
        
      end loop;
      wait;
    end process TEST;
  
  
  DUT  : GEN_ADD_SUB  
    PORT MAP ( 
      DATA1_IN   => DATA1_IN  ,
      V   => V  ,
      Z   => Z  ,
      DATA2_IN   => DATA2_IN  ,
      OP   => OP  ,
      C   => C  ,
      RESULT   => RESULT   ) ; 
END ; 

