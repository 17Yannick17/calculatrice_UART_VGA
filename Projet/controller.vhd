library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity controller is
    port(
        clk       : in  std_logic;
        reset     : in  std_logic;

        -- depuis UART
        rx_data   : in  std_logic_vector(7 downto 0);
        rx_valid  : in  std_logic;

        -- vers CPU
        cpu_din   : out std_logic_vector(9 downto 0);
        cpu_run   : out std_logic;

        -- depuis CPU
        cpu_bus   : in  std_logic_vector(9 downto 0);
        cpu_done  : in  std_logic;

        -- pour affichage / debug
        operand1_o    : out std_logic_vector(9 downto 0);
        operand2_o    : out std_logic_vector(9 downto 0);
        result_o      : out std_logic_vector(9 downto 0);
        operator_o    : out std_logic_vector(7 downto 0); 
		  
		  operand1_neg_o : out std_logic;
		  operand2_neg_o : out std_logic;
		  
        result_valid  : out std_logic;
        busy          : out std_logic;
        neg_o         : out std_logic;
        div0_o        : out std_logic
    );
end controller;

architecture Behavioral of controller is

    type state_t is (
        OPERANDE1,
        OPERANDE2,
        PREPARE_EXEC,
        LOAD_R1_INSTRUCTION,
        LOAD_R1_VALUE,
        LOAD_R2_INSTRUCTION,
        LOAD_R2_VALUE,
        EXECUTION,
        ATTENTE_EXECUTION,
        SHOW_RESULT,
        ERROR
    );

    signal state : state_t := OPERANDE1;

    signal operand1_u : unsigned(9 downto 0) := (others => '0');
    signal operand2_u : unsigned(9 downto 0) := (others => '0');
    signal result_u   : unsigned(9 downto 0) := (others => '0');

    signal operand1_neg : std_logic := '0';
    signal operand2_neg : std_logic := '0';
    signal ans_neg      : std_logic := '0';

    signal op_code    : std_logic_vector(3 downto 0) := (others => '0');
    signal op_ascii   : std_logic_vector(7 downto 0) := (others => '0');

    signal has_ans      : std_logic := '0';
    signal has_operand1 : std_logic := '0';
    signal has_operand2 : std_logic := '0';
    signal unary_op     : std_logic := '0';

    signal cpu_din_s  : std_logic_vector(9 downto 0) := (others => '0');
    signal cpu_run_s  : std_logic := '0';

    signal neg_s      : std_logic := '0';
    signal div0_s     : std_logic := '0';
    signal result_ok  : std_logic := '0';

    signal chain_pending : std_logic := '0';
    signal next_op_code  : std_logic_vector(3 downto 0) := (others => '0');
    signal next_op_ascii : std_logic_vector(7 downto 0) := (others => '0');

    -- opération effectivement envoyée au CPU
    signal exec_operand1_u : unsigned(9 downto 0) := (others => '0');
    signal exec_operand2_u : unsigned(9 downto 0) := (others => '0');
    signal exec_op_code    : std_logic_vector(3 downto 0) := (others => '0');
    signal exec_neg        : std_logic := '0';
    signal exec_div0       : std_logic := '0';

    function make_instr(
        opcode : std_logic_vector(3 downto 0);
        rx     : std_logic_vector(2 downto 0);
        ry     : std_logic_vector(2 downto 0)
    ) return std_logic_vector is
    begin
        return opcode & rx & ry;
    end function;

    function is_digit(c : std_logic_vector(7 downto 0)) return boolean is
    begin
        return (unsigned(c) >= to_unsigned(48, 8)) and
               (unsigned(c) <= to_unsigned(57, 8));
    end function;

    function ascii_to_digit(c : std_logic_vector(7 downto 0)) return unsigned is
    begin
        return resize(unsigned(c) - to_unsigned(48, 8), 10);
    end function;

