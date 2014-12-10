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
         SUM     : out std_logic_vector (10 downto 0)
        );
end mac121;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of mac121 is
  signal B_SHIFTED : std_logic_vector(10 downto 0);
begin 
  B_SHIFTED(8 downto 1) <= B(7 downto 0);
  B_SHIFTED(0) <= '0';
  B_SHIFTED(9) <= '0';
  B_SHIFTED(10) <= '0';
  SUM <= std_logic_vector(unsigned(A) + unsigned(B_SHIFTED) + unsigned(C));

end behavioral;

