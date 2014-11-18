--------------------------------------------------------------------------------
-- sub2: Subtracts B from A
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  sub2 is
   generic (n : integer := 8); 
   port (A       : in std_logic_vector (n-1 downto 0);
         B       : in std_logic_vector (n-1 downto 0);
         DIFF    : out std_logic_vector (n-1 downto 0)
        );
end sub2;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of sub2 is
begin 
  DIFF <= std_logic_vector(unsigned(A) - unsigned(B));
end behavioral;


