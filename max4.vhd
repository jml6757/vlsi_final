--------------------------------------------------------------------------------
-- max2: Maximum of four numbers with corresponding direction data as well as
--       the perpendicular direction. This assumes that A is perpendicular to
--       B and that C is perpendicular to D.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  max4 is
   generic (n : integer := 12); 
   port (A       : in std_logic_vector (n-1 downto 0);
         A_DIR   : in std_logic_vector (2 downto 0);
         B       : in std_logic_vector (n-1 downto 0);
         B_DIR   : in std_logic_vector (2 downto 0);
         C       : in std_logic_vector (n-1 downto 0);
         C_DIR   : in std_logic_vector (2 downto 0);
         D       : in std_logic_vector (n-1 downto 0);
         D_DIR   : in std_logic_vector (2 downto 0);
         MAX_DIRECTION     : out std_logic_vector (2 downto 0);
         MAX_VALUE         : out std_logic_vector (n-1 downto 0);
         MAX_PERPENDICLUAR : out std_logic_vector (n-1 downto 0)
        );
end max4;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of max4 is

  -- Indeces of maximum numbers
  signal MAX_IDX_AB   : std_logic;
  signal MAX_IDX_CD   : std_logic;
  signal MAX_IDX_ABCD : std_logic;

  -- Inverse of indeces of maximum numbers
  signal NOT_MAX_IDX_AB   : std_logic;
  signal NOT_MAX_IDX_CD   : std_logic;

  -- Maximum data values
  signal MAX_AB       : std_logic_vector (n-1 downto 0);
  signal MAX_CD       : std_logic_vector (n-1 downto 0);

  -- Perpendicular data values
  signal MAX_AB_PERP  : std_logic_vector (n-1 downto 0);
  signal MAX_CD_PERP  : std_logic_vector (n-1 downto 0);

  -- Maximum directions
  signal MAX_DIR_AB   : std_logic_vector (2 downto 0);
  signal MAX_DIR_CD   : std_logic_vector (2 downto 0);

begin 

  -- Find maximum indeces
  maxidx_inst0: entity work.maxidx2(behavioral)
    generic map (n)
    port map(A, B, MAX_IDX_AB);

  maxidx_inst1: entity work.maxidx2(behavioral)
    generic map (n)
    port map(C, D, MAX_IDX_CD);

  maxidx_inst2: entity work.maxidx2(behavioral)
    generic map (n)
    port map(MAX_AB, MAX_CD, MAX_IDX_ABCD);

  -- Get maximum data values
  mux_inst0: entity work.mux2(behavioral) 
    generic map (n)
    port map(A, B, MAX_IDX_AB, MAX_AB);

  mux_inst1: entity work.mux2(behavioral) 
    generic map (n)
    port map(C, D, MAX_IDX_CD, MAX_CD);

  mux_inst2: entity work.mux2(behavioral) 
    generic map (n)
    port map(MAX_AB, MAX_CD, MAX_IDX_ABCD, MAX_VALUE);

  -- Get inversion of AB and CD indeces (for perpendicular)
  NOT_MAX_IDX_AB <= not MAX_IDX_AB;
  NOT_MAX_IDX_CD <= not MAX_IDX_CD;

  -- Get perpendicular data value
  mux_inst3: entity work.mux2(behavioral) 
    generic map (n)
    port map(A, B, NOT_MAX_IDX_AB, MAX_AB_PERP);

  mux_inst4: entity work.mux2(behavioral) 
    generic map (n)
    port map(C, D, NOT_MAX_IDX_CD, MAX_CD_PERP);

  mux_inst5: entity work.mux2(behavioral) 
    generic map (n)
    port map(MAX_AB_PERP, MAX_CD_PERP, MAX_IDX_ABCD, MAX_PERPENDICLUAR);

  -- Get maximum edge direction
  mux_inst6: entity work.mux2(behavioral) 
    generic map (n => 3)
    port map(A_DIR, B_DIR, MAX_IDX_AB, MAX_DIR_AB);
    
  mux_inst7: entity work.mux2(behavioral) 
    generic map (n => 3)
    port map(C_DIR, D_DIR, MAX_IDX_CD, MAX_DIR_CD);

  mux_inst8: entity work.mux2(behavioral) 
    generic map (n => 3)
    port map(MAX_DIR_AB, MAX_DIR_CD, MAX_IDX_ABCD, MAX_DIRECTION); 


end behavioral;

