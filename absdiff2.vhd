--------------------------------------------------------------------------------
-- absdiff2: Gets the absolute difference between two numbers and also outputs
---          the index of which one is greater (A=0, B=1)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  absdiff2 is
   generic (n : integer := 11); 
   port (A        : in std_logic_vector (n-1 downto 0);
         B        : in std_logic_vector (n-1 downto 0);
         DIFF     : out std_logic_vector (n downto 0);
         GREATEST : out std_logic
        );
end absdiff2;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of absdiff2 is
  	signal DIFF_A_B: std_logic_vector(n downto 0); -- Propogate
	 signal DIFF_B_A: std_logic_vector(n downto 0); -- Generate
	 signal MAX_IDX_AB: std_logic; -- Generate
begin 
  
  	--- Create carry lookahead adder
	subtract_cla1 : entity work.cla(structural)
    generic map(n)
		port map(A, B, '1', DIFF_A_B);
		  
		--- Create carry lookahead adder
	subtract_cla2 : entity work.cla(structural)
    generic map(n)
		port map(B, A, '1', DIFF_B_A);
  
  maxidx_inst0: entity work.maxidx2(behavioral)
    generic map(n => n-1)
    port map(A, B, MAX_IDX_AB);
  
  GREATEST <= MAX_IDX_AB;
  
  mux_inst0: entity work.mux2(behavioral) 
    generic map(n => n+1)
    port map(DIFF_A_B, DIFF_B_A, MAX_IDX_AB, DIFF);

end behavioral;
