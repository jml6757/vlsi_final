library ieee;
use ieee.std_logic_1164.all; 
use IEEE.std_logic_arith.all; 

-------------------------------------------------
-- Entity
-------------------------------------------------

entity machine is
	port    (
	         i_clock, i_valid, i_reset : in std_logic;   -- input clock, is input valid?, reset signal
	         i_pixel: in std_logic_vector(7 downto 0);   -- 8-bit input
	         o_edge, o_valid : out std_logic;            -- 1-bit output for edge, is output valid?
	         o_dir: out std_logic_vector(2 downto 0);    -- 3-bit output for direction
	         o_mode: out std_logic_vector(1 downto 0)    -- 2-bit output for mode
	         );
end entity;

-------------------------------------------------
-- Architecture
-------------------------------------------------

architecture behavior of machine is
TYPE STATE_TYPE IS (reset, idle ,busy );
SIGNAL state : STATE_TYPE; 
signal o_mode_sig : std_logic;

begin
  process(state) 
    begin
    case state is
      when reset =>
        o_mode <= "01";
      when idle =>
        o_mode <= "10";
      when busy =>
        o_mode <= "11";
    end case;
  end process;

process(i_clock, i_valid, i_reset)
  begin
  if (i_clock'EVENT AND i_valid = '1') then
      
  end if;
end process;


process(i_clock, i_reset)
  begin
    if (i_reset = '1') then
      state <= reset;
    elsif (i_clock'EVENT AND i_clock = '1') then
      case state is
        when reset =>                       -- When Reset Mode
          if (i_valid = '0') then           -- If input is not valid
            state <= idle;                  -- Current state is IDLE
          else                              -- Else input is valid
            state <= busy;                  -- Current state is BUSY
          end if;
        when idle =>                        -- When Idle Mode
          if (i_valid = '1') then           -- If input is not valid
            state <= busy;                  -- Current state is BUSY
          end if;
        when busy =>                        -- When Busy Mode
          if (o_mode_sig = '1') then        -- If output mode is 1
            state <= idle;                  -- Current State is IDLE
          end if;  
      end case;
    end if;
end process;

end behavior;
