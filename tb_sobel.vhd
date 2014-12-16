--------------------------------------------------------------------------------
-- tb_sobel: Tests the extreme maximum for edge detection in all directions.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  tb_sobel is
	generic (n : integer := 8);
end tb_sobel;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture tb of tb_sobel is

	-- Define record type
	type data_t is record
		t00  : integer; -- T00 Input
		t01  : integer; -- T01 Input
		t02  : integer; -- T02 Input
		t10  : integer; -- T10 Input
		t11  : integer; -- T11 Input
		t12  : integer; -- T12 Input
		t20  : integer; -- T20 Input
		t21  : integer; -- T21 Input
		t22  : integer; -- T22 Input
		edge : std_logic; -- If Edge Exists (Expected)
		dir  : std_logic_vector(2 downto 0); -- Direction (Expected) 
	end record data_t;
	
	-- Define test table type
	type table_t is array (natural range <>) of data_t;

	-- Specify test cases
	constant tests : table_t :=
	( 
		(  0,   0,   0, 255,   0,   0, 255, 255,   0, '1', "111"),  -- NE_SW SouthWest edge
		(  0, 255, 255,   0,   0, 255,   0,   0,   0, '1', "110"),  -- NE_SW NorthEast edge
		(  0,   0,   0,   0,   0,   0, 255, 255, 255, '1', "011"),  -- N_S South edge
		(255, 255, 255,   0,   0,   0,   0,   0,   0, '1', "010"),  -- N_S North edge
		(255,   0,   0, 255,   0,   0, 255,   0,   0, '1', "001"),  -- E_W West edge
		(  0,   0, 255,   0,   0, 255,   0,   0, 255, '1', "000"),  -- E_W East edge
		(  0,   0,   0,   0,   0, 255,   0, 255, 255, '1', "101"),  -- NW_SE SouthEast edge
		(255, 255,   0, 255,   0,   0,   0,   0,   0, '1', "100"),  -- NW_SE Northwest edge
		(  0,   0,   0,   0,   0,   0,   0,   0,   0, '0', "000"),  -- All Black
		(255, 255, 255, 255, 255, 255, 255, 255, 255, '0', "000")   -- All White
	);

	-- Constant direction vectors
	constant EDGE_THRESHOLD: std_logic_vector(n+2 downto 0) := std_logic_vector(to_signed(80, n+3));   

	-- Input and output signals
	signal T00  : std_logic_vector(n-1 downto 0);
	signal T01  : std_logic_vector(n-1 downto 0);
	signal T02  : std_logic_vector(n-1 downto 0);
	signal T10  : std_logic_vector(n-1 downto 0);
	signal T11  : std_logic_vector(n-1 downto 0);
	signal T12  : std_logic_vector(n-1 downto 0);
	signal T20  : std_logic_vector(n-1 downto 0);
	signal T21  : std_logic_vector(n-1 downto 0);
	signal T22  : std_logic_vector(n-1 downto 0);
	signal EDGE : std_logic;
	signal DIR  : std_logic_vector (2 downto 0);

begin 

	--- Create sobel block
	DUT1: entity work.sobel(behavioral)
		port map(T00, T01, T02, T10, T11, T12, T20, T21, T22, EDGE_THRESHOLD, EDGE, DIR);

	-- Test the circuit
	test_proc: process
	begin		
		for i in tests'range loop

			-- Input test vectors
			T00 <= std_logic_vector(to_unsigned(tests(i).t00, n));
			T01 <= std_logic_vector(to_unsigned(tests(i).t01, n));
			T02 <= std_logic_vector(to_unsigned(tests(i).t02, n));
			T10 <= std_logic_vector(to_unsigned(tests(i).t10, n));
			T11 <= std_logic_vector(to_unsigned(tests(i).t11, n));
			T12 <= std_logic_vector(to_unsigned(tests(i).t12, n));
			T20 <= std_logic_vector(to_unsigned(tests(i).t20, n));
			T21 <= std_logic_vector(to_unsigned(tests(i).t21, n));
			T22 <= std_logic_vector(to_unsigned(tests(i).t22, n));
			wait for 5 ns;
		
			-- Check result against Expected
			assert (tests(i).edge = EDGE) 
				report "Incorrect EDGE";

			assert (tests(i).dir = DIR)
				report "Incorrect DIR";

		end loop;		

		-- Halt after looping
		wait;

	end process;

end tb;
