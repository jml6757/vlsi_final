--------------------------------------------------------------------------------
-- rcla: Implements addition using ripple carry structure
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------

entity tb_adders is
	generic (n: integer := 8);
end tb_adders;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture tb of tb_adders is
	signal A: std_logic_vector(n-1 downto 0);
	signal B: std_logic_vector(n-1 downto 0);
	signal SUM_DEFAULT: std_logic_vector(n downto 0);
	signal SUM_CLA: std_logic_vector(n downto 0);
	signal SUM_RCA: std_logic_vector(n downto 0);
	signal SUM_KSA: std_logic_vector(n downto 0);
begin

	--- Create default adder
	DUT1 : entity work.adder(arch)
		generic map(n)
		port map   (A, B, SUM_DEFAULT, SUM_CLA, SUM_RCA, SUM_KSA);

	--- Test using predefined inputs
	process
	begin

		-- Reset adders to zero
		A <= (others => '0');
		B <= (others => '0');
		wait for 5 ns;

		-- Give adders a random input
		A <= x"9A";
		B <= x"72";
		wait for 5 ns;

		-- Reset adders to zero
		A <= (others => '0');
		B <= (others => '0');
		wait for 5 ns;

		-- Give adders worst case carry input
		A <= x"FF";
		B <= x"01";
		wait for 5 ns;
		
		-- Reset adders to zero
		A <= (others => '0');
		B <= (others => '0');
		wait for 5 ns;

		-- Give adders worst case carry input
		A <= x"FF";
		B <= x"FF";
		wait;
		

	end process;

end tb;
