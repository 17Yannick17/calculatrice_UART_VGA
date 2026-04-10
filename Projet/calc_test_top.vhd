library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity calc_test_top is
    Port(
        CLOCK_50 : in  STD_LOGIC;
        RESET_N  : in  STD_LOGIC;                          -- bouton/switch reset actif bas
        UART_RX  : in  STD_LOGIC;
        SW       : in  STD_LOGIC_VECTOR(1 downto 0);      -- sélection affichage
        LEDR     : out STD_LOGIC_VECTOR(9 downto 0)
    );
end calc_test_top;

architecture Behavioral of calc_test_top is

    -- UART -> controller
    signal rx_data_s    : std_logic_vector(7 downto 0);
    signal rx_valid_s   : std_logic;

    -- controller -> cpu
    signal cpu_din_s    : std_logic_vector(8 downto 0);
    signal cpu_run_s    : std_logic;

    -- cpu -> controller
    signal cpu_bus_s    : std_logic_vector(8 downto 0);
    signal cpu_done_s   : std_logic;
    signal cpu_neg_s    : std_logic;

    -- debug controller
    signal operand1_s   : std_logic_vector(8 downto 0);
    signal operand2_s   : std_logic_vector(8 downto 0);
    signal result_s     : std_logic_vector(8 downto 0);
    signal operator_s   : std_logic_vector(7 downto 0);
    signal result_valid_s : std_logic;
    signal busy_s       : std_logic;
    signal neg_s        : std_logic;
    signal div0_s       : std_logic;

    signal display_s    : std_logic_vector(8 downto 0);
    signal reset_s      : std_logic;

begin

    reset_s <= not RESET_N;

    --------------------------------------------------------------------
    -- UART
    --------------------------------------------------------------------
    U_UART : entity work.UART
        port map(
            clock_50 => CLOCK_50,
            rx       => UART_RX,
            rx_data  => rx_data_s,
            rx_valid => rx_valid_s
        );

    --------------------------------------------------------------------
    -- CONTROLLER
    --------------------------------------------------------------------
    U_CTRL : entity work.controller
        port map(
            clk          => CLOCK_50,
            reset        => reset_s,
            rx_data      => rx_data_s,
            rx_valid     => rx_valid_s,

            cpu_din      => cpu_din_s,
            cpu_run      => cpu_run_s,

            cpu_bus      => cpu_bus_s,
            cpu_done     => cpu_done_s,

            operand1_o   => operand1_s,
            operand2_o   => operand2_s,
            result_o     => result_s,
            operator_o   => operator_s,
            result_valid => result_valid_s,
            busy         => busy_s,
            neg_o        => neg_s,
            div0_o       => div0_s
        );

    --------------------------------------------------------------------
    -- CPU
    --------------------------------------------------------------------
    U_CPU : entity work.cpu
        port map(
            clk   => CLOCK_50,
            reset => reset_s,
            run   => cpu_run_s,
            DIN   => cpu_din_s,
            Bus_o => cpu_bus_s,
            done  => cpu_done_s,
            NEG   => cpu_neg_s
        );

    --------------------------------------------------------------------
    -- Sélection de l'affichage
    -- SW="00" -> operand1
    -- SW="01" -> operand2
    -- SW="10" -> result
    -- SW="11" -> cpu_bus
    --------------------------------------------------------------------
    with SW select
        display_s <= operand1_s when "00",
                     operand2_s when "01",
                     result_s   when "10",
                     cpu_bus_s  when others;

    --------------------------------------------------------------------
    -- LEDs
    -- LEDR(5 downto 0) : valeur sélectionnée (6 bits faibles)
    -- LEDR(6)          : div0
    -- LEDR(7)          : neg
    -- LEDR(8)          : busy
    -- LEDR(9)          : result_valid
    --------------------------------------------------------------------
    LEDR(5 downto 0) <= display_s(5 downto 0);
    LEDR(6)          <= div0_s;
    LEDR(7)          <= neg_s;
    LEDR(8)          <= busy_s;
    LEDR(9)          <= result_valid_s;

end Behavioral;