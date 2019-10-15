LIBRARY ieee; 
USE ieee.std_logic_1164.all;
 
ENTITY register_file_tb IS 
END register_file_tb; 
 
ARCHITECTURE register_file_tb_arch OF register_file_tb IS 
  
  TYPE EN_ARRAY  IS ARRAY (1 TO 10) OF STD_LOGIC;
  TYPE REG_ARRAY IS ARRAY (1 TO 10) OF STD_LOGIC_VECTOR(2  DOWNTO 0);
  TYPE DATAARRAY IS ARRAY (1 TO 10) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
  
  CONSTANT DELAY    :  time := 10 ns;
  
  CONSTANT RR_IN    :  EN_ARRAY  := ('0',     '1',   '0',   '1',   '0',   '1',   '0',   '0',   '0',   '0');
  CONSTANT RW_IN    :  EN_ARRAY  := ('0',     '0',   '0',   '0',   '1',   '0',   '0',   '0',   '0',   '0');
  CONSTANT RS_IN    :  REG_ARRAY := ("001", "001", "010", "010", "000", "110", "000", "000", "000", "000");
  CONSTANT RT_IN    :  REG_ARRAY := ("000", "111", "000", "101", "000", "110", "000", "000", "000", "000");
  CONSTANT RD_IN    :  REG_ARRAY := ("000", "000", "000", "110", "110", "000", "000", "000", "000", "000");
  
  CONSTANT WR_IN   :  DATAARRAY := ("00000000000000000000000000000000", "00000000000000000000000000000000",
                                    "00000000000000000000000000000000", "00000000000000000000000000000000",
                                    "11111111111111111111111111111111", "00000000000000000000000000000000",
                                    "00000000000000000000000000000000", "00000000000000000000000000000000",
                                    "00000000000000000000000000000000", "00000000000000000000000000000000");
                                     
  CONSTANT D1_OUT   :  DATAARRAY := ("00000000000000000000000000000000", "00000000000000000000000000000000",
                                     "00000000000000000000000000000000", "00000000000000000000000000000000",
                                     "00000000000000000000000000000000", "00000000000000000000000000000000",
                                     "00000000000000000000000000000000", "00000000000000000000000000000000",
                                     "00000000000000000000000000000000", "00000000000000000000000000000000");
                                     
  CONSTANT D2_OUT   :  DATAARRAY := ("00000000000000000000000000000000", "00000000000000000000000000000000",
                                     "00000000000000000000000000000000", "00000000000000000000000000000000",
                                     "00000000000000000000000000000000", "00000000000000000000000000000000",
                                     "00000000000000000000000000000000", "00000000000000000000000000000000",
                                     "00000000000000000000000000000000", "00000000000000000000000000000000");
  
 
  
  
  SIGNAL RegRead    :  STD_LOGIC := '0';
  SIGNAL RegWrite   :  STD_LOGIC := '0';
  SIGNAL RegS       :  std_logic_vector (2  downto 0) := "000";
  SIGNAL RegT       :  std_logic_vector (2  downto 0) := "000";   
  SIGNAL RegD       :  std_logic_vector (2  downto 0) := "000"; 
  SIGNAL WriteData  :  std_logic_vector (31 downto 0) := "00000000000000000000000000000000"; 
  SIGNAL ReadData1  :  std_logic_vector (31 downto 0) := "00000000000000000000000000000000"; 
  SIGNAL ReadData2  :  std_logic_vector (31 downto 0) := "00000000000000000000000000000000"; 
    
  COMPONENT Register_File  
    PORT ( 
      RegRead   :  in STD_LOGIC ; 
      RegWrite  :  in STD_LOGIC ; 
      RegS      :  in std_logic_vector (2  downto 0); 
      RegT      :  in std_logic_vector (2  downto 0); 
      RegD      :  in std_logic_vector (2  downto 0); 
      WriteData :  in std_logic_vector (31 downto 0); 
      ReadData1 : out std_logic_vector (31 downto 0);
      ReadData2 : out std_logic_vector (31 downto 0));  
  END COMPONENT; 
  
BEGIN   
 
  TEST : PROCESS
    variable i : integer := 1;
    BEGIN
      FOR i IN 1 TO 10 LOOP
        RegRead   <= RR_IN(i);
        RegWrite  <= Rw_IN(i);
        RegS      <= RS_IN(i);
        RegT      <= RT_IN(i);
        RegD      <= RD_IN(i);
        WriteData <= WR_IN(i);
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
      
END register_file_tb_arch; 

