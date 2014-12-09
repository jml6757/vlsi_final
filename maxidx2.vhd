--------------------------------------------------------------------------------
-- maxidx2: Compares two numbers and returns the index of the larger one. 0 for
--          the A input and 1 for the B input. 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  maxidx2 is
   port (A       : in std_logic_vector (10 downto 0);
         B       : in std_logic_vector (10 downto 0);
         IDX     : out std_logic
        );
end maxidx2;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of maxidx2 is
begin 

  process(A, B)
  begin
    if(A > B) then
      IDX <= '0';
    else
      IDX <= '1';
    end if;
  end process;

end behavioral;