
--------------------------------------------------------------------------------
-- deriv: Determine the derivative given 6 pixel values (A-F) and their
--        direction encodings (DIR1 and DIR1)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  deriv is
   generic (n : integer := 8); 
   port (A       : in std_logic_vector (n-1 downto 0);
         B       : in std_logic_vector (n-1 downto 0);
         C       : in std_logic_vector (n-1 downto 0);
         D       : in std_logic_vector (n-1 downto 0);
         E       : in std_logic_vector (n-1 downto 0);
         F       : in std_logic_vector (n-1 downto 0);
         DIR1    : in std_logic_vector (2 downto 0);
         DIR2    : in std_logic_vector (2 downto 0);
         DIFF_OUT: out std_logic_vector (n-1 downto 0);
         DIR_OUT : out std_logic_vector (2 downto 0)
        );
end deriv;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of deriv is
  signal MINUEND : std_logic_vector(n-1 downto 0);
  signal SUBTRAHEND : std_logic_vector(n-1 downto 0);
  signal UNUSED : std_logic_vector(n-1 downto 0);
begin 
  
  mac_inst0: entity work.mac121(behavioral)
    port map(A, B, C, MINUEND);

  mac_inst1: entity work.mac121(behavioral)
    port map(D, E, F, SUBTRAHEND);

  sub_inst0: entity work.sub2(behavioral)
    port map(MINUEND, SUBTRAHEND, DIFF_OUT);

  max_inst0: entity work.max2(behavioral)
    port map(MINUEND, DIR1, SUBTRAHEND, DIR1, UNUSED, DIR_OUT);

end behavioral;

