--------------------------------------------------------------------------------
-- testbench_max2: Tests the max2 block
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  testbench_max2 is
   generic (n : integer := 8); 
end testbench_max2;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture tb of testbench_max2 is
  signal A       : std_logic_vector (n-1 downto 0);
  signal A_DIR   : std_logic_vector (2 downto 0);
  signal B       : std_logic_vector (n-1 downto 0);
  signal B_DIR   : std_logic_vector (2 downto 0);
  signal MAX     : std_logic_vector (n-1 downto 0);
  signal MAX_DIR : std_logic_vector (2 downto 0);
begin 

U1: entity work.max2(behavioral)
  port map(A,A_DIR,B,B_DIR, MAX, MAX_DIR);
    
    
A <= b"00000111";
B <= b"00000011";

A_DIR <= b"101";
B_DIR <= b"010";

end tb;


