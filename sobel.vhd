--------------------------------------------------------------------------------
-- sobel: Implements sobel filtering with combinatorial logic. Takes in a set
--        of 9 pixels and outputs whether there is an edge there and which
--        direction it is in. Pixels are laid out according to the following
--        diagram:
--
--        -------------------
--        | T00 | T01 | T02 |
--        -------------------
--        | T10 | T11 | T12 |
--        -------------------
--        | T20 | T21 | T22 |
--        -------------------
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
-- Entity
--------------------------------------------------------------------------------
entity sobel is
  generic (n : integer := 8);
  port    (
           T00, T01, T02, T10, T11, T12, T20, T21, T22: in std_logic_vector(n-1 downto 0); -- Pixel inputs
           EDGE_THRESHOLD: in std_logic_vector(n+2 downto 0);                              -- Edge Threshold
           EDGE: out std_logic;                                                            -- If there is an edge
           DIRECTION: out std_logic_vector(2 downto 0)                                     -- Max derivative direction
           );
end sobel;

--------------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------------
architecture behavioral of sobel is

  -- Constant direction vectors
  constant DIR_E  : std_logic_vector(2 downto 0) := "000";
  constant DIR_W  : std_logic_vector(2 downto 0) := "001";
  constant DIR_N  : std_logic_vector(2 downto 0) := "010";
  constant DIR_S  : std_logic_vector(2 downto 0) := "011";
  constant DIR_NW : std_logic_vector(2 downto 0) := "100";
  constant DIR_SE : std_logic_vector(2 downto 0) := "101";
  constant DIR_NE : std_logic_vector(2 downto 0) := "110";
  constant DIR_SW : std_logic_vector(2 downto 0) := "111";

  -- Derivative output values
  signal deriv_out_NE_SW : std_logic_vector(n+1 downto 0);
  signal deriv_out_N_S   : std_logic_vector(n+1 downto 0);
  signal deriv_out_E_W   : std_logic_vector(n+1 downto 0);
  signal deriv_out_NW_SE : std_logic_vector(n+1 downto 0);

  -- Derivative output directions
  signal deriv_dir_NE_SW : std_logic_vector(2 downto 0);
  signal deriv_dir_N_S   : std_logic_vector(2 downto 0);
  signal deriv_dir_E_W   : std_logic_vector(2 downto 0);
  signal deriv_dir_NW_SE : std_logic_vector(2 downto 0);

  -- Maximum derivative output
  signal MAX_DIRECTION     : std_logic_vector(2 downto 0);
  signal MAX_DERIVATIVE    : std_logic_vector(n+1 downto 0);
  signal MAX_PERPENDICULAR : std_logic_vector(n+1 downto 0);
  signal SHIFTED_PERPENDICULAR : std_logic_vector(n+1 downto 0);

  -- The calculated data for thresholding
  signal EDGE_VALUE : std_logic_vector(n+2 downto 0);

begin

  -- Get derivatives of each direction
  deriv_NE_SW: entity work.derivative(behavioral)
    generic map(n)
    port map(T01, T02, T12, T10, T20, T21, DIR_NE, DIR_SW, deriv_out_NE_SW, deriv_dir_NE_SW);

  deriv_N_S:   entity work.derivative(behavioral)
    generic map(n)
    port map(T00, T01, T02, T20, T21, T22, DIR_N, DIR_S, deriv_out_N_S, deriv_dir_N_S);

  deriv_E_W:   entity work.derivative(behavioral)
    generic map(n)
    port map(T02, T12, T22, T00, T10, T20, DIR_E, DIR_W, deriv_out_E_W, deriv_dir_E_W);

  deriv_NW_SE: entity work.derivative(behavioral)
    generic map(n)
    port map(T10, T00, T01, T21, T22, T12, DIR_NW, DIR_SE, deriv_out_NW_SE, deriv_dir_NW_SE);

  -- Determine maximum derivative
  maximum: entity work.max4(behavioral)
    generic map(n+2)
    port map(deriv_out_NE_SW, deriv_dir_NE_SW,
             deriv_out_N_S, deriv_dir_N_S,
             deriv_out_E_W, deriv_dir_E_W,
             deriv_out_NW_SE, deriv_dir_NW_SE,
             MAX_DIRECTION, MAX_DERIVATIVE, MAX_PERPENDICULAR);



  -- Determine if there is an edge if:
  -- (max_derivative + (max_perpendicular/8)) > threshold

  -- Shift perpendicular right by 3 to divide by 8
  SHIFTED_PERPENDICULAR <= "000" & MAX_PERPENDICULAR(n+1 downto 3);

  -- Add derivative and shifted perpendicular
  adder_cla : entity work.cla(structural)
		generic map(n+2)
		port map   (MAX_DERIVATIVE, SHIFTED_PERPENDICULAR, '0', EDGE_VALUE);

  -- Compare final edge value to threshold value to determine if there is an edge
  process(EDGE_VALUE)
  begin
    if(EDGE_VALUE > EDGE_THRESHOLD) then
      EDGE <= '1';
      DIRECTION <= MAX_DIRECTION;
    else
      EDGE <= '0';
      DIRECTION <= "000";
    end if;
  end process;

end behavioral;