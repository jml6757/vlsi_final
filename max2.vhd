--------------------------------------------------------------------------------
-- max2: Maximum of two numbers with corresponding direction data
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  max2 is
   generic (n : integer := 8); 
   port (A       : in std_logic_vector (n-1 downto 0);
         A_DIR   : in std_logic_vector (2 downto 0);
         B       : in std_logic_vector (n-1 downto 0);
         B_DIR   : in std_logic_vector (2 downto 0);
         MAX     : out std_logic_vector (n-1 downto 0);
         MAX_DIR : out std_logic_vector (2 downto 0)
        );
end max2;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of max2 is
begin 

  process(A, A_DIR, B, B_DIR)
  begin
    if(A > B) then
      MAX <= A;
      MAX_DIR <= A_DIR;
    else
      MAX <= B;
      MAX_DIR <= B_DIR;      
    end if;
  end process;

end behavioral;