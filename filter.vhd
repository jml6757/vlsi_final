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
  constant timer_size : integer := 8;
  signal   timer_count      : std_logic_vector(timer_size-1 downto 0);
  signal   timer_start     : std_logic := '0';
  signal   timer_finished  : std_logic;
  signal   timer_busy      : std_logic;
begin 

  -- Create timer, sobel combinatorial logic, and state machine
  timed_signal_inst : entity work.timed_signal(behavioral)
    generic map (size => timer_size)
    port map(signal_time => timer_count,
             start       => timer_start,
             clock       => CLOCK,
             finished    => timer_finished);
             
  timer_busy <= not timer_finished;

  sobel_inst : entity work.sobel(behavioral)
    port map(T00, T01, T02, T10, T11, T12, T20, T21, T22, EDGE, DIRECTION);

  fsm_inst : entity work.fsm(behavioral)
    port map(i_busy  => timer_busy,
             i_clock  => CLOCK,
             i_valid  => I_VALID, 
             i_reset  => RESET,
             o_start  => timer_start, 
             o_valid  => O_VALID,
             o_ready  => READY);

  -- Set the specified number of clocks to wait for calculation time (5)
  timer_count <= std_logic_vector(to_signed(4, timer_size));

end behavioral;



