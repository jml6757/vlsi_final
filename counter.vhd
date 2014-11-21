library ieee;
use ieee.std_logic_1164.all; 
use IEEE.NUMERIC_STD.all;

-------------------------------------------------
-- Entity
-------------------------------------------------

entity counter is
  generic (n : integer := 4);
	port    (
	         clock, start, reset : in std_logic;   -- input clock, start count signal, reset signal
	         maxValue: in std_logic_vector(n-1 downto 0);   -- n-bit value for final count value
	         countOver: out std_logic  --0 when still counting/idle, 1 when count at maxValue
	         );
end entity;

-------------------------------------------------
-- Architecture
-------------------------------------------------
architecture behavior of counter is
SIGNAL countEnable: std_logic := '0';
SIGNAL count : std_logic_vector(n-1 downto 0);
begin
  
  process(clock, reset, start)
    begin
      
      if (start'EVENT AND start = '1' AND countEnable = '0') then 
        countEnable <= '1';
      end if;
      
      -- Reset internal count and countOver output
      if (reset = '1') then
        count <= std_logic_vector(to_unsigned(0, n));
        countOver <= '0';
        
      -- Clear the output and the counter enable
      elsif (clock'EVENT AND clock = '1' AND count = maxValue) then
        countOver <= '0'; 
        countEnable <= '0';
        
      -- Increment count on the clock edge
      elsif (clock'EVENT AND clock = '1' AND countEnable = '1') then
        count <= std_logic_vector(unsigned(count) + to_unsigned(1, n));
        
        -- Notify that count is over when the counter hits the maximum value
        --Probably can just use count and not(maxValue)
        if (count = maxValue) then
          countOver <= '1';
        end if;
      end if; 
  end process;
  

end behavior;