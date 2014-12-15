--------------------------------------------------------------------------------
-- rcla: Implements addition using ripple carry structure
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity rca is

	generic (n: integer := 8);

	port    (A: in std_logic_vector(n-1 downto 0);
			 B: in std_logic_vector(n-1 downto 0);
			 SUM: out std_logic_vector(n downto 0)
			);
end rca;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture structural of rca is
	signal C: std_logic_vector(n downto 0);
	signal A_XOR_B : std_logic_vector (n-1 downto 0);
	signal A_AND_B : std_logic_vector (n-1 downto 0); 
begin

	--- Generate common lines
	A_XOR_B <= A xor B;
	A_AND_B <= A and B;

	--- Add 0 to carry bus
	C(0) <= '0';

	--- Generate carry structure
	carry_gen: for i in 1 to n generate
		C(i) <= ( A_XOR_B(i-1) and C(i-1) ) or A_AND_B(i-1);
	end generate;

	--- Generate sum structure
	sum_gen: for i in 0 to n-1 generate
		SUM(i) <= A_XOR_B(i) xor C(i);
	end generate;

	--- Make final sum value the value of the carry out
	SUM(n) <= C(n);

end structural;
