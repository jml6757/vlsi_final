--------------------------------------------------------------------------------
-- cla: implements addition using carry look ahead structure
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity cla is

	generic (n: integer := 8);

	port    (A: in std_logic_vector(n-1 downto 0);
			 B: in std_logic_vector(n-1 downto 0);
			 SUM: out std_logic_vector(n downto 0)
			);
end cla;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture structural of cla is
	signal P: std_logic_vector(n-1 downto 0);
	signal G: std_logic_vector(n-1 downto 0);
	signal C: std_logic_vector(n downto 0);
begin

	--- Generate propogate and generate signals
	P <= A xor B;
	G <= A and B;

	--- Add carry-in to carry bus
	C(0) <= '0';

	--- Generate AND-OR structure
	carry_gen: for i in 1 to n generate
		C(i) <= G(i-1) or (P(i-1) and C(i-1));
	end generate;

	--- Do summing step
	SUM(n-1 downto 0) <= C(n-1 downto 0) xor P;

	--- Make final sum value the value of the carry out
	SUM(n) <= C(n);

end structural;
