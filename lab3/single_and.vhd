LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY BITAND IS
  PORT(
      A  :   IN  STD_LOGIC := 'U';
      B  :   IN  STD_LOGIC := 'U';
      --
      S  :  OUT  STD_LOGIC := 'U');
END BITAND;

ARCHITECTURE BEHAVIOR OF BITAND IS
  BEGIN
    S    <= (A AND B);
END BEHAVIOR;