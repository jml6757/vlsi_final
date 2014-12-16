--
--------------------------------------------------------------------------------
-- ksa: Adds two n-bit numbers using a Kogge Stone adder. This adder is
--      implemented without a carry in or carry out line. Carry out is added
--      to the sum line.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.math_real.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  ksa is

	generic (n: integer := 8);
	
	port    (A: in std_logic_vector(n-1 downto 0);
			 B: in std_logic_vector(n-1 downto 0);
			 SUM: out std_logic_vector(n downto 0)
			);
end ksa;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture structural of ksa is
  
	--Returns the minimum index for the final generate and the total P+G range;
	function idx(i : integer) return integer is
	begin
		return 2**(i-1);
	end idx;

	constant STAGES : integer := integer(ceil(log2(real(n+1))));
	type lines_t is array (STAGES downto 0, n downto 0) of std_logic;
		
	signal P : lines_t;
	signal G : lines_t;
	
	signal C: std_logic_vector(n+1 downto 0);

begin

	--- Generate initial propogate and generate signals
	p_gen: for i in 0 to n-1 generate
		P(0, i) <= A(i) xor B(i);
	end generate;
	
	g_gen: for i in 0 to n-1 generate
		G(0, i) <= A(i) and B(i);
	end generate;

	--- Add carry-in to carry bus
	C(0) <= '0';

	--- Generate carry structure
	carry_gen: for i in 1 to STAGES generate
		
		-- Generate carry
		c_gen: for j in idx(i) to (2*idx(i) -1) generate
			size_check: if(j < n+1) generate
				C(j) <= ( P(i - 1, j - 1) and C(j - idx(i)) ) or G(i - 1, j - 1);
			end generate;
		end generate;

		-- Intermediate Propogates + Generates
		pg_gen: for j in 2*idx(i)-1 to n-1 generate
			-- Add generate line	
			G(i, j) <= ( P(i - 1, j) and G(i -1, j - idx(i)) ) or G(i - 1, j);
			-- Add propogate line
			P(i, j) <= P(i - 1, j) and P(i - 1, j - idx(i));
		end generate;

	end generate;

	--- Sum using carries
	sum_gen: for i in 0 to n-1 generate
		SUM(i) <= C(i) xor P(0, i);
	end generate;

	--- Make final sum value the value of the carry out
	SUM(n) <= C(n);

end structural;

