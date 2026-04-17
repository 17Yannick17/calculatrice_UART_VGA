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
        result_valid  : out std_logic;
        busy          : out std_logic;
        neg_o         : out std_logic;
        div0_o        : out std_logic
    );
end controller;

architecture Behavioral of controller is

    type state_t is (
        OPERANDE1,              -- saisie operand1
        OPERANDE2,              -- saisie operand2
        LOAD_R1_INSTRUCTION,     -- MVI R1, imm
        LOAD_R1_VALUE,
        LOAD_R2_INSTRUCTION,     -- MVI R2, imm
        LOAD_R2_VALUE,
        EXECUTION,        -- ADD/SUB/MUL/DIV/POW2/POW3
        ATTENTE_EXECUTION,
        SHOW_RESULT,
        ERROR
    );

    signal state : state_t := OPERANDE1;

    signal operand1_u : unsigned(9 downto 0) := (others => '0');
    signal operand2_u : unsigned(9 downto 0) := (others => '0');
    signal result_u   : unsigned(9 downto 0) := (others => '0');

    signal op_code    : std_logic_vector(3 downto 0) := (others => '0');
    signal op_ascii   : std_logic_vector(7 downto 0) := (others => '0');

	 signal has_ans : std_logic := '0';
    signal has_operand1    : std_logic := '0';
    signal has_operand2    : std_logic := '0';
    signal unary_op   : std_logic := '0';

    signal cpu_din_s  : std_logic_vector(9 downto 0) := (others => '0');
    signal cpu_run_s  : std_logic := '0';

    signal neg_s      : std_logic := '0';
    signal div0_s     : std_logic := '0';
    signal result_ok  : std_logic := '0';
	 
	 signal chain_pending      : std_logic := '0';
	 signal next_op_code       : std_logic_vector(3 downto 0) := (others => '0');
	 signal next_op_ascii      : std_logic_vector(7 downto 0) := (others => '0');

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
    begin
        if rising_edge(clk) then
            cpu_run_s <= '0';
            result_ok <= '0';

            if reset = '1' then
                state      <= OPERANDE1;
                operand1_u <= (others => '0');
                operand2_u <= (others => '0');
                result_u   <= (others => '0');
                op_code    <= (others => '0');
                op_ascii   <= (others => '0');
					 has_ans		     <= '0';
                has_operand1    <= '0';
                has_operand2    <= '0';
                unary_op   <= '0';
                neg_s      <= '0';
                div0_s     <= '0';
                cpu_din_s  <= (others => '0');
					 chain_pending <= '0';
					 next_op_code  <= (others => '0');
					 next_op_ascii <= (others => '0');

            else
                case state is

                    ------------------------------------------------------
                    -- SAISIE OPERANDE 1
                    ------------------------------------------------------
                    when OPERANDE1 =>
                        if rx_valid = '1' then
                            if rx_data = x"43" then  -- 'C'
                                operand1_u <= (others => '0');
                                operand2_u <= (others => '0');
                                op_code    <= (others => '0');
                                op_ascii   <= (others => '0');
                                has_operand1    <= '0';
                                has_operand2    <= '0';
                                unary_op   <= '0';
                                neg_s      <= '0';
                                div0_s     <= '0';

									 elsif rx_data = x"41" and has_ans = '1' then  -- 'A' = ANS
										 operand1_u <= result_u;   -- ou valeur mémorisée depuis R0
										 has_operand1 <= '1';	  
									
                            elsif is_digit(rx_data) then
                                digit_v := ascii_to_digit(rx_data);
                                operand1_u <= resize(operand1_u * to_unsigned(10, operand1_u'length) + digit_v, operand1_u'length);
                                has_operand1 <= '1';

                            elsif has_operand1 = '1' then
                                case rx_data is
                                    when x"2B" =>  -- '+'
                                        op_code  <= "0010";
                                        op_ascii <= rx_data;
                                        unary_op <= '0';
                                        operand2_u <= (others => '0');
                                        has_operand2 <= '0';
                                        state   <= OPERANDE2;

                                    when x"2D" =>  -- '-'
                                        op_code  <= "0011";
                                        op_ascii <= rx_data;
                                        unary_op <= '0';
                                        operand2_u <= (others => '0');
                                        has_operand2 <= '0';
                                        state   <= OPERANDE2;

                                    when x"2A" =>  -- '*'
                                        op_code  <= "0100";
                                        op_ascii <= rx_data;
                                        unary_op <= '0';
                                        operand2_u <= (others => '0');
                                        has_operand2 <= '0';
                                        state   <= OPERANDE2;

                                    when x"2F" =>  -- '/'
                                        op_code  <= "0101";
                                        op_ascii <= rx_data;
                                        unary_op <= '0';
                                        operand2_u <= (others => '0');
                                        has_operand2 <= '0';
                                        state   <= OPERANDE2;

                                    when x"73" =>  -- 's' = square
                                        op_code  <= "0110";
                                        op_ascii <= rx_data;
                                        unary_op <= '1';
                                        state    <= LOAD_R1_INSTRUCTION;

                                    when x"63" =>  -- 'c' = cube
                                        op_code  <= "0111";
                                        op_ascii <= rx_data;
                                        unary_op <= '1';
                                        state    <= LOAD_R1_INSTRUCTION;

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
                                operand1_u <= (others => '0');
                                operand2_u <= (others => '0');
                                op_code    <= (others => '0');
                                op_ascii   <= (others => '0');
                                has_operand1    <= '0';
                                has_operand2    <= '0';
                                unary_op   <= '0';
                                neg_s      <= '0';
                                div0_s     <= '0';
                                state      <= OPERANDE1;

									 elsif rx_data = x"41" and has_ans = '1' then  -- 'A'
										 operand2_u <= result_u;
										 has_operand2 <= '1';
										  
                            elsif is_digit(rx_data) then
                                digit_v := ascii_to_digit(rx_data);
                                operand2_u <= resize(operand2_u * to_unsigned(10, operand2_u'length) + digit_v, operand2_u'length);
                                has_operand2 <= '1';

                            elsif has_operand2 = '1' then
										 case rx_data is
											  when x"73" =>  -- 's' : carré de B
													operand2_u <= resize(operand2_u * operand2_u, operand2_u'length);

											  when x"63" =>  -- 'c' : cube de B
													operand2_u <= to_unsigned(
														 to_integer(operand2_u) * to_integer(operand2_u) * to_integer(operand2_u),
														 operand2_u'length
													);

											  when x"3D" =>  -- '='
													chain_pending <= '0';
													state <= LOAD_R1_INSTRUCTION;

											  when x"2B" =>  -- '+'
													chain_pending <= '1';
													next_op_code  <= "0010";
													next_op_ascii <= rx_data;
													state <= LOAD_R1_INSTRUCTION;

											  when x"2D" =>  -- '-'
													chain_pending <= '1';
													next_op_code  <= "0011";
													next_op_ascii <= rx_data;
													state <= LOAD_R1_INSTRUCTION;

											  when x"2A" =>  -- '*'
													chain_pending <= '1';
													next_op_code  <= "0100";
													next_op_ascii <= rx_data;
													state <= LOAD_R1_INSTRUCTION;

											  when x"2F" =>  -- '/'
													chain_pending <= '1';
													next_op_code  <= "0101";
													next_op_ascii <= rx_data;
													state <= LOAD_R1_INSTRUCTION;

											  when others =>
													null;
										 end case;
									end if;
                        end if;

                    ------------------------------------------------------
                    -- MICRO-SEQUENCE CPU
                    ------------------------------------------------------
                    when LOAD_R1_INSTRUCTION =>
                        -- MVI R1, imm  => opcode=0001, Rx=001, Ry=000
                        cpu_din_s <= make_instr("0001", "001", "000");
                        cpu_run_s <= '1';
                        state <= LOAD_R1_VALUE;

                    when LOAD_R1_VALUE =>
                        cpu_din_s <= std_logic_vector(operand1_u);
                        -- une instruction MVI se termine en T1
                        if cpu_done = '1' then
                            if unary_op = '1' then
                                state <= EXECUTION;
                            else
                                state <= LOAD_R2_INSTRUCTION;
                            end if;
                        end if;

                    when LOAD_R2_INSTRUCTION =>
                        -- MVI R2, imm  => opcode=0001, Rx=010, Ry=000
                        cpu_din_s <= make_instr("0001", "010", "000");
                        cpu_run_s <= '1';
                        state <= LOAD_R2_VALUE;

                    when LOAD_R2_VALUE =>
                        cpu_din_s <= std_logic_vector(operand2_u);
                        if cpu_done = '1' then
                            state <= EXECUTION;
                        end if;

                    when EXECUTION =>
                        -- opération R1 <- R1 op R2
                        -- Rx=001 (R1), Ry=010 (R2)
                        -- pour POW2/POW3, Ry est ignoré
                        cpu_din_s <= make_instr(op_code, "001", "010");
                        cpu_run_s <= '1';

                        -- flags calculés côté contrôleur
                        if op_code = "0011" then
                            if operand1_u < operand2_u then
                                neg_s <= '1';
                            else
                                neg_s <= '0';
                            end if;
                        else
                            neg_s <= '0';
                        end if;

                        if op_code = "0101" and operand2_u = 0 then
                            div0_s <= '1';
                        else
                            div0_s <= '0';
                        end if;

                        state <= ATTENTE_EXECUTION;

                    when ATTENTE_EXECUTION =>
							 if cpu_done = '1' then
								  if div0_s = '1' then
										result_u <= (others => '0');
										state <= ERROR;
								  else
										has_ans <= '1';
										result_u <= unsigned(cpu_bus);
										cpu_din_s <= make_instr("0000", "000", "001");
										cpu_run_s <= '1';

										if chain_pending = '1' then
											 operand1_u <= unsigned(cpu_bus);
											 operand2_u <= (others => '0');
											 op_code    <= next_op_code;
											 op_ascii   <= next_op_ascii;
											 has_operand1 <= '1';
											 has_operand2 <= '0';
											 unary_op   <= '0';
											 neg_s      <= '0';
											 div0_s     <= '0';
											 chain_pending <= '0';
											 state <= OPERANDE2;
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
										operand1_u <= (others => '0');
										operand2_u <= (others => '0');
										op_code    <= (others => '0');
										op_ascii   <= (others => '0');
										has_operand1 <= '0';
										has_operand2 <= '0';
										unary_op   <= '0';
										neg_s      <= '0';
										div0_s     <= '0';
										chain_pending <= '0';
										next_op_code  <= (others => '0');
										next_op_ascii <= (others => '0');
										state      <= OPERANDE1;

								  elsif is_digit(rx_data) then
										-- nouveau calcul
										operand1_u <= ascii_to_digit(rx_data);
										operand2_u <= (others => '0');
										result_u   <= (others => '0');
										op_code    <= (others => '0');
										op_ascii   <= (others => '0');
										has_operand1 <= '1';
										has_operand2 <= '0';
										unary_op   <= '0';
										neg_s      <= '0';
										div0_s     <= '0';
										chain_pending <= '0';
										next_op_code  <= (others => '0');
										next_op_ascii <= (others => '0');
										state      <= OPERANDE1;

								  else
										case rx_data is
											 when x"2B" =>  -- '+'
												  operand1_u <= result_u;
												  operand2_u <= (others => '0');
												  op_code    <= "0010";
												  op_ascii   <= rx_data;
												  has_operand1 <= '1';
												  has_operand2 <= '0';
												  unary_op   <= '0';
												  neg_s      <= '0';
												  div0_s     <= '0';
												  state      <= OPERANDE2;

											 when x"2D" =>  -- '-'
												  operand1_u <= result_u;
												  operand2_u <= (others => '0');
												  op_code    <= "0011";
												  op_ascii   <= rx_data;
												  has_operand1 <= '1';
												  has_operand2 <= '0';
												  unary_op   <= '0';
												  neg_s      <= '0';
												  div0_s     <= '0';
												  state      <= OPERANDE2;

											 when x"2A" =>  -- '*'
												  operand1_u <= result_u;
												  operand2_u <= (others => '0');
												  op_code    <= "0100";
												  op_ascii   <= rx_data;
												  has_operand1 <= '1';
												  has_operand2 <= '0';
												  unary_op   <= '0';
												  neg_s      <= '0';
												  div0_s     <= '0';
												  state      <= OPERANDE2;

											 when x"2F" =>  -- '/'
												  operand1_u <= result_u;
												  operand2_u <= (others => '0');
												  op_code    <= "0101";
												  op_ascii   <= rx_data;
												  has_operand1 <= '1';
												  has_operand2 <= '0';
												  unary_op   <= '0';
												  neg_s      <= '0';
												  div0_s     <= '0';
												  state      <= OPERANDE2;

											 when x"73" =>  -- 's' => square du résultat
												  operand1_u <= result_u;
												  operand2_u <= (others => '0');
												  op_code    <= "0110";
												  op_ascii   <= rx_data;
												  has_operand1 <= '1';
												  has_operand2 <= '0';
												  unary_op   <= '1';
												  neg_s      <= '0';
												  div0_s     <= '0';
												  state      <= LOAD_R1_INSTRUCTION;

											 when x"63" =>  -- 'c' => cube du résultat
												  operand1_u <= result_u;
												  operand2_u <= (others => '0');
												  op_code    <= "0111";
												  op_ascii   <= rx_data;
												  has_operand1 <= '1';
												  has_operand2 <= '0';
												  unary_op   <= '1';
												  neg_s      <= '0';
												  div0_s     <= '0';
												  state      <= LOAD_R1_INSTRUCTION;

											 when others =>
												  null;
										end case;
								  end if;
							 end if;

                    when ERROR =>
                        if rx_valid = '1' and rx_data = x"43" then
                            operand1_u <= (others => '0');
                            operand2_u <= (others => '0');
                            op_code    <= (others => '0');
                            op_ascii   <= (others => '0');
                            has_operand1    <= '0';
                            has_operand2    <= '0';
                            unary_op   <= '0';
                            neg_s      <= '0';
                            div0_s     <= '0';
                            state      <= OPERANDE1;
                        end if;

                end case;
            end if;
        end if;
    end process;

end Behavioral;