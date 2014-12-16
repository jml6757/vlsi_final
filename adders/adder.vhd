--------------------------------------------------------------------------------
-- rcla: Implements addition using ripple carry structure
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------

entity adder is

	generic (n: integer := 8);

	port    (A: in std_logic_vector(n-1 downto 0);
			 B: in std_logic_vector(n-1 downto 0);
			 SUM_DEFAULT: out std_logic_vector(n downto 0);
			 SUM_CLA: out std_logic_vector(n downto 0);
			 SUM_RCA: out std_logic_vector(n downto 0);
			 SUM_KSA: out std_logic_vector(n downto 0)
			);
end adder;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture arch of adder is
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

end arch;