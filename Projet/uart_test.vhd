library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_test is
    Port(
        CLOCK_50 : in  STD_LOGIC;
        UART_RX  : in  STD_LOGIC;
        LEDR     : out STD_LOGIC_VECTOR(7 downto 0);
        D1       : out STD_LOGIC
    );
end uart_test;

architecture Behavioral of uart_test is
    signal data_s      : STD_LOGIC_VECTOR(7 downto 0);
    signal valid_s     : STD_LOGIC;
    signal last_data   : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal led_hold    : integer range 0 to 50000000 := 0;
    signal d1_s        : STD_LOGIC := '0';
begin

    U1 : entity work.UART
        port map(
            clock_50 => CLOCK_50,
            rx       => UART_RX,
            rx_data  => data_s,
            rx_valid => valid_s
        );

    process(CLOCK_50)
    begin
        if rising_edge(CLOCK_50) then
            if valid_s = '1' then
                last_data <= data_s;
                led_hold  <= 5000000; -- environ 0.1 s à 50 MHz
                d1_s      <= '1';
            elsif led_hold > 0 then
                led_hold <= led_hold - 1;
                d1_s <= '1';
            else
                d1_s <= '0';
            end if;
        end if;
    end process;

    LEDR <= last_data;
    D1   <= d1_s;

end Behavioral;