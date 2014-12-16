--------------------------------------------------------------------------------
-- tb_absdiff2: Checks if absolute different between two vectors is correct
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity tb_absdiff2 is
	generic (n: integer := 16);
end tb_absdiff2;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture tb of tb_absdiff2 is

	-- Define record type
	type data_t is record
		a        : integer; -- A Input
		b        : integer; -- B Input
		diff     : integer; -- Difference (Expected)
		greatest : integer; -- Greater Index (Expected) 
	end record data_t;
	
	-- Define test table type
	type table_t is array (natural range <>) of data_t;

	-- Specify test cases
	constant tests : table_t :=
	( 
		(123,  123,  0, 1),    -- Equal small value
		(1020, 1020, 0, 1),    -- Equal large value
		(1123, 123,  1000, 0), -- Greater A value
		(123, 1123,  1000, 1)  -- Greater B value
	);

	-- Input and output signals
	signal A        : std_logic_vector(n-1 downto 0);
	signal B        : std_logic_vector(n-1 downto 0);
	signal DIFF     : std_logic_vector (n downto 0);
	signal GREATEST : std_logic_vector (0 downto 0);

begin

	--- Create absolute difference component
	DUT1 : entity work.absdiff2(behavioral)
		generic map (n)
		port map (A, B, DIFF, GREATEST(0));

	-- Test the circuit
	test_proc: process
	begin		
		for i in tests'range loop

			-- Reset inputs to zero
			A <= (others => '0');
			B <= (others => '0');
			wait for 5 ns;

			-- Input test vectors
			A <= std_logic_vector(to_unsigned(tests(i).a, n));
			B <= std_logic_vector(to_unsigned(tests(i).b, n));
			wait for 5 ns;
		
			-- Check result against Expected
			assert (tests(i).diff = to_integer(unsigned(DIFF))) 
				report "Incorrect DIFF - Expected: " & integer'image(tests(i).diff);

			assert (tests(i).greatest = to_integer(unsigned(GREATEST)))
				report "Incorrect GREATEST - Expected: " & integer'image(tests(i).greatest);

		end loop;		

		-- Halt after looping
		wait;

	end process;

end tb;
