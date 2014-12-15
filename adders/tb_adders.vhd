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
	adder_default : entity work.default_adder(behavioral)
		generic map(n)
		port map   (A, B, SUM_DEFAULT);

	--- Create carry lookahead adder
	adder_cla : entity work.cla(structural)
		generic map(n)
		port map   (A, B, SUM_CLA);

	--- Create ripple carry adder
	adder_rca : entity work.rca(structural)
		generic map(n)
		port map   (A, B, SUM_RCA);

	--- Create kogge-stone adder
	adder_ksa : entity work.ksa(structural)
		generic map(n)
		port map   (A, B, SUM_KSA);

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
		wait;

	end process;

end tb;
