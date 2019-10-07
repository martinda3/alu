LIBRARY ieee; 
USE ieee.std_logic_1164.all;
 
ENTITY adder_tb_arch IS 
END adder_tb_arch; 
 
ARCHITECTURE adder_tb_arch OF adder_tb IS 
  
  TYPE EN_ARRAY  IS ARRAY (1 TO 10) OF STD_LOGIC;
  TYPE REG_ARRAY IS ARRAY (1 TO 10) OF STD_LOGIC_VECTOR(2  DOWNTO 0);
  TYPE DATAARRAY IS ARRAY (1 TO 10) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
  
  CONSTANT DELAY    :  time := 10 ns;
  
  CONSTANT OP_IN    :  EN_ARRAY  := ('0',     '1',   '0',   '1',   '0',   '1',   '0',   '0',   '0',   '0');
  
  CONSTANT A_IN   :  DATAARRAY := ("00000000000000000000000000000000", "00000000000000000000000000000000",
                                    "00000000000000000000000000000000", "00000000000000000000000000000000",
                                    "11111111111111111111111111111111", "00000000000000000000000000000000",
                                    "00000000000000000000000000000000", "00000000000000000000000000000000",
                                    "00000000000000000000000000000000", "00000000000000000000000000000000");
                                     
  CONSTANT B_IN   :  DATAARRAY := ("00000000000000000000000000000000", "00000000000000000000000000000000",
                                     "00000000000000000000000000000000", "00000000000000000000000000000000",
                                     "00000000000000000000000000000000", "00000000000000000000000000000000",
                                     "00000000000000000000000000000000", "00000000000000000000000000000000",
                                     "00000000000000000000000000000000", "00000000000000000000000000000000");
  
  
  SIGNAL OP    :  STD_LOGIC := '0';
  SIGNAL COUT   :  STD_LOGIC := '0';
  SIGNAL SUM  :  std_logic_vector (31 downto 0) := "00000000000000000000000000000000"; 
  SIGNAL A  :  std_logic_vector (31 downto 0) := "00000000000000000000000000000000"; 
  SIGNAL B  :  std_logic_vector (31 downto 0) := "00000000000000000000000000000000"; 
    
  COMPONENT Register_File  
    PORT ( 
      OP   :  in STD_LOGIC ; 
      COUT  :  in STD_LOGIC ; 
      SUM :  in std_logic_vector (31 downto 0); 
      A : out std_logic_vector (31 downto 0);
      B : out std_logic_vector (31 downto 0));  
  END COMPONENT; 
  
BEGIN   
 
  TEST : PROCESS
    variable i : integer := 1;
    BEGIN
      FOR i IN 1 TO 10 LOOP
        OP   <= OP_IN(i);
        B <= B_IN(i);
        A <= A_IN(i);
        wait for DELAY;
      end loop;
      wait;
    end process TEST;
 
--  CHECK : PROCESS
--    variable i : integer := 1;
--    BEGIN
--      FOR i IN 1 TO 10 LOOP
--        RegRead   <= RR_IN(i);
--        RegWrite  <= Rw_IN(i);
--        RegS      <= RS_IN(i);
--        RegT      <= RT_IN(i);
--        RegD      <= RD_IN(i);
--        WriteData <= WR_IN(i);
--        wait for DELAY/2;
--      end loop;
--      wait;
--    end process CHECK;

  DUT  : Register_File  
    PORT MAP ( 
      RegRead   => RegRead,
      RegWrite  => RegWrite,
      RegS      => RegS,
      RegT      => RegT,
      RegD      => RegD,
      WriteData => WriteData,
      ReadData1 => ReadData1,
      ReadData2 => ReadData2) ; 
      
END adder_tb_arch; 

