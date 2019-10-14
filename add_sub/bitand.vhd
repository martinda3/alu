LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY bitand IS
  PORT(
      A  :   IN  STD_LOGIC := 'U';
      B  :   IN  STD_LOGIC := 'U';
      --
      S  :  OUT  STD_LOGIC := 'U');
END bitand;

ARCHITECTURE BEHAVIOR OF bitand IS
  BEGIN
  S    <= (A and B);
END BEHAVIOR;