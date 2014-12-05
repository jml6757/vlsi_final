-------------------------------------------------------------------------------
-- tb_filter: Tests the edge detection for an inputed file
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  tb_filter is
end tb_filter;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture tb of tb_filter is
  signal T00, T01, T02, T10, T11, T12, T20, T21, T22 : std_logic_vector(7 downto 0);
  signal CLOCK     : std_logic;
  signal I_VALID   : std_logic;
  signal RESET     : std_logic;
  signal READY     : std_logic;
  signal O_VALID   : std_logic;
  signal EDGE      : std_logic;
  signal DIRECTION : std_logic_vector(2 downto 0);
  
  shared variable row : integer := 1;
  shared variable col : integer := 1;
  
  type timage is array( 1 to 300, 1 to 300 ) of integer range 0 to 255;
  file inFile : TEXT open READ_MODE is "test1.pgm";
  file outFile : TEXT open WRITE_MODE is "photographerEdged.pgm";

  shared variable inimage, outimage : timage;
  shared variable line1, line2, line3, line4 : line;
  signal readdone, procdone : boolean := false;
  signal clk : std_logic := '0';
begin 

U1: entity work.filter(behavioral)
  port map(T00, T01, T02, T10, T11, T12, T20, T21, T22, CLOCK, I_VALID, RESET, READY, O_VALID, EDGE, DIRECTION);

test_process: process
  variable tempLine : line;
  variable pixel : integer; 
  variable status : boolean;

begin
  RESET <= '1';
  wait for 5 ns;
  RESET <= '0';
  --read  file
  while not endfile( inFile ) loop
    --get line
    readline( inFile, tempLine );
    status := true;
    while (status = true) loop     --checks for end of line
      --read pixels from line
      read( tempLine, pixel, status );
      if (status = true) then
        inimage(row,col) := pixel; -- Stores all pixels of the image
        if ( col = 255 ) then
          col := 1;
          row := row + 1;
        else
          col := col + 1;
        end if;
      end if;
    end loop;
  end loop;
  
  col := 2;
  row := 2;
  readdone <= true;
  wait;
end process;

image_proc1: process
begin
  wait until CLOCK'event and CLOCK = '1';
  if (readdone = true) then
  if (READY = '1') then  
    if ( col = 255 ) then          -- gets every pixel in the column then moves to a new row
      col := 2;
      row := row + 1;
    else
      col := col + 1;
    end if;
    
    --flip of image
    if row <= 254 then
      if col <= 254 then
        t00 <= std_logic_vector(to_unsigned(inimage(row-1,col-1), 8));
        t01 <= std_logic_vector(to_unsigned(inimage(row-1,col), 8));
        t02 <= std_logic_vector(to_unsigned(inimage(row-1,col+1), 8));
        t10 <= std_logic_vector(to_unsigned(inimage(row,col-1), 8));
        t11 <= std_logic_vector(to_unsigned(inimage(row,col), 8));
        t12 <= std_logic_vector(to_unsigned(inimage(row,col+1), 8));
        t20 <= std_logic_vector(to_unsigned(inimage(row+1,col-1), 8));
        t21 <= std_logic_vector(to_unsigned(inimage(row+1,col), 8));
        t22 <= std_logic_vector(to_unsigned(inimage(row+1,col+1), 8));
        I_VALID <= '1';
        WAIT for 10 ns;
        I_VALID <= '0';
        wait for 10 ns;
      end if;
    end if;

  end if;
  end if;
  if (row = 254 and col = 254) then
    procdone <= true;
  end if;
  
end process;

clock_proc: process
  begin
    clk <= not clk;
    wait for 5 ns;
end process;

CLOCK <= clk;

edge_detect: process(O_VALID)
begin
  if(O_VALID = '1') then
    outimage(row,col) := 255;
  end if;  
end process;

writing1: process
variable lineout : line;

begin

  wait until procdone = true;

for row in 1 to 256 loop
  for col in 1 to 256 loop

    write( lineout, outimage(row, col) );
    write( lineout, ' ' );
  
  end loop;

  writeline( outfile, lineout );
end loop;
wait;
end process;
end tb;
