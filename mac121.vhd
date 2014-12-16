--------------------------------------------------------------------------------
-- mac121: Multiply and accumulate with multipliers coefficients. The sum
--         should be (n + log(sum(multiplier_coefficients))) bits wide to make 
--         sure that no data is lost. For the case of 1, 2, 1 coefficients, this 
--         means the output needs to be 10 bits.  
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  mac121 is
   generic (n : integer := 8); 
   port (A       : in std_logic_vector (n-1 downto 0);
         B       : in std_logic_vector (n-1 downto 0);
         C       : in std_logic_vector (n-1 downto 0);
         SUM     : out std_logic_vector (n+2 downto 0)
        );
end mac121;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of mac121 is
  signal B_SHIFTED : std_logic_vector(n downto 0);
  signal A_EXTEND  : std_logic_vector(n downto 0);
  signal C_EXTEND  : std_logic_vector(n+1 downto 0);
  signal SUM_A_B   : std_logic_vector(n+1 downto 0);
begin
  
  -- Multiply B by 2
  B_SHIFTED(n downto 1) <= B(n-1 downto 0);
  B_SHIFTED(0) <= '0';
  
  -- Extend A Bus
  A_EXTEND(n-1 downto 0) <= A;
  A_EXTEND(n) <= '0';
  
  -- Extend B Bus
  C_EXTEND(n-1 downto 0) <= C;
  C_EXTEND(n+1 downto n) <= "00";
  
 	--- Add A and 2*B
	adder_cla1 : entity work.cla(structural)
		generic map(n+1)
		port map   (A_EXTEND, B_SHIFTED, '0', SUM_A_B);
		  
  --- Add C to the sum
	adder_cla2 : entity work.cla(structural)
		generic map(n+2)
		port map   (SUM_A_B, C_EXTEND, '0', SUM);

end behavioral;

