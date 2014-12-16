--------------------------------------------------------------------------------
-- tb_max4: Tests the maximum of 4 derivatives and perpendiculars block
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity tb_max4 is
	generic (n: integer := 8);
end tb_max4;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture tb of tb_max4 is

	-- Define record type
	type data_t is record
		a        : integer; -- A Input
		b        : integer; -- B Input
		c        : integer; -- C Input
		d        : integer; -- D Input
		max_val  : integer; -- Maximum Derivative (Expected) 
		max_perp : integer; -- Maximum Perpendicular Derivative (Expected) 
		max_dir  : std_logic_vector(2 downto 0); -- Maximum Derivative's Direction (Expected)
	end record data_t;
	
	-- Define test table type
	type table_t is array (natural range <>) of data_t;

	-- Specify test cases
	constant tests : table_t :=
	( 
		(  4,   1,   2,   2,   4,   1, "000"),  -- Test small numbers for first input
		(253, 255, 254, 254, 255, 253, "001"),  -- Test large numbers for second input
		(223, 246, 253,  89, 253,  89, "010"),  -- Test random numbers for third input
		( 21,  48,  98, 230, 230,  98, "011")   -- Test random numbers for fourth input
	);

	-- Constant direction vectors
	constant A_DIR    : std_logic_vector(2 downto 0) := "000"; -- 0
	constant B_DIR    : std_logic_vector(2 downto 0) := "001"; -- 1
	constant C_DIR    : std_logic_vector(2 downto 0) := "010"; -- 2
	constant D_DIR    : std_logic_vector(2 downto 0) := "011"; -- 3

	-- Input and output signals
	signal A        : std_logic_vector(n-1 downto 0);
	signal B        : std_logic_vector(n-1 downto 0);
	signal C        : std_logic_vector(n-1 downto 0);
	signal D        : std_logic_vector(n-1 downto 0);
	signal MAX_DIR  : std_logic_vector(2 downto 0);
	signal MAX_VAL  : std_logic_vector(n-1 downto 0);
	signal MAX_PERP : std_logic_vector(n-1 downto 0);

begin

	--- Create maximum of 4 values component
	DUT1: entity work.max4(behavioral)
		generic map(n)
		port map(A, A_DIR, B, B_DIR, C, C_DIR, D, D_DIR, MAX_DIR, MAX_VAL, MAX_PERP);

	-- Test the circuit
	test_proc: process
	begin		
		for i in tests'range loop

			-- Input test vectors
			A <= std_logic_vector(to_unsigned(tests(i).a, n));
			B <= std_logic_vector(to_unsigned(tests(i).b, n));
			C <= std_logic_vector(to_unsigned(tests(i).c, n));
			D <= std_logic_vector(to_unsigned(tests(i).d, n));
			wait for 5 ns;
		
			-- Check result against Expected
			assert (tests(i).max_val = to_integer(unsigned(MAX_VAL))) 
				report "Incorrect MAXIMUM VALUE - Expected: " & integer'image(tests(i).max_val);

			assert (tests(i).max_perp = to_integer(unsigned(MAX_PERP))) 
				report "Incorrect MAXIMUM PERPENDICULAR - Expected: " & integer'image(tests(i).max_perp);

			assert (tests(i).max_dir = MAX_DIR) 
				report "Incorrect MAXIMUM DIRECTION";

		end loop;		

		-- Halt after looping
		wait;

	end process;

end tb;
