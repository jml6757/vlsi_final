--------------------------------------------------------------------------------
-- cla: implements addition using carry look ahead structure
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity cla is

	generic (n: integer := 11);
	port    (A: in std_logic_vector(n-1 downto 0);
			 B: in std_logic_vector(n-1 downto 0);
			 T: in std_logic; -- Toggles add or subtract
			 SUM: out std_logic_vector(n downto 0)
			);
end cla;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture structural of cla is
	signal P: std_logic_vector(n-1 downto 0); -- Propogate
	signal G: std_logic_vector(n-1 downto 0); -- Generate
	signal B_COMP: std_logic_vector(n-1 downto 0); -- B (for addition) or B complement (for subtraction)
	signal C: std_logic_vector(n downto 0);   -- Carry
begin

  -- Complement input if toggle is set
  comp_gen: for i in 0 to n-1 generate
		B_COMP(i) <= B(i) xor T;
	end generate;
	
	--- Add toggle signal to carry-in bus
	C(0) <= T;

	--- Generate propogate and generate signals
	P <= A xor B_COMP;
	G <= A and B_COMP;

	--- Generate AND-OR structure
	carry_gen: for i in 1 to n generate
		C(i) <= G(i-1) or (P(i-1) and C(i-1));
	end generate;

	--- Do summing step
	SUM(n-1 downto 0) <= C(n-1 downto 0) xor P;

	--- Make final sum value the value of the carry out
	SUM(n) <= C(n) when T = '0' else
	          '0' when T = '1';

end structural;
