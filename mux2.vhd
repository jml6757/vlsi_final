--------------------------------------------------------------------------------
-- max2: Maximum of four numbers with corresponding direction data
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  mux2 is

  generic (n : integer := 3);

  port (A       : in std_logic_vector (n-1 downto 0);
        B       : in std_logic_vector (n-1 downto 0);
        SEL     : in std_logic;
        Z       : out std_logic_vector (n-1 downto 0)
       );

end mux2;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of mux2 is
begin 

  Z <= A when SEL = '0' else
    B when SEL = '1';
     
end behavioral;
