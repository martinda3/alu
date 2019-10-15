LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY BITOR IS
  PORT(
      A  :   IN  STD_LOGIC := 'U';
      B  :   IN  STD_LOGIC := 'U';
      --
      S  :  OUT  STD_LOGIC := 'U');
END BITOR;

ARCHITECTURE BEHAVIOR OF BITOR IS
  BEGIN
  S    <= (A OR B);
END BEHAVIOR;