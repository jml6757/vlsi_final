-------------------------------------------------------------------------------
-- tb_filter: Tests the edge detection for 3x3 sized inputed file
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity  tb_filter3 is
end tb_filter3;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture tb of tb_filter3 is
  
    constant clkPeriod : time := 1 ns;
    constant THRESHOLD : std_logic_vector(12 downto 0) := std_logic_vector(to_signed(80, 13));
    
    -- Variables to hold the maximum number of columns and rows in the image
    -- being processed. 
    shared variable im_row : integer := 3;
    shared variable im_col : integer := 3;

    -- Iteration variables for reading and processing image.
    shared variable row : integer := 1;
    shared variable col : integer := 1;

    -- File objects for accessing input and output image files, as well
    -- as variables to hold the images internally. 
    type timage is array( 1 to 4, 1 to 4 ) of integer range 0 to 255;
    file inFile : TEXT open READ_MODE is "images/test2.pgm";
    file outFile : TEXT open WRITE_MODE is "images/test2_80.pgm";

    shared variable inimage, outimage : timage;

    -- Signals to control Sobel block
    signal T00, T01, T02, T10, T11, T12, T20, T21, T22 : std_logic_vector(7 downto 0);
    signal CLOCK     : std_logic;
    signal I_VALID   : std_logic := '0';
    signal RESET     : std_logic;
    signal READY     : std_logic;
    signal O_VALID   : std_logic;
    signal EDGE      : std_logic;
    signal DIRECTION : std_logic_vector(2 downto 0);

    -- Required internal signals. 
    signal readdone, procdone : boolean := false;
    signal clk : std_logic := '0';
  
begin 

    U1: entity work.filter(behavioral)
        port map(T00, T01, T02, T10, T11, T12, T20, T21, T22, CLOCK, I_VALID, RESET, THRESHOLD, READY, O_VALID, EDGE, DIRECTION);

    -- Initialize Filter, Read in Image
    test_process: process
        variable tempLine : line;
        variable pixel : integer; 
        variable status : boolean;

    begin
        RESET <= '1';
        wait for clkPeriod;
        RESET <= '0';
        
        --read  file
        while not endfile( inFile ) loop
            --get line
            readline( inFile, tempLine );
            status := true;

            --check for end of line
            while (status = true) loop   

                --read pixels from line
                read( tempLine, pixel, status );
                if (status = true) then

                    -- Stores all pixels of the imagez
                    inimage(row,col) := pixel; 
                    if ( col = im_col ) then 
                        col := 1;
                        row := row + 1;
                    else
                        col := col + 1;
                    end if;
                end if;
            end loop;
        end loop;
  
        col := 1;
        row := 2;
        readdone <= true;
        wait;
    end process;

    -- Apply Filter to Image
    image_proc1: process
    begin
       
        wait until CLOCK'event and CLOCK = '1';
        
        if (readdone = true and row < im_row) then
            if (READY = '1') then  

                -- gets every pixel in the column then moves to a new row
                if ( col = im_col ) then          
                    col := 2;
                    row := row + 1;
                else
                    col := col + 1;
                end if;
    
                if row <= im_row-1 then
                    if col <= im_col-1 then
                        -- Load in 3x3 pixel map.
                        t00 <= std_logic_vector(to_unsigned(inimage(row-1,col-1), 8));
                        t01 <= std_logic_vector(to_unsigned(inimage(row-1,col), 8));
                        t02 <= std_logic_vector(to_unsigned(inimage(row-1,col+1), 8));
                        t10 <= std_logic_vector(to_unsigned(inimage(row,col-1), 8));
                        t11 <= std_logic_vector(to_unsigned(inimage(row,col), 8));
                        t12 <= std_logic_vector(to_unsigned(inimage(row,col+1), 8));
                        t20 <= std_logic_vector(to_unsigned(inimage(row+1,col-1), 8));
                        t21 <= std_logic_vector(to_unsigned(inimage(row+1,col), 8));
                        t22 <= std_logic_vector(to_unsigned(inimage(row+1,col+1), 8));

                        -- Set input valid signal to trigger filter
                        I_VALID <= '1';
                        -- Wait long enough for State machine to detect I_Valid on a clock edge.
                        WAIT for 3 * clkPeriod;  
                        I_VALID <= '0';
                        wait for 2 * clkPeriod;  -- Turn off before next clock edge. 
                    end if;
                end if;

            end if;
        end if;

        -- Notify image output process when complete image has been processed.
        if (row = im_col-1 and col = im_col-1) then
            procdone <= true;
        end if;
  
    end process;


    --Clock Process
    clock_proc: process
    begin
        clk <= not clk;
        wait for clkPeriod;
    end process;

    CLOCK <= clk;


    -- Filter Output Handler 
    -- Sets pixels on an edge to white, all others will be black
    edge_detect: process(O_VALID)
    begin
        if(EDGE = '1' and O_VALID = '1') then
            outimage(row,col) := 255;
        end if;  
    end process;


-- Write filtered image to output file
    writing1: process
        variable lineout : line;
    begin

        wait until procdone = true;

        for row in 1 to im_row loop 
            for col in 1 to im_col loop
                write( lineout, outimage(row, col) );
                write( lineout, ' ' );
            end loop;
            writeline( outfile, lineout );
        end loop;
        wait;
    end process;

end tb;
