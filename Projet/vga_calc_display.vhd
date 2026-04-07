library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Affichage VGA texte de la calculatrice.
-- Le module réécrit en continu la mémoire vidéo pour afficher
-- les valeurs issues du contrôleur : opérandes, opérateur et résultat.
entity vga_calc_display is
    port(
        clock, reset  : in std_logic;
        operand1      : in std_logic_vector(8 downto 0);
        operand2      : in std_logic_vector(8 downto 0);
        result        : in std_logic_vector(8 downto 0);
        operator_ascii: in std_logic_vector(7 downto 0);
        result_valid  : in std_logic;
        busy          : in std_logic;
        neg           : in std_logic;
        div0          : in std_logic;

        VGA_R, VGA_G, VGA_B : out std_logic_vector(3 downto 0);
        VGA_HS, VGA_VS      : out std_logic
    );
end vga_calc_display;

architecture rtl of vga_calc_display is
    constant screen_width  : integer := 80;
    constant screen_height : integer := 60;

    subtype char7_t is std_logic_vector(6 downto 0);

    signal mem_in, mem_out : char7_t := (others => '0');
    signal mem_adr         : std_logic_vector(12 downto 0);
    signal mem_wr          : std_logic := '0';
    signal x               : unsigned(6 downto 0) := (others => '0');
    signal y               : unsigned(5 downto 0) := (others => '0');

    type state_t is (clean0, clean1, clean2, clean3, done);
    signal sv : state_t := clean0;

    function char7(c : character) return char7_t is
    begin
        return std_logic_vector(to_unsigned(character'pos(c), 7));
    end function;

    function digit_char(d : natural) return char7_t is
    begin
        return std_logic_vector(to_unsigned(48 + d, 7)); -- '0' + d
    end function;

    function dec3_char(value : std_logic_vector(8 downto 0); idx : natural) return char7_t is
        variable n : natural := to_integer(unsigned(value));
        variable d : natural := 0;
    begin
        case idx is
            when 0 => d := (n / 100) mod 10;
            when 1 => d := (n / 10) mod 10;
            when others => d := n mod 10;
        end case;
        return digit_char(d);
    end function;

    function op_char(op : std_logic_vector(7 downto 0)) return char7_t is
    begin
        case op is
            when x"2B" => return char7('+');
            when x"2D" => return char7('-');
            when x"2A" => return char7('*');
            when x"2F" => return char7('/');
            when x"73" => return char7('S'); -- square
            when x"63" => return char7('C'); -- cube
            when others => return char7('?');
        end case;
    end function;

    function unary_op(op : std_logic_vector(7 downto 0)) return boolean is
    begin
        return (op = x"73") or (op = x"63");
    end function;

begin
    vga_ui : entity work.vga_font
        port map(
            clock   => clock,
            reset   => reset,
            mem_adr => mem_adr,
            mem_out => mem_out,
            mem_in  => mem_in,
            mem_wr  => mem_wr,
            vga_hs  => VGA_HS,
            vga_vs  => VGA_VS,
            r       => VGA_R,
            g       => VGA_G,
            b       => VGA_B
        );

    mem_adr <= std_logic_vector(y) & std_logic_vector(x);

    screen_writer : process(clock, reset)
    begin
        if reset = '1' then
            mem_wr <= '0';
            x <= (others => '0');
            y <= (others => '0');
            mem_in <= char7(' ');
            sv <= clean0;

        elsif rising_edge(clock) then
            case sv is
                when clean0 =>
                    mem_wr <= '1';
                    mem_in <= char7(' ');

                    -- Cadre principal et séparations.
                    if ((x >= 4 and x <= 75 and y >= 1 and y <= 38) and
                        (x = 4 or x = 75 or y = 1 or y = 38 or y = 5 or y = 13 or
                         y = 18 or y = 23 or y = 28 or y = 33 or
                         ((x = 22 or x = 40 or x = 58) and y >= 13 and y <= 33) or
                         ((x = 40 or x = 58) and y >= 33 and y <= 38))) then
                        mem_in <= "1111111";

                    -- Titre : CALCULATRICE
                    elsif (y = 3 and x >= 34 and x <= 45) then
                        case to_integer(x) is
                            when 34 => mem_in <= char7('C');
                            when 35 => mem_in <= char7('A');
                            when 36 => mem_in <= char7('L');
                            when 37 => mem_in <= char7('C');
                            when 38 => mem_in <= char7('U');
                            when 39 => mem_in <= char7('L');
                            when 40 => mem_in <= char7('A');
                            when 41 => mem_in <= char7('T');
                            when 42 => mem_in <= char7('R');
                            when 43 => mem_in <= char7('I');
                            when 44 => mem_in <= char7('C');
                            when 45 => mem_in <= char7('E');
                            when others => mem_in <= char7(' ');
                        end case;

                    -- A = value
                    elsif (y = 8 and x = 8) then
                        mem_in <= char7('A');
                    elsif (y = 8 and x = 10) then
                        mem_in <= char7('=');
                    elsif (y = 8 and x >= 12 and x <= 14) then
                        if (operand1 /= "000000000") or (operator_ascii /= x"00") or (busy = '1') or (result_valid = '1') then
                            mem_in <= dec3_char(operand1, to_integer(x) - 12);
                        else
                            mem_in <= char7('?');
                        end if;

                    -- OP = value
                    elsif (y = 8 and x = 31) then
                        mem_in <= char7('O');
                    elsif (y = 8 and x = 32) then
                        mem_in <= char7('P');
                    elsif (y = 8 and x = 34) then
                        mem_in <= char7('=');
                    elsif (y = 8 and x = 36) then
                        if operator_ascii /= x"00" then
                            mem_in <= op_char(operator_ascii);
                        else
                            mem_in <= char7('?');
                        end if;

                    -- B = value
                    elsif (y = 8 and x = 59) then
                        mem_in <= char7('B');
                    elsif (y = 8 and x = 61) then
                        mem_in <= char7('=');
                    elsif (y = 8 and x >= 63 and x <= 65) then
                        if unary_op(operator_ascii) then
                            mem_in <= char7('-');
                        elsif (operand2 /= "000000000") or (result_valid = '1') or (div0 = '1') then
                            mem_in <= dec3_char(operand2, to_integer(x) - 63);
                        else
                            mem_in <= char7('?');
                        end if;

                    -- RESULTAT = value
                    elsif (y = 11 and x >= 24 and x <= 31) then
                        case to_integer(x) is
                            when 24 => mem_in <= char7('R');
                            when 25 => mem_in <= char7('E');
                            when 26 => mem_in <= char7('S');
                            when 27 => mem_in <= char7('U');
                            when 28 => mem_in <= char7('L');
                            when 29 => mem_in <= char7('T');
                            when 30 => mem_in <= char7('A');
                            when 31 => mem_in <= char7('T');
                            when others => mem_in <= char7(' ');
                        end case;
                    elsif (y = 11 and x = 33) then
                        mem_in <= char7('=');
                    elsif (y = 11 and x >= 35 and x <= 38) then
                        if div0 = '1' then
                            case to_integer(x) is
                                when 35 => mem_in <= char7('D');
                                when 36 => mem_in <= char7('I');
                                when 37 => mem_in <= char7('V');
                                when 38 => mem_in <= char7('0');
                                when others => mem_in <= char7(' ');
                            end case;
                        elsif result_valid = '1' then
                            case to_integer(x) is
                                when 35 =>
                                    if neg = '1' then
                                        mem_in <= char7('-');
                                    else
                                        mem_in <= char7(' ');
                                    end if;
                                when 36 => mem_in <= dec3_char(result, 0);
                                when 37 => mem_in <= dec3_char(result, 1);
                                when 38 => mem_in <= dec3_char(result, 2);
                                when others => mem_in <= char7(' ');
                            end case;
                        else
                            mem_in <= char7('?');
                        end if;

                    -- 1re ligne de touches
                    elsif (y = 16 and x = 13) then mem_in <= char7('1');
                    elsif (y = 16 and x = 31) then mem_in <= char7('2');
                    elsif (y = 16 and x = 49) then mem_in <= char7('3');
                    elsif (y = 16 and x = 66) then mem_in <= char7('+');

                    -- 2e ligne de touches
                    elsif (y = 21 and x = 13) then mem_in <= char7('4');
                    elsif (y = 21 and x = 31) then mem_in <= char7('5');
                    elsif (y = 21 and x = 49) then mem_in <= char7('6');
                    elsif (y = 21 and x = 66) then mem_in <= char7('-');

                    -- 3e ligne de touches
                    elsif (y = 26 and x = 13) then mem_in <= char7('7');
                    elsif (y = 26 and x = 31) then mem_in <= char7('8');
                    elsif (y = 26 and x = 49) then mem_in <= char7('9');
                    elsif (y = 26 and x = 66) then mem_in <= char7('*');

                    -- 4e ligne de touches
                    elsif (y = 31 and x >= 11 and x <= 13) then
                        case to_integer(x) is
                            when 11 => mem_in <= char7('A');
                            when 12 => mem_in <= char7('N');
                            when 13 => mem_in <= char7('S');
                            when others => mem_in <= char7(' ');
                        end case;
                    elsif (y = 31 and x = 31) then
                        mem_in <= char7('0');
                    elsif (y = 31 and x >= 48 and x <= 50) then
                        case to_integer(x) is
                            when 48 => mem_in <= char7('X');
                            when 49 => mem_in <= char7('^');
                            when 50 => mem_in <= char7('2');
                            when others => mem_in <= char7(' ');
                        end case;
                    elsif (y = 31 and x = 66) then
                        mem_in <= char7('/');

                    -- Dernière ligne : RESET, X^3 et =
                    elsif (y = 35 and x >= 11 and x <= 15) then
                        case to_integer(x) is
                            when 11 => mem_in <= char7('R');
                            when 12 => mem_in <= char7('E');
                            when 13 => mem_in <= char7('S');
                            when 14 => mem_in <= char7('E');
                            when 15 => mem_in <= char7('T');
                            when others => mem_in <= char7(' ');
                        end case;
                    elsif (y = 35 and x >= 48 and x <= 50) then
                        case to_integer(x) is
                            when 48 => mem_in <= char7('X');
                            when 49 => mem_in <= char7('^');
                            when 50 => mem_in <= char7('3');
                            when others => mem_in <= char7(' ');
                        end case;
                    elsif (y = 35 and x = 66) then
                        mem_in <= char7('=');
                    end if;

                    sv <= clean1;

                when clean1 =>
                    x <= x + 1;
                    sv <= clean2;

                when clean2 =>
                    mem_wr <= '0';
                    if x > screen_width - 1 then
                        x <= to_unsigned(0, x'length);
                        y <= y + 1;
                        sv <= clean3;
                    else
                        sv <= clean0;
                    end if;

                when clean3 =>
                    if y > screen_height - 1 then
                        sv <= done;
                    else
                        sv <= clean0;
                    end if;

                when done =>
                    -- Une fois l'écran initialisé, on recommence afin que
                    -- toute nouvelle valeur du contrôleur soit réécrite à l'écran.
                    x <= (others => '0');
                    y <= (others => '0');
                    sv <= clean0;

                when others =>
                    sv <= clean0;
            end case;
        end if;
    end process;
end rtl;
