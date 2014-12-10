--------------------------------------------------------------------------------
-- timed_signal: Creates a 0 signal for a specified number of clocks plus one
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------

entity timed_signal is

  generic(size : integer := 32);

  port(signal_time : in  std_logic_vector(size-1 downto 0);
     start       : in  std_logic;
     clock       : in  std_logic;
     finished    : out std_logic);

end timed_signal;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------

architecture behavioral of timed_signal is
  signal time_remaining : std_logic_vector(size-1 downto 0);
begin

  process(clock, start, signal_time)
  begin

    if(start = '1') then
      time_remaining <= signal_time;
      finished <= '0';
    elsif(clock'event and clock='1') then
      
      -- By default the timing should be finished
      finished <= '1';

      -- If we have not underflowed, set to unfinished
      if(time_remaining(size-1) = '0') then
        finished       <= '0';
        time_remaining <= std_logic_vector(unsigned(time_remaining) - 1);
      end if;
    end if;

  end process;

end behavioral;