--------------------------------------------------------------------------------
-- tb_sobel: Tests the extreme maximum for edge detection in all directions.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  tb_sobel is
   generic (n : integer := 8);
end tb_sobel;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture tb of tb_sobel is
  signal T00, T01, T02, T10, T11, T12, T20, T21, T22 : std_logic_vector(7 downto 0);
  signal EDGE_THRESHOLD: std_logic_vector(12 downto 0) := std_logic_vector(to_signed(80, 13));   
  signal EDGE       : std_logic;
  signal DIRECTION   : std_logic_vector (2 downto 0);
begin 

U1: entity work.sobel(behavioral)
  port map(T00 => T00, T01 => T01, T02 => T02, T10 => T10, T11 => T11, T12 => T12, T20 => T20, T21 => T21, T22 => T22, EDGE => EDGE, EDGE_THRESHOLD => EDGE_THRESHOLD, DIRECTION => DIRECTION);

test_process: process
  begin 
    
  --Test NE_SW SouthWest edge
  
  T00 <= b"00000000";
  T01 <= b"00000000";
  T02 <= b"00000000";
  T10 <= b"11111111";
  T11 <= b"00000000";
  T12 <= b"00000000";
  T20 <= b"11111111";
  T21 <= b"11111111";
  T22 <= b"00000000";
  
  wait for 5 ns;
  
  --Test NE_SW NorthEast edge
   
  T00 <= b"00000000";
  T01 <= b"11111111";
  T02 <= b"11111111";
  T10 <= b"00000000";
  T11 <= b"00000000";
  T12 <= b"11111111";
  T20 <= b"00000000";
  T21 <= b"00000000";
  T22 <= b"00000000";
  
  wait for 5 ns;
  
--Test N_S South edge
   
  T00 <= b"00000000";
  T01 <= b"00000000";
  T02 <= b"00000000";
  T10 <= b"00000000";
  T11 <= b"00000000";
  T12 <= b"00000000";
  T20 <= b"11111111";
  T21 <= b"11111111";
  T22 <= b"11111111";
  
  wait for 5 ns;
  
  --Test N_S North edge
   
  T00 <= b"11111111";
  T01 <= b"11111111";
  T02 <= b"11111111";
  T10 <= b"00000000";
  T11 <= b"00000000";
  T12 <= b"00000000";
  T20 <= b"00000000";
  T21 <= b"00000000";
  T22 <= b"00000000";
  
  wait for 5 ns;
  
  --Test E_W West edge
   
  T00 <= b"11111111";
  T01 <= b"00000000";
  T02 <= b"00000000";
  T10 <= b"11111111";
  T11 <= b"00000000";
  T12 <= b"00000000";
  T20 <= b"11111111";
  T21 <= b"00000000";
  T22 <= b"00000000";
  
  assert(EDGE = '1');
  assert(DIRECTION = "111");
  
  wait for 5 ns;
  
  --Test E_W East edge
   
  T00 <= b"00000000";
  T01 <= b"00000000";
  T02 <= b"11111111";
  T10 <= b"00000000";
  T11 <= b"00000000";
  T12 <= b"11111111";
  T20 <= b"00000000";
  T21 <= b"00000000";
  T22 <= b"11111111";
  
  wait for 5 ns;
  
  --Test NW_SE SouthEast edge
   
  T00 <= b"00000000";
  T01 <= b"00000000";
  T02 <= b"00000000";
  T10 <= b"00000000";
  T11 <= b"00000000";
  T12 <= b"11111111";
  T20 <= b"00000000";
  T21 <= b"11111111";
  T22 <= b"11111111";
  
  wait for 5 ns;
  
  --Test NW_SE Northwest edge
   
  T00 <= b"11111111";
  T01 <= b"11111111";
  T02 <= b"00000000";
  T10 <= b"11111111";
  T11 <= b"00000000";
  T12 <= b"00000000";
  T20 <= b"00000000";
  T21 <= b"00000000";
  T22 <= b"00000000";
  
  wait for 5 ns;
  
  --Test all Black
   
  T00 <= b"00000000";
  T01 <= b"00000000";
  T02 <= b"00000000";
  T10 <= b"00000000";
  T11 <= b"00000000";
  T12 <= b"00000000";
  T20 <= b"00000000";
  T21 <= b"00000000";
  T22 <= b"00000000";
  
  wait for 5 ns;
  
  --Test all White
   
  T00 <= b"11111111";
  T01 <= b"11111111";
  T02 <= b"11111111";
  T10 <= b"11111111";
  T11 <= b"11111111";
  T12 <= b"11111111";
  T20 <= b"11111111";
  T21 <= b"11111111";
  T22 <= b"11111111";
  
  wait for 5 ns;
  
end process;
end tb;
