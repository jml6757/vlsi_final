--------------------------------------------------------------------------------
-- fsm: The finite state machine that controls how the circuit functions. This
--      coordinates all of the timing between components.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; 

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity fsm is
  port    (
           i_busy  : in std_logic;                  -- if curcuit is currently calculating (timer not finished)
           i_clock : in std_logic;                  -- input clock
           i_valid : in std_logic;                  -- if pixel inputs are valid
           i_reset : in std_logic;                  -- reset state machine
           o_start : out std_logic;                 -- start timer signal
           o_valid : out std_logic;                 -- if output value is valid
           o_ready : out std_logic                  -- if ready for input
           );
end fsm;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of fsm is

  type state_type is (reset, idle, busy, start, finished);
  -- reset    : The reset signal has been set
  -- idle     : The circuit is doing nothing (ready to calculate)
  -- busy     : The sobel edge detection is being calculated 
  -- finished : The calculated been has finished successfully   

  signal state : state_type; 

begin

  fsm_transitions: process(i_clock, i_reset)
  begin
    if (i_reset = '1') then
      state <= reset;
      
    elsif (i_clock'event and i_clock = '1') then
      
      case state is
        when reset =>                       -- when reset mode
          if (i_valid = '0') then           -- if input is not valid
            state <= idle;                  -- current state is idle
          else                              -- if input is valid
            state <= start;                  -- current state is busy
          end if;
          
        when idle =>                        -- when idle mode
          if (i_valid = '1') then           -- if input is valid
            state <= start;                 -- current state is start
          end if;
          
        when start =>                       -- when start mode
            state <= busy;                  -- current state is busy
            
        when busy =>                        -- when busy mode
          if (i_busy = '0') then            -- if data output is ready
            state <= finished;              -- current state is finished
          end if;
          
        when finished =>                    -- when finished
          state <= idle;                    -- current state is idle
      end case;
      
    end if;
  end process;

  fsm_outputs: process(state) 
  begin
    case state is

      -- Ensure output is invalid and circuit is not ready
      when reset =>
        o_ready <= '0';
        o_valid <= '0';
        o_start <= '0';

      -- Circuit is ready for input
      when idle =>
        o_ready <= '1';
        
      -- Inform counter to start
      when start =>
        o_start <= '1';
        o_valid <= '0';
        o_ready <= '0';
        
      -- Let counter run, circuit not ready, and invalid output
      when busy =>
        o_start <= '0';
        o_valid <= '0';
        o_ready <= '0';
        
      -- Not ready, but output is now valid
      when finished =>
        o_ready <= '0';
        o_valid <= '1';

    end case;
  end process;
  
end behavioral;
