LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE std.TEXTIO.all  ; 
ENTITY opmux_tb  IS 
END ; 
 
ARCHITECTURE opmux_tb_arch OF opmux_tb IS
  SIGNAL SAL   :  STD_LOGIC := 'U'  ; 
  SIGNAL SLR   :  STD_LOGIC := 'U'  ; 
  SIGNAL ADD   :  STD_LOGIC := 'U'  ; 
  SIGNAL SAR   :  STD_LOGIC := 'U'  ; 
  SIGNAL SUB   :  STD_LOGIC := 'U'  ; 
  SIGNAL ORR   :  STD_LOGIC := 'U'  ; 
  SIGNAL ANDD   :  STD_LOGIC := 'U'  ; 
  SIGNAL SLLL   :  STD_LOGIC := 'U'  ; 
  SIGNAL OP   :  std_logic_vector (2 downto 0) := "UUU"  ; 
  COMPONENT OPMUX  
    PORT ( 
      SAL  : out STD_LOGIC ; 
      SLR  : out STD_LOGIC ; 
      ADD  : out STD_LOGIC ; 
      SAR  : out STD_LOGIC ; 
      SUB  : out STD_LOGIC ; 
      ORR  : out STD_LOGIC ; 
      ANDD  : out STD_LOGIC ; 
      SLLL  : out STD_LOGIC ; 
      OP  : in std_logic_vector (2 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : OPMUX  
    PORT MAP ( 
      SAL   => SAL  ,
      SLR   => SLR  ,
      ADD   => ADD  ,
      SAR   => SAR  ,
      SUB   => SUB  ,
      ORR   => ORR  ,
      ANDD   => ANDD  ,
      SLLL   => SLLL  ,
      OP   => OP   ) ; 
END ; 

