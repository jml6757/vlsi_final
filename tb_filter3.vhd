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
    generic (n : integer := 8);
end tb_filter3;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture tb of tb_filter3 is
  
    constant clkPeriod : time := 1 ns;
    constant THRESHOLD : std_logic_vector(n+2 downto 0) := std_logic_vector(to_signed(80, n+3));
    
    -- Variables to hold the maximum number of columns and rows in the image
    -- being processed. 
    shared variable im_row : integer := 3;
    shared variable im_col : integer := 3;

    -- Iteration variables for reading and processing image.
    shared variable row : integer := 1;
    shared variable col : integer := 1;

    -- File objects for accessing input and output image files, as well
    -- as variables to hold the images internally. 
    type timage is array( 1 to 3, 1 to 3 ) of integer range 0 to 255;
    file inFile : TEXT open READ_MODE is "images/north.pgm";
    file outFile : TEXT open WRITE_MODE is "images/north_80.pgm";

    shared variable inimage, outimage : timage;
    shared variable line1, line2, line3 : line;

    -- Signals to control Sobel block
    signal T00, T01, T02, T10, T11, T12, T20, T21, T22 : std_logic_vector(n-1 downto 0);
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
        generic map(n)
        port map(T00, T01, T02, T10, T11, T12, T20, T21, T22, CLOCK, I_VALID, RESET, THRESHOLD, READY, O_VALID, EDGE, DIRECTION);

    -- Initialize Filter, Read in Image
    read_process: process
        variable tempLine : line;
        variable pixel : integer; 
        variable status : boolean;
    begin
        RESET <= '1';
        wait for clkPeriod;
        RESET <= '0';
        
        -- Read pgm header
        readline( inFile, line1 );
        readline( inFile, line2 );
        readline( inFile, line3 );

        -- Read pixel content
        while not endfile( inFile ) loop
            
            -- Get a line
            readline( inFile, tempLine );
            status := true;

            -- Check for end of line
            while (status = true) loop   
                -- Read pixels from line
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
  
        col := 2;
        row := 2;
        readdone <= true;

        -- Halt forever
        wait;

    end process;

    -- Apply Filter to Image
    image_process: process
    begin
       
        wait until CLOCK'event and CLOCK = '1';
        
        if (readdone = true and procdone = false) then
            if (READY = '1') then

                -- Input pixel values to the filter
                t00 <= std_logic_vector(to_unsigned(inimage(row-1,col-1), n));
                t01 <= std_logic_vector(to_unsigned(inimage(row-1,col),   n));
                t02 <= std_logic_vector(to_unsigned(inimage(row-1,col+1), n));
                t10 <= std_logic_vector(to_unsigned(inimage(row,col-1),   n));
                t11 <= std_logic_vector(to_unsigned(inimage(row,col),     n));
                t12 <= std_logic_vector(to_unsigned(inimage(row,col+1),   n));
                t20 <= std_logic_vector(to_unsigned(inimage(row+1,col-1), n));
                t21 <= std_logic_vector(to_unsigned(inimage(row+1,col),   n));
                t22 <= std_logic_vector(to_unsigned(inimage(row+1,col+1), n));
                
                -- Set input valid signal to trigger filter state machine
                I_VALID <= '1';
                wait for 3 * clkPeriod;  
                I_VALID <= '0';
                
                -- Halt forever
                wait;

            end if;
        end if;
  
    end process;


    --Clock Process
    clock_process: process
    begin
        clk <= not clk;
        wait for clkPeriod;
    end process;

    CLOCK <= clk;


    -- Sets pixels on an edge to white, all others will be black
    edge_process: process(O_VALID)
    begin
        if(O_VALID = '1') then
            
            -- Write the edge if necessary
            if(EDGE = '1') then
                outimage(row,col) := 255;
            end if; 
            
            -- Signal that procedure is finished 
            procdone <= true;

        end if;  
    end process;


-- Write filtered image to output file
    write_process: process
        variable lineout : line;
    begin

        wait until procdone = true;

        -- Write pgm header
        writeline( outfile, line1 );
        writeline( outfile, line2 );
        writeline( outfile, line3 );

        -- Write pixel content
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