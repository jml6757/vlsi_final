--------------------------------------------------------------------------------
-- tb_maxidx2: Tests the maximum index block
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity tb_maxidx2 is
	generic (n: integer := 8);
end tb_maxidx2;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture tb of tb_maxidx2 is

	-- Define record type
	type data_t is record
		a    : integer;   -- A Input
		b    : integer;   -- B Input
		idx  : std_logic;   -- Index Output (Expected)
	end record data_t;
	
	-- Define test table type
	type table_t is array (natural range <>) of data_t;

	-- Specify test cases
	constant tests : table_t :=
	( 
		(255, 255, '1'), -- Max value (same inputs defaults to right)
		(  1,   1, '1'), -- Min value (same inputs defaults to right)
		( 88, 114, '1'), -- Random value right
		( 73,   3, '0')  -- Random value left
	);

	-- Input and output signals
	signal A   : std_logic_vector(n-1 downto 0);
	signal B   : std_logic_vector(n-1 downto 0);
	signal IDX : std_logic;

begin

	--- Create maximum index component
	DUT1: entity work.maxidx2(behavioral)
		generic map(n)
		port map(A, B, IDX);

	-- Test the circuit
	test_proc: process
	begin		
		for i in tests'range loop

			-- Input test vectors
			A <= std_logic_vector(to_unsigned(tests(i).a, n));
			B <= std_logic_vector(to_unsigned(tests(i).b, n));
			wait for 5 ns;
		
			-- Check result against Expected
			assert (tests(i).idx = IDX) 
				report "Incorrect IDX";

		end loop;		

		-- Halt after looping
		wait;

	end process;

end tb;
