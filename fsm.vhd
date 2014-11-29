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
           i_clock, i_valid, i_reset : in std_logic;   -- input clock, is input valid?, reset signal
           i_pixel: in std_logic_vector(7 downto 0);   -- 8-bit input
           o_edge, o_valid : out std_logic;            -- 1-bit output for edge, is output valid?
           o_dir: out std_logic_vector(2 downto 0);    -- 3-bit output for direction
           o_mode: out std_logic_vector(1 downto 0)    -- 2-bit output for mode
           );
end fsm;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of fsm is

  type state_type is (reset, idle, busy, finished);
  -- reset    : The reset signal has been set
  -- idle     : The circuit is doing nothing (ready to calculate)
  -- busy     : The sobel edge detection is being calculated 
  -- finished : The calculated been has finished successfully   

  signal state : state_type; 
  signal o_mode_sig : std_logic;

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
            state <= busy;                  -- current state is busy
          end if;
        when idle =>                        -- when idle mode
          if (i_valid = '1') then           -- if input is valid
            state <= busy;                  -- current state is busy
          end if;
        when busy =>                        -- when busy mode
          if (o_mode_sig = '1') then        -- if data output is ready
            state <= finished;              -- current state is finished
          end if;
        when finished =>                    -- when finished
          state <= finished;                -- current state is idle
      end case;
    end if;
  end process;

  fsm_outputs: process(state) 
  begin
    case state is

      -- Reset all outputs
      when reset =>
        o_edge  <= '0';
        o_valid <= '0';
        o_dir   <= "000";
        o_mode <= "01";

      -- Set output mode to idle so external modules can make a new request
      when idle =>
        o_mode <= "10";

      -- Set output mode to busy so external modules cannot make a request
      when busy =>
        o_mode <= "11";

      -- Set all outputs to be calculated values
      when finished =>
        o_edge  <= '0';
        o_valid <= '0';
        o_dir   <= "000";
        o_mode  <= "11";

    end case;
  end process;
  
end behavioral;
