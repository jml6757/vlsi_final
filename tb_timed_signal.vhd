--------------------------------------------------------------------------------
-- tb_timed_signal: Timed signal testbench
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------

entity tb_timed_signal is
  generic(size : integer := 32);
end tb_timed_signal;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------

architecture tb of tb_timed_signal is

  signal   signal_time : std_logic_vector(size-1 downto 0);
  signal   start       : std_logic := '0';
  signal   clock       : std_logic := '0';
  signal   finished    : std_logic;

begin

  timed_signal_inst : entity work.timed_signal(behavioral)
    port map(signal_time => signal_time,
             start       => start,
             clock       => clock,
             finished    => finished);

  clock_process: process
  begin
    clock <= not clock;
    wait for 0.5 ns;
  end process;

  -- Set clock signal time
  signal_time <= std_logic_vector(to_signed(4, size)); 

  test_process: process
  begin

    -- Let circuit reset
    wait for 5 ns;

    -- Set start signal
    start <= '1';
    wait for 5 ns;

    -- Unset start signal
    start <= '0';
    wait;

  end process;

end tb;