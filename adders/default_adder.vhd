--------------------------------------------------------------------------------
-- default_adder: The default adder implementation used by the numeric std
--                library. Used to test against other adders.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  default_adder is

	generic (n: integer := 8);
	
	port    (A: in std_logic_vector(n-1 downto 0);
			 B: in std_logic_vector(n-1 downto 0);
			 SUM: out std_logic_vector(n downto 0)
			);
end default_adder;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of default_adder is
begin 

  SUM <= std_logic_vector(unsigned('0' & A) + unsigned('0' & B));

end behavioral;