begin

	 operand1_neg_o <= operand1_neg;
	 operand2_neg_o <= operand2_neg;
    cpu_din <= cpu_din_s;
    cpu_run <= cpu_run_s;

    operand1_o   <= std_logic_vector(operand1_u);
    operand2_o   <= std_logic_vector(operand2_u);
    result_o     <= std_logic_vector(result_u);
    operator_o   <= op_ascii;
    result_valid <= result_ok;
    busy         <= '1' when state /= OPERANDE1 and state /= OPERANDE2 and state /= SHOW_RESULT else '0';
    neg_o        <= neg_s;
    div0_o       <= div0_s;

    process(clk)
        variable digit_v : unsigned(9 downto 0);

        variable a_mag   : unsigned(9 downto 0);
        variable b_mag   : unsigned(9 downto 0);
        variable a_neg_v : std_logic;
        variable b_neg_v : std_logic;
    begin
        if rising_edge(clk) then
            cpu_run_s <= '0';
            result_ok <= '0';

            if reset = '1' then
                state         <= OPERANDE1;
                operand1_u    <= (others => '0');
                operand2_u    <= (others => '0');
                result_u      <= (others => '0');
                operand1_neg  <= '0';
                operand2_neg  <= '0';
                ans_neg       <= '0';
                op_code       <= (others => '0');
                op_ascii      <= (others => '0');
                has_ans       <= '0';
                has_operand1  <= '0';
                has_operand2  <= '0';
                unary_op      <= '0';
                neg_s         <= '0';
                div0_s        <= '0';
                cpu_din_s     <= (others => '0');
                chain_pending <= '0';
                next_op_code  <= (others => '0');
                next_op_ascii <= (others => '0');

                exec_operand1_u <= (others => '0');
                exec_operand2_u <= (others => '0');
                exec_op_code    <= (others => '0');
                exec_neg        <= '0';
                exec_div0       <= '0';

            else
                case state is

                    ------------------------------------------------------
                    -- SAISIE OPERANDE 1
                    ------------------------------------------------------
                    when OPERANDE1 =>
                        if rx_valid = '1' then
                            if rx_data = x"43" then  -- 'C'
                                operand1_u    <= (others => '0');
                                operand2_u    <= (others => '0');
                                operand1_neg  <= '0';
                                operand2_neg  <= '0';
                                op_code       <= (others => '0');
                                op_ascii      <= (others => '0');
                                has_operand1  <= '0';
                                has_operand2  <= '0';
                                unary_op      <= '0';
                                neg_s         <= '0';
                                div0_s        <= '0';
                                chain_pending <= '0';
                                next_op_code  <= (others => '0');
                                next_op_ascii <= (others => '0');

                            elsif rx_data = x"41" and has_ans = '1' then  -- 'A' = ANS
                                operand1_u   <= result_u;
                                operand1_neg <= ans_neg;
                                has_operand1 <= '1';
										  
									 elsif rx_data = x"2D" and has_operand1 = '0' and operand1_u = 0 then  -- signe '-'
										  operand1_neg <= '1';

                            elsif is_digit(rx_data) then
                                digit_v := ascii_to_digit(rx_data);
                                operand1_u   <= resize(operand1_u * to_unsigned(10, operand1_u'length) + digit_v, operand1_u'length);
                                has_operand1 <= '1';

                            elsif has_operand1 = '1' then
                                case rx_data is
                                    when x"2B" =>  -- '+'
                                        op_code       <= "0010";
                                        op_ascii      <= rx_data;
                                        unary_op      <= '0';
                                        operand2_u    <= (others => '0');
                                        operand2_neg  <= '0';
                                        has_operand2  <= '0';
                                        state         <= OPERANDE2;

                                    when x"2D" =>  -- '-'
                                        op_code       <= "0011";
                                        op_ascii      <= rx_data;
                                        unary_op      <= '0';
                                        operand2_u    <= (others => '0');
                                        operand2_neg  <= '0';
                                        has_operand2  <= '0';
                                        state         <= OPERANDE2;

                                    when x"2A" =>  -- '*'
                                        op_code       <= "0100";
                                        op_ascii      <= rx_data;
                                        unary_op      <= '0';
                                        operand2_u    <= (others => '0');
                                        operand2_neg  <= '0';
                                        has_operand2  <= '0';
                                        state         <= OPERANDE2;

                                    when x"2F" =>  -- '/'
                                        op_code       <= "0101";
                                        op_ascii      <= rx_data;
                                        unary_op      <= '0';
                                        operand2_u    <= (others => '0');
                                        operand2_neg  <= '0';
                                        has_operand2  <= '0';
                                        state         <= OPERANDE2;

                                    when x"73" =>  -- 's'
                                        op_code  <= "0110";
                                        op_ascii <= rx_data;
                                        unary_op <= '1';
                                        state    <= PREPARE_EXEC;

                                    when x"63" =>  -- 'c'
                                        op_code  <= "0111";
                                        op_ascii <= rx_data;
                                        unary_op <= '1';
                                        state    <= PREPARE_EXEC;

                                    when others =>
                                        null;
                                end case;
                            end if;
                        end if;

                    ------------------------------------------------------
                    -- SAISIE OPERANDE 2
                    ------------------------------------------------------
                    when OPERANDE2 =>
                        if rx_valid = '1' then
                            if rx_data = x"43" then  -- 'C'
                                operand1_u    <= (others => '0');
                                operand2_u    <= (others => '0');
                                operand1_neg  <= '0';
                                operand2_neg  <= '0';
                                op_code       <= (others => '0');
                                op_ascii      <= (others => '0');
                                has_operand1  <= '0';
                                has_operand2  <= '0';
                                unary_op      <= '0';
                                neg_s         <= '0';
                                div0_s        <= '0';
                                chain_pending <= '0';
                                next_op_code  <= (others => '0');
                                next_op_ascii <= (others => '0');
                                state         <= OPERANDE1;

                            elsif rx_data = x"41" and has_ans = '1' then  -- 'A'
                                operand2_u   <= result_u;
                                operand2_neg <= ans_neg;
                                has_operand2 <= '1';

									 elsif rx_data = x"2D" and has_operand2 = '0' and operand2_u = 0 then  -- signe '-'
										  operand2_neg <= '1';
										  
                            elsif is_digit(rx_data) then
                                digit_v := ascii_to_digit(rx_data);
                                operand2_u   <= resize(operand2_u * to_unsigned(10, operand2_u'length) + digit_v, operand2_u'length);
                                has_operand2 <= '1';

                            elsif has_operand2 = '1' then
                                case rx_data is
                                    when x"73" =>  -- 's'
                                        operand2_u   <= resize(operand2_u * operand2_u, operand2_u'length);
                                        operand2_neg <= '0';

                                    when x"63" =>  -- 'c'
                                        operand2_u <= to_unsigned(
                                            to_integer(operand2_u) * to_integer(operand2_u) * to_integer(operand2_u),
                                            operand2_u'length
                                        );
                                        -- signe inchangé pour cube
                                        -- si operand2_u vaut 0, le signe sera corrigé au PREPARE_EXEC si besoin

                                    when x"3D" =>  -- '='
                                        chain_pending <= '0';
                                        state         <= PREPARE_EXEC;

                                    when x"2B" =>  -- '+'
                                        chain_pending <= '1';
                                        next_op_code  <= "0010";
                                        next_op_ascii <= rx_data;
                                        state         <= PREPARE_EXEC;

                                    when x"2D" =>  -- '-'
                                        chain_pending <= '1';
                                        next_op_code  <= "0011";
                                        next_op_ascii <= rx_data;
                                        state         <= PREPARE_EXEC;

                                    when x"2A" =>  -- '*'
                                        chain_pending <= '1';
                                        next_op_code  <= "0100";
                                        next_op_ascii <= rx_data;
                                        state         <= PREPARE_EXEC;

                                    when x"2F" =>  -- '/'
                                        chain_pending <= '1';
                                        next_op_code  <= "0101";
                                        next_op_ascii <= rx_data;
                                        state         <= PREPARE_EXEC;

                                    when others =>
                                        null;
                                end case;
                            end if;
                        end if;

                    ------------------------------------------------------
                    -- PREPARATION de l'opération signée vers CPU non signé
                    ------------------------------------------------------
                    when PREPARE_EXEC =>
                        a_mag   := operand1_u;
                        b_mag   := operand2_u;
                        a_neg_v := operand1_neg;
                        b_neg_v := operand2_neg;

                        exec_operand1_u <= operand1_u;
                        exec_operand2_u <= operand2_u;
                        exec_op_code    <= op_code;
                        exec_neg        <= '0';
                        exec_div0       <= '0';

                        if unary_op = '1' then
                            exec_operand1_u <= operand1_u;
                            exec_operand2_u <= (others => '0');
                            exec_op_code    <= op_code;
                            exec_div0       <= '0';

                            if op_code = "0110" then      -- square
                                exec_neg <= '0';
                            elsif op_code = "0111" then   -- cube
                                if operand1_u = 0 then
                                    exec_neg <= '0';
                                else
                                    exec_neg <= operand1_neg;
                                end if;
                            else
                                exec_neg <= '0';
                            end if;

                        else
                            case op_code is

                                when "0010" =>  -- ADD signé
                                    if a_neg_v = b_neg_v then
                                        exec_operand1_u <= a_mag;
                                        exec_operand2_u <= b_mag;
                                        exec_op_code    <= "0010";
                                        if (a_mag = 0) and (b_mag = 0) then
                                            exec_neg <= '0';
                                        else
                                            exec_neg <= a_neg_v;
                                        end if;
                                    else
                                        if a_mag >= b_mag then
                                            exec_operand1_u <= a_mag;
                                            exec_operand2_u <= b_mag;
                                            exec_op_code    <= "0011";
                                            if a_mag = b_mag then
                                                exec_neg <= '0';
                                            else
                                                exec_neg <= a_neg_v;
                                            end if;
                                        else
                                            exec_operand1_u <= b_mag;
                                            exec_operand2_u <= a_mag;
                                            exec_op_code    <= "0011";
                                            exec_neg        <= b_neg_v;
                                        end if;
                                    end if;

                                when "0011" =>  -- SUB signé = A + (-B)
                                    b_neg_v := not b_neg_v;

                                    if a_neg_v = b_neg_v then
                                        exec_operand1_u <= a_mag;
                                        exec_operand2_u <= b_mag;
                                        exec_op_code    <= "0010";
                                        if (a_mag = 0) and (b_mag = 0) then
                                            exec_neg <= '0';
                                        else
                                            exec_neg <= a_neg_v;
                                        end if;
                                    else
                                        if a_mag >= b_mag then
                                            exec_operand1_u <= a_mag;
                                            exec_operand2_u <= b_mag;
                                            exec_op_code    <= "0011";
                                            if a_mag = b_mag then
                                                exec_neg <= '0';
                                            else
                                                exec_neg <= a_neg_v;
                                            end if;
                                        else
                                            exec_operand1_u <= b_mag;
                                            exec_operand2_u <= a_mag;
                                            exec_op_code    <= "0011";
                                            exec_neg        <= b_neg_v;
                                        end if;
                                    end if;

                                when "0100" =>  -- MUL signé
                                    exec_operand1_u <= a_mag;
                                    exec_operand2_u <= b_mag;
                                    exec_op_code    <= "0100";
                                    if (a_mag = 0) or (b_mag = 0) then
                                        exec_neg <= '0';
                                    else
                                        exec_neg <= a_neg_v xor b_neg_v;
                                    end if;

                                when "0101" =>  -- DIV signé
                                    exec_operand1_u <= a_mag;
                                    exec_operand2_u <= b_mag;
                                    exec_op_code    <= "0101";
                                    if b_mag = 0 then
                                        exec_div0 <= '1';
                                        exec_neg  <= '0';
                                    else
                                        if a_mag = 0 then
                                            exec_neg <= '0';
                                        else
                                            exec_neg <= a_neg_v xor b_neg_v;
                                        end if;
                                    end if;

                                when others =>
                                    exec_operand1_u <= a_mag;
                                    exec_operand2_u <= b_mag;
                                    exec_op_code    <= op_code;
                                    exec_neg        <= '0';
                                    exec_div0       <= '0';
                            end case;
                        end if;

                        div0_s <= '0';
                        state  <= LOAD_R1_INSTRUCTION;

                    ------------------------------------------------------
                    -- MICRO-SEQUENCE CPU
                    ------------------------------------------------------
                    when LOAD_R1_INSTRUCTION =>
                        cpu_din_s <= make_instr("0001", "001", "000"); -- MVI R1, imm
                        cpu_run_s <= '1';
                        state     <= LOAD_R1_VALUE;

                    when LOAD_R1_VALUE =>
                        cpu_din_s <= std_logic_vector(exec_operand1_u);
                        if cpu_done = '1' then
                            if unary_op = '1' then
                                state <= EXECUTION;
                            else
                                state <= LOAD_R2_INSTRUCTION;
                            end if;
                        end if;

                    when LOAD_R2_INSTRUCTION =>
                        cpu_din_s <= make_instr("0001", "010", "000"); -- MVI R2, imm
                        cpu_run_s <= '1';
                        state     <= LOAD_R2_VALUE;

                    when LOAD_R2_VALUE =>
                        cpu_din_s <= std_logic_vector(exec_operand2_u);
                        if cpu_done = '1' then
                            state <= EXECUTION;
                        end if;

                    when EXECUTION =>
                        cpu_din_s <= make_instr(exec_op_code, "001", "010");
                        cpu_run_s <= '1';

                        neg_s  <= exec_neg;
                        div0_s <= exec_div0;

                        state <= ATTENTE_EXECUTION;

                    when ATTENTE_EXECUTION =>
                        if cpu_done = '1' then
                            if div0_s = '1' then
                                result_u <= (others => '0');
                                state    <= ERROR;
                            else
                                has_ans  <= '1';
                                result_u <= unsigned(cpu_bus);

                                if unsigned(cpu_bus) = 0 then
                                    neg_s   <= '0';
                                    ans_neg <= '0';
                                else
                                    neg_s   <= exec_neg;
                                    ans_neg <= exec_neg;
                                end if;

                                cpu_din_s <= make_instr("0000", "000", "001");
                                cpu_run_s <= '1';

                                if chain_pending = '1' then
                                    operand1_u   <= unsigned(cpu_bus);
                                    if unsigned(cpu_bus) = 0 then
                                        operand1_neg <= '0';
                                    else
                                        operand1_neg <= exec_neg;
                                    end if;

                                    operand2_u    <= (others => '0');
                                    operand2_neg  <= '0';
                                    op_code       <= next_op_code;
                                    op_ascii      <= next_op_ascii;
                                    has_operand1  <= '1';
                                    has_operand2  <= '0';
                                    unary_op      <= '0';
                                    div0_s        <= '0';
                                    chain_pending <= '0';
                                    state         <= OPERANDE2;
                                else
                                    state <= SHOW_RESULT;
                                end if;
                            end if;
                        end if;

                    ------------------------------------------------------
                    -- RESULTAT
                    ------------------------------------------------------
                    when SHOW_RESULT =>
                        result_ok <= '1';

                        if rx_valid = '1' then
                            if rx_data = x"43" then  -- 'C'
                                operand1_u    <= (others => '0');
                                operand2_u    <= (others => '0');
                                operand1_neg  <= '0';
                                operand2_neg  <= '0';
                                op_code       <= (others => '0');
                                op_ascii      <= (others => '0');
                                has_operand1  <= '0';
                                has_operand2  <= '0';
                                unary_op      <= '0';
                                neg_s         <= '0';
                                div0_s        <= '0';
                                chain_pending <= '0';
                                next_op_code  <= (others => '0');
                                next_op_ascii <= (others => '0');
                                state         <= OPERANDE1;

                            elsif is_digit(rx_data) then
                                operand1_u    <= ascii_to_digit(rx_data);
                                operand2_u    <= (others => '0');
                                operand1_neg  <= '0';
                                operand2_neg  <= '0';
                                op_code       <= (others => '0');
                                op_ascii      <= (others => '0');
                                has_operand1  <= '1';
                                has_operand2  <= '0';
                                unary_op      <= '0';
                                neg_s         <= '0';
                                div0_s        <= '0';
                                chain_pending <= '0';
                                next_op_code  <= (others => '0');
                                next_op_ascii <= (others => '0');
                                state         <= OPERANDE1;

                            else
                                case rx_data is
												when x"41" =>  -- 'A'
													 if has_ans = '1' then
														  operand1_u   <= result_u;
														  operand1_neg <= ans_neg;
														  operand2_u   <= (others => '0');
														  operand2_neg <= '0';
														  op_code      <= (others => '0');
														  op_ascii     <= (others => '0');
														  has_operand1 <= '1';
														  has_operand2 <= '0';
														  unary_op     <= '0';
														  div0_s       <= '0';
														  chain_pending <= '0';
														  next_op_code  <= (others => '0');
														  next_op_ascii <= (others => '0');
														  state        <= OPERANDE1;
													 end if;
																								
                                    when x"2B" =>  -- '+'
                                        operand1_u   <= result_u;
                                        operand1_neg <= ans_neg;
                                        operand2_u   <= (others => '0');
                                        operand2_neg <= '0';
                                        op_code      <= "0010";
                                        op_ascii     <= rx_data;
                                        has_operand1 <= '1';
                                        has_operand2 <= '0';
                                        unary_op     <= '0';
                                        div0_s       <= '0';
                                        state        <= OPERANDE2;

                                    when x"2D" =>  -- '-'
                                        operand1_u   <= result_u;
                                        operand1_neg <= ans_neg;
                                        operand2_u   <= (others => '0');
                                        operand2_neg <= '0';
                                        op_code      <= "0011";
                                        op_ascii     <= rx_data;
                                        has_operand1 <= '1';
                                        has_operand2 <= '0';
                                        unary_op     <= '0';
                                        div0_s       <= '0';
                                        state        <= OPERANDE2;

                                    when x"2A" =>  -- '*'
                                        operand1_u   <= result_u;
                                        operand1_neg <= ans_neg;
                                        operand2_u   <= (others => '0');
                                        operand2_neg <= '0';
                                        op_code      <= "0100";
                                        op_ascii     <= rx_data;
                                        has_operand1 <= '1';
                                        has_operand2 <= '0';
                                        unary_op     <= '0';
                                        div0_s       <= '0';
                                        state        <= OPERANDE2;

                                    when x"2F" =>  -- '/'
                                        operand1_u   <= result_u;
                                        operand1_neg <= ans_neg;
                                        operand2_u   <= (others => '0');
                                        operand2_neg <= '0';
                                        op_code      <= "0101";
                                        op_ascii     <= rx_data;
                                        has_operand1 <= '1';
                                        has_operand2 <= '0';
                                        unary_op     <= '0';
                                        div0_s       <= '0';
                                        state        <= OPERANDE2;

                                    when x"73" =>  -- 's'
                                        operand1_u   <= result_u;
                                        operand1_neg <= ans_neg;
                                        operand2_u   <= (others => '0');
                                        operand2_neg <= '0';
                                        op_code      <= "0110";
                                        op_ascii     <= rx_data;
                                        has_operand1 <= '1';
                                        has_operand2 <= '0';
                                        unary_op     <= '1';
                                        div0_s       <= '0';
                                        state        <= PREPARE_EXEC;

                                    when x"63" =>  -- 'c'
                                        operand1_u   <= result_u;
                                        operand1_neg <= ans_neg;
                                        operand2_u   <= (others => '0');
                                        operand2_neg <= '0';
                                        op_code      <= "0111";
                                        op_ascii     <= rx_data;
                                        has_operand1 <= '1';
                                        has_operand2 <= '0';
                                        unary_op     <= '1';
                                        div0_s       <= '0';
                                        state        <= PREPARE_EXEC;

                                    when others =>
                                        null;
                                end case;
                            end if;
                        end if;

                    when ERROR =>
                        if rx_valid = '1' and rx_data = x"43" then
                            operand1_u    <= (others => '0');
                            operand2_u    <= (others => '0');
                            operand1_neg  <= '0';
                            operand2_neg  <= '0';
                            op_code       <= (others => '0');
                            op_ascii      <= (others => '0');
                            has_operand1  <= '0';
                            has_operand2  <= '0';
                            unary_op      <= '0';
                            neg_s         <= '0';
                            div0_s        <= '0';
                            chain_pending <= '0';
                            next_op_code  <= (others => '0');
                            next_op_ascii <= (others => '0');
                            state         <= OPERANDE1;
                        end if;

                end case;
            end if;
        end if;
    end process;

end Behavioral;