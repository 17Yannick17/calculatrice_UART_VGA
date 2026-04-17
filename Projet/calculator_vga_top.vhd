library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Top-level du système complet : UART + contrôleur + CPU + interface VGA.
entity calculator_vga_top is
    port(
        CLOCK_50 : in  std_logic;
        KEY      : in  std_logic_vector(1 downto 0);
        UART_RX  : in  std_logic;

        VGA_R    : out std_logic_vector(3 downto 0);
        VGA_G    : out std_logic_vector(3 downto 0);
        VGA_B    : out std_logic_vector(3 downto 0);
        VGA_HS   : out std_logic;
        VGA_VS   : out std_logic
    );
end calculator_vga_top;

architecture rtl of calculator_vga_top is
    signal reset_s : std_logic;

    signal rx_data_s    : std_logic_vector(7 downto 0);
    signal rx_valid_s   : std_logic;

    signal cpu_din_s    : std_logic_vector(9 downto 0);
    signal cpu_run_s    : std_logic;
    signal cpu_bus_s    : std_logic_vector(9 downto 0);
    signal cpu_done_s   : std_logic;
    signal cpu_neg_s    : std_logic;

    signal operand1_s   : std_logic_vector(9 downto 0);
    signal operand2_s   : std_logic_vector(9 downto 0);
    signal result_s     : std_logic_vector(9 downto 0);
    signal operator_s   : std_logic_vector(7 downto 0);
    signal result_ok_s  : std_logic;
    signal busy_s       : std_logic;
    signal neg_s        : std_logic;
    signal div0_s       : std_logic;
	 
	 signal operand1_neg_s : std_logic;
    signal operand2_neg_s : std_logic;
	 
begin
    -- KEY(0) est actif à 0 sur la carte, on l'inverse pour le reste du design.
    reset_s <= not KEY(0);

    uart_rx_inst : entity work.UART
        port map(
            clock_50 => CLOCK_50,
            rx       => UART_RX,
            rx_data  => rx_data_s,
            rx_valid => rx_valid_s
        );

    cpu_inst : entity work.cpu
        port map(
            clk   => CLOCK_50,
            reset => reset_s,
            run   => cpu_run_s,
            DIN   => cpu_din_s,
            Bus_o => cpu_bus_s,
            done  => cpu_done_s,
            NEG   => cpu_neg_s
        );

    controller_inst : entity work.controller
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
				operand1_neg_o => operand1_neg_s,
				operand2_neg_o => operand2_neg_s,
            result_valid => result_ok_s,
            busy         => busy_s,
            neg_o        => neg_s,
            div0_o       => div0_s
        );

    vga_display_inst : entity work.vga_calc_display
        port map(
            clock         => CLOCK_50,
            reset         => reset_s,
            operand1      => operand1_s,
            operand2      => operand2_s,
            result        => result_s,
            operator_ascii=> operator_s,
            result_valid  => result_ok_s,
            busy          => busy_s,
            neg           => neg_s,
            div0          => div0_s,
				operand1_neg   => operand1_neg_s,
				operand2_neg   => operand2_neg_s,
            VGA_R         => VGA_R,
            VGA_G         => VGA_G,
            VGA_B         => VGA_B,
            VGA_HS        => VGA_HS,
            VGA_VS        => VGA_VS
        );
end rtl;
