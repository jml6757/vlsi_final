--------------------------------------------------------------------------------
-- tb_cla: Checks if the addition or subtraction using a carry lookahead adder
--         is correct.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity tb_cla is
	generic (n: integer := 8);
end tb_cla;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture tb of tb_cla is

	-- Define record type
	type data_t is record
		a        : integer; -- A Input
		b        : integer; -- B Input
		toggle   : integer; -- Toggle Add or Subtract
		sum_diff : integer; -- Sum or Difference (Expected) 
	end record data_t;
	
	-- Define test table type
	type table_t is array (natural range <>) of data_t;

	-- Specify test cases
	constant tests : table_t :=
	( 
		(255, 255, 0, 510),  -- Add max value
		(255, 255, 1, 0),    -- Subtract max value
		(255, 1,   0, 256),  -- Add min value
		(255, 1,   1, 254),  -- Subtract min value
		(128, 1,   1, 127),  -- Subtract for most carries (256 is truncated)
		(123, 52,  0, 175),  -- Add random values
		(123, 52,  1, 71)    -- Subtract random values
	);

	-- Input and output signals
	signal A: std_logic_vector(n-1 downto 0);
	signal B: std_logic_vector(n-1 downto 0);
	signal T: std_logic_vector(0 downto 0);
	signal SUM: std_logic_vector(n downto 0);

begin

	--- Create carry lookahead adder
	DUT1 : entity work.cla(structural)
		generic map(n)
		port map   (A, B, T(0), SUM);

	-- Test the circuit
	test_proc: process
	begin		
		for i in tests'range loop

			-- Input test vectors
			A <= std_logic_vector(to_unsigned(tests(i).a, n));
			B <= std_logic_vector(to_unsigned(tests(i).b, n));
			T <= std_logic_vector(to_unsigned(tests(i).toggle, 1));
			wait for 5 ns;
		
			-- Check result against Expected
			assert (tests(i).sum_diff = to_integer(unsigned(SUM))) 
				report "Incorrect SUM/DIFF - Expected: " & integer'image(tests(i).sum_diff);

		end loop;		

		-- Halt after looping
		wait;

	end process;

end tb;
