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
           i_clock : in std_logic;                  -- input clock
           i_valid : in std_logic;                  -- if pixel inputs are valid
           i_reset : in std_logic;                  -- reset state machine
           o_valid : out std_logic;                 -- if output value is valid
           o_ready : out std_logic                  -- if ready for input
           );
end fsm;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of fsm is

  type state_type is (reset, idle, busyOne, busyTwo, finished);
  -- reset    : The reset signal has been set
  -- idle     : The circuit is doing nothing (ready to calculate)
  -- busyOne  : The sobel edge detection is being calculated 
  -- busyTwo  : Busy state for filter processor completion
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
          state <= idle;                  -- current state is idle
          
        when idle =>                        -- when idle mode
          if (i_valid = '1') then           -- if input is valid
            state <= busyOne;                 -- current state is start
          end if;
          
        when busyOne =>                      -- when busyOne mode
          state <= busyTwo;                 -- current state is finished
          
        when busyTwo =>
          state <= finished;
        
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

      -- Circuit is ready for input
      when idle =>
        o_ready <= '1';
        o_valid <= '0';
        
      -- Let counter run, circuit not ready, and invalid output
      when busyOne =>
        o_ready <= '0';
        o_valid <= '0';
        
      -- Let counter run, wait cycle
      when busyTwo =>
        o_ready <= '0';
        o_valid <= '0';
        
      -- Not ready, but output is now valid
      when finished =>
        o_ready <= '0';
        o_valid <= '1';

    end case;
  end process;
  
end behavioral;
