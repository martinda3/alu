LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 
ENTITY add_sub_tb  IS 
END ; 
 
ARCHITECTURE add_sub_tb_arch OF add_sub_tb IS
  
  SIGNAL CI  :  STD_LOGIC := '0'; 
  SIGNAL A   :  STD_LOGIC := '0'; 
  SIGNAL CO  :  STD_LOGIC := '0'; 
  SIGNAL B   :  STD_LOGIC := '0'; 
  SIGNAL S   :  STD_LOGIC := '0'; 
  
  CONSTANT DELAY    :  time := 10 ns;
  
  TYPE EN_ARRAY  IS ARRAY (1 TO 8) OF STD_LOGIC;
  CONSTANT A_IN    :  EN_ARRAY  := ('0',     '1',   '0',   '1',   '0',   '1',   '0',   '1');
  CONSTANT B_IN    :  EN_ARRAY  := ('0',     '0',   '1',   '1',   '0',   '0',   '1',   '1');
  CONSTANT CI_IN   :  EN_ARRAY  := ('0',     '0',   '0',   '0',   '1',   '1',   '1',   '1');
  
  COMPONENT ADD_SUB  
    PORT ( 
      CI :  in STD_LOGIC; 
      A  :  in STD_LOGIC; 
      CO : out STD_LOGIC; 
      B  :  in STD_LOGIC; 
      S  : out STD_LOGIC); 
  END COMPONENT ; 
  
BEGIN
  
  TEST : PROCESS
    variable i : integer := 1;
    BEGIN
      FOR i IN 1 TO 8 LOOP
        A  <= A_IN(i);
        B  <= B_IN(i);
        CI <= CI_IN(i);
        wait for DELAY;
      end loop;
      wait;
    end process TEST;
    
  DUT  : ADD_SUB  
    PORT MAP ( 
      CI  => CI,
      A   => A,
      CO  => CO,
      B   => B,
      S   => S); 
END; 

