--------------------------------------------------------------------------------
-- mac121: Multiply and accumulate with multipliers of 1, 2, and 1
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  mac121 is
   generic (n : integer := 8); 
   port (A       : in std_logic_vector (n-1 downto 0);
         B       : in std_logic_vector (n-1 downto 0);
         C       : in std_logic_vector (n-1 downto 0);
         SUM     : out std_logic_vector (n-1 downto 0)
        );
end mac121;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of mac121 is
  signal B_SHIFTED : std_logic_vector(n-1 downto 0);
begin 
  B_SHIFTED(n-1 downto 1) <= B(n-2 downto 0);
  B_SHIFTED(0) <= '0';
  SUM <= std_logic_vector(unsigned(A) + unsigned(B_SHIFTED) + unsigned(C));
end behavioral;

