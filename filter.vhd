--------------------------------------------------------------------------------
-- filter: Implements sobel filtering using a sobel filtering circuit and a 
---        finite state machine for control
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity filter is
  port (
       T00, T01, T02, T10, T11, T12, T20, T21, T22: in std_logic_vector(7 downto 0); -- Pixel inputs
       CLOCK     : in std_logic;                                                     -- Clock signal
       I_VALID   : in std_logic;                                                     -- If the input is valid
       RESET     : in std_logic;                                                     -- If we should reset everything
       THRESHOLD : in std_logic_vector(10 downto 0);                                 -- Edge Threshold for sobel
       READY     : out std_logic;                                                    -- If the circuit is ready for input
       O_VALID   : out std_logic;                                                    -- If the output is valid
       EDGE      : out std_logic;                                                    -- If there is an edge
       DIRECTION : out std_logic_vector(2 downto 0)                                  -- Max derivative direction
       );
end filter;


--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of filter is
begin 

  sobel_inst : entity work.sobel(behavioral)
    port map(T00, T01, T02, T10, T11, T12, T20, T21, T22, THRESHOLD, EDGE, DIRECTION);

  fsm_inst : entity work.fsm(behavioral)
    port map(i_clock  => CLOCK,
             i_valid  => I_VALID, 
             i_reset  => RESET, 
             o_valid  => O_VALID,
             o_ready  => READY);

end behavioral;



