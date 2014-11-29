--------------------------------------------------------------------------------
-- absdiff2: Gets the absolute difference between two numbers and also outputs
---          which one is greater
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
begin 
  
  process(A, B)
  begin
    if(A > B) then
      DIFF <= std_logic_vector(unsigned(A) - unsigned(B));
      GREATEST <= '0';
    else
      DIFF <= std_logic_vector(unsigned(B) - unsigned(A));
      GREATEST <= '1';
    end if;
  end process;

end behavioral;
