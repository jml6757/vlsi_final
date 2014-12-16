--------------------------------------------------------------------------------
-- rcla: Implements addition using ripple carry structure
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------

entity tb_cla is
	generic (n: integer := 11);
end tb_cla;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture tb of tb_cla is
	signal A: std_logic_vector(n-1 downto 0);
	signal B: std_logic_vector(n-1 downto 0);
	signal T: std_logic;
	signal SUM: std_logic_vector(n downto 0);
begin

	--- Create default adder
	DUT1 : entity work.cla(structural)
		generic map(n)
		port map   (A, B, T, SUM);

	--- Test using predefined inputs
	process
	begin

		-- Reset adders to zero
		A <= (others => '0');
		B <= (others => '0');
		T <= '0';
		wait for 5 ns;
		
		-- Give adders a random input
		A <= std_logic_vector(to_signed(765, n));
		B <= std_logic_vector(to_signed(0, n));
		T <= '0';
		wait for 5 ns;
		T <= '1';
		wait for 5 ns;

		-- Reset adders to zero
		A <= (others => '0');
		B <= (others => '0');
		T <= '0';
		wait for 5 ns;

		-- Give adders worst case carry input
		A <= std_logic_vector(to_signed(1020, n));
		B <= std_logic_vector(to_signed(1020, n));
		T <= '0';
		wait for 5 ns;
		T <= '1';
		wait for 5 ns;
		
		-- Reset adders to zero
		A <= (others => '0');
		B <= (others => '0');
		T <= '0';
		wait for 5 ns;

		-- Give adders worst case carry input
		A <= std_logic_vector(to_signed(765, n));
		B <= std_logic_vector(to_signed(765, n));
		T <= '0';
		wait for 5 ns;
		T <= '1';
		wait;
		

	end process;

end tb;
