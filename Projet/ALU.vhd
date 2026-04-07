library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
    port(
        In1            : in  std_logic_vector(8 downto 0);
        In2            : in  std_logic_vector(8 downto 0);
        operation      : in  std_logic_vector(2 downto 0);
        ResValeurAbs   : out std_logic_vector(8 downto 0);
        NEG, DIV0      : out std_logic
    );
end ALU;

architecture behav of ALU is
begin
    process(all)
        variable a, b   : unsigned(8 downto 0);
        variable temp   : unsigned(26 downto 0);
    begin
        a := unsigned(In1);
        b := unsigned(In2);

        NEG <= '0';
        DIV0 <= '0';
        ResValeurAbs <= (others => '0');

        case operation is
            when "010" =>  -- ADD
                ResValeurAbs <= std_logic_vector(a + b);

            when "011" =>  -- SUB
                if a < b then
                    ResValeurAbs <= std_logic_vector(b - a);
                    NEG <= '1';
                else
                    ResValeurAbs <= std_logic_vector(a - b);
                end if;

            when "100" =>  -- MUL
                temp := resize(a * b, temp'length);
                ResValeurAbs <= std_logic_vector(temp(8 downto 0));

            when "101" =>  -- DIV
                if b = 0 then
                    ResValeurAbs <= (others => '0');
                    DIV0 <= '1';
                else
                    ResValeurAbs <= std_logic_vector(a / b);
                end if;

            when "110" =>  -- POW2
                temp := resize(b * b, temp'length);
                ResValeurAbs <= std_logic_vector(temp(8 downto 0));

            when "111" =>  -- POW3
                temp := to_unsigned(to_integer(b) * to_integer(b) * to_integer(b), temp'length);
                ResValeurAbs <= std_logic_vector(temp(8 downto 0));

            when others =>
                ResValeurAbs <= (others => '0');
        end case;
    end process;
end behav;