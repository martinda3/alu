LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY bitor IS
  PORT(
      A  :   IN  STD_LOGIC := 'U';
      B  :   IN  STD_LOGIC := 'U';
      --
      S  :  OUT  STD_LOGIC := 'U');
END bitor;

ARCHITECTURE BEHAVIOR OF bitor IS
  BEGIN
  S    <= (A or B);
END BEHAVIOR;