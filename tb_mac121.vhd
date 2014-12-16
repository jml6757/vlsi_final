--------------------------------------------------------------------------------
-- tb_mac121: Tests the multiply accumulate block
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity tb_mac121 is
	generic (n: integer := 8);
end tb_mac121;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture tb of tb_mac121 is

	-- Define record type
	type data_t is record
		a    : integer; -- A Input
		b    : integer; -- B Input
		c    : integer; -- C Input
		sum  : integer; -- Sum (Expected)
	end record data_t;
	
	-- Define test table type
	type table_t is array (natural range <>) of data_t;

	-- Specify test cases
	constant tests : table_t :=
	( 
		(255, 255, 255, 1020),  -- Max value
		(1,   1,   1,   4),     -- Min value
		(115, 118, 151, 502),   -- Random value
		(127,  50, 222, 449)    -- Random value
	);

	-- Input and output signals
	signal A      : std_logic_vector(n-1 downto 0);
	signal B      : std_logic_vector(n-1 downto 0);
	signal C      : std_logic_vector(n-1 downto 0);
	signal SUM   : std_logic_vector(n+2 downto 0);

begin

	--- Create multiply accumulate component
	DUT1: entity work.mac121(behavioral)
		port map(A, B, C, SUM);

	-- Test the circuit
	test_proc: process
	begin		
		for i in tests'range loop

			-- Input test vectors
			A <= std_logic_vector(to_unsigned(tests(i).a, n));
			B <= std_logic_vector(to_unsigned(tests(i).b, n));
			C <= std_logic_vector(to_unsigned(tests(i).c, n));
			wait for 5 ns;
		
			-- Check result against Expected
			assert (tests(i).sum = to_integer(unsigned(SUM))) 
				report "Incorrect SUM - Expected: " & integer'image(tests(i).sum);

		end loop;		

		-- Halt after looping
		wait;

	end process;

end tb;
