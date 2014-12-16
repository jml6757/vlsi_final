--------------------------------------------------------------------------------
-- tb_derivative: Tests the derivative structure
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity tb_derivative is
	generic (n: integer := 8);
end tb_derivative;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture tb of tb_derivative is

	-- Define record type
	type data_t is record
		a    : integer; -- A Input
		b    : integer; -- B Input
		c    : integer; -- C Input
		d    : integer; -- D Input
		e    : integer; -- E Input
		f    : integer; -- F Input
		diff : integer; -- Difference (Expected)
		dir  : std_logic_vector(2 downto 0); -- Direction (Expected) 
	end record data_t;
	
	-- Define test table type
	type table_t is array (natural range <>) of data_t;

	-- Specify test cases
	constant tests : table_t :=
	( 
		(255, 255, 255, 0, 0, 0, 1020, "000"),  -- Max Value Top
		(0, 0, 0, 255, 255, 255, 1020, "111"),  -- Max Value Bottom
		(123, 205, 76, 251, 166, 21, 5, "000"), -- Random Case Top
		(5, 98, 207, 23, 223, 122, 183, "111")  -- Random Case Bottom
	);

	-- Constant direction vectors
	constant DIR1 : std_logic_vector (2 downto 0) := "000";
	constant DIR2 : std_logic_vector (2 downto 0) := "111";

	-- Input and output signals
	signal A      : std_logic_vector(n-1 downto 0);
	signal B      : std_logic_vector(n-1 downto 0);
	signal C      : std_logic_vector(n-1 downto 0);
	signal D      : std_logic_vector(n-1 downto 0);
	signal E      : std_logic_vector(n-1 downto 0);
	signal F      : std_logic_vector(n-1 downto 0);
	signal DIFF   : std_logic_vector(n+1 downto 0);
	signal DIR    : std_logic_vector(2 downto 0);

begin

	--- Create derivative component
	DUT1: entity work.derivative(behavioral)
		port map(A, B, C, D, E, F, DIR1, DIR2, DIFF, DIR);

	-- Test the circuit
	test_proc: process
	begin		
		for i in tests'range loop

			-- Input test vectors
			A <= std_logic_vector(to_unsigned(tests(i).a, n));
			B <= std_logic_vector(to_unsigned(tests(i).b, n));
			C <= std_logic_vector(to_unsigned(tests(i).c, n));
			D <= std_logic_vector(to_unsigned(tests(i).d, n));
			E <= std_logic_vector(to_unsigned(tests(i).e, n));
			F <= std_logic_vector(to_unsigned(tests(i).f, n));
			wait for 5 ns;
		
			-- Check result against Expected
			assert (tests(i).diff = to_integer(unsigned(DIFF))) 
				report "Incorrect DIFF - Expected: " & integer'image(tests(i).diff);

			assert (tests(i).dir = DIR)
				report "Incorrect DIR";

		end loop;		

		-- Halt after looping
		wait;

	end process;

end tb;
