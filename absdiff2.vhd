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
   generic (n : integer := 8); 
   port (A        : in std_logic_vector (n-1 downto 0);
         B        : in std_logic_vector (n-1 downto 0);
         DIFF     : out std_logic_vector (n-1 downto 0);
         GREATEST : out std_logic
        );
end absdiff2;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of absdiff2 is
   signal DIFF_A_B: std_logic_vector(n downto 0);
	 signal DIFF_B_A: std_logic_vector(n downto 0);
	 signal MAX_IDX_AB: std_logic;
begin 
  
  -- Find A-B with carry lookahead
	subtract_cla1 : entity work.cla(structural)
    generic map(n)
		port map(A, B, '1', DIFF_A_B);
		  
	-- Find B-A with carry lookahead
	subtract_cla2 : entity work.cla(structural)
    generic map(n)
		port map(B, A, '1', DIFF_B_A);
  
  -- Determine index of maximum of A (0) and B (1)
  maxidx_inst0: entity work.maxidx2(behavioral)
    generic map(n)
    port map(A, B, MAX_IDX_AB);
  
  GREATEST <= MAX_IDX_AB;
  
  -- Output difference based on the larger of the inputs
  -- Note: Truncate the differences between A and B since a larger value minus a 
  --       smaller or equal value will never grow in bit size
  mux_inst0: entity work.mux2(behavioral) 
    generic map(n)
    port map(DIFF_A_B(n-1 downto 0), DIFF_B_A(n-1 downto 0), MAX_IDX_AB, DIFF);

end behavioral;
