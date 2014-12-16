--------------------------------------------------------------------------------
-- tb_mux2: Tests the multiplexer block
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity tb_mux2 is
	generic (n: integer := 8);
end tb_mux2;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture tb of tb_mux2 is

	-- Define record type
	type data_t is record
		a    : integer;   -- A Input
		b    : integer;   -- B Input
		sel  : std_logic; -- Select input
		z    : integer;   -- Mux Output (Expected)
	end record data_t;
	
	-- Define test table type
	type table_t is array (natural range <>) of data_t;

	-- Specify test cases
	constant tests : table_t :=
	( 
		(255, 255, '0', 255),  -- Max value left
		(255, 255, '1', 255),  -- Max value right
		(211, 129, '0', 211),  -- Random value left
		(119,  47, '1',  47)   -- Random value right
	);

	-- Input and output signals
	signal A   : std_logic_vector(n-1 downto 0);
	signal B   : std_logic_vector(n-1 downto 0);
	signal SEL : std_logic;
	signal Z   : std_logic_vector(n-1 downto 0);

begin

	--- Create multiplexer component
	DUT1: entity work.mux2(behavioral)
		generic map(n)
		port map(A, B, SEL, Z);

	-- Test the circuit
	test_proc: process
	begin		
		for i in tests'range loop

			-- Input test vectors
			A <= std_logic_vector(to_unsigned(tests(i).a, n));
			B <= std_logic_vector(to_unsigned(tests(i).b, n));
			SEL <= tests(i).sel;
			wait for 5 ns;
		
			-- Check result against Expected
			assert (tests(i).z = to_integer(unsigned(Z))) 
				report "Incorrect Z - Expected: " & integer'image(tests(i).z);

		end loop;		

		-- Halt after looping
		wait;

	end process;

end tb;
