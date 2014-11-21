--------------------------------------------------------------------------------
-- max2: Maximum of four numbers with corresponding direction data
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  max4 is
   generic (n : integer := 8); 
   port (A       : in std_logic_vector (n-1 downto 0);
         A_DIR   : in std_logic_vector (2 downto 0);
         B       : in std_logic_vector (n-1 downto 0);
         B_DIR   : in std_logic_vector (2 downto 0);
         C       : in std_logic_vector (n-1 downto 0);
         C_DIR   : in std_logic_vector (2 downto 0);
         D       : in std_logic_vector (n-1 downto 0);
         D_DIR   : in std_logic_vector (2 downto 0);
         MAX     : out std_logic_vector (n-1 downto 0);
         MAX_DIR : out std_logic_vector (2 downto 0)
        );
end max4;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of max4 is
  signal MAX0       : std_logic_vector (n-1 downto 0);
  signal MAX0_DIR   : std_logic_vector (2 downto 0);
  signal MAX1       : std_logic_vector (n-1 downto 0);
  signal Max1_DIR   : std_logic_vector (2 downto 0);
begin 

  max_inst0: entity work.max2(behavioral)
    port map(A, A_DIR, B, B_DIR, MAX0, MAX0_DIR);
      
  max_inst1: entity work.max2(behavioral)
    port map(C, C_DIR, D, D_DIR, MAX1, MAX1_DIR);
      
  max_inst2: entity work.max2(behavioral)
    port map(MAX0, MAX0_DIR, MAX1, MAX1_DIR, MAX, MAX_DIR);

end behavioral;

