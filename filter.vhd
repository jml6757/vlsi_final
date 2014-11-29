--------------------------------------------------------------------------------
-- filter: Implements sobel filtering using a sobel filtering circuit and a 
---        finite state machine for control
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity filter is
	-- TODO: ADD CORRECT INTERFEACE
  port (
       T00, T01, T02, T10, T11, T12, T20, T21, T22: in std_logic_vector(7 downto 0); -- Pixel inputs
       EDGE: out std_logic;                                                          -- If there is an edge
       DIRECTION: out std_logic_vector(2 downto 0)                                   -- Max derivative direction
       );
end filter;


--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of filter is
begin 

-------------
-- STUB
-------------

end behavioral;



