library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.ff.all;

--  Cette unité de contrôle (FSM) reçoit l'instruction présente dans le registre IR
--  et génère les signaux nécessaires pour piloter le datapath.

--  Elle gère l'exécution des instructions selon 4 états :
--     T0 : chargement de l'instruction
--     T1 : décodage / première étape d'exécution
--     T2 : deuxième étape pour opérations arithmétiques
--     T3 : écriture du résultat final

--  Les sorties de cette FSM commandent directement :
--      les chargements des registres (Rin, Ain, Gin, IRin)
--      la sortie du multiplexeur vers le bus (Rout, Gout, DINout)
--      le choix de l'opération arithmétique (AddSub)
--      l'indicateur de fin d'exécution de l'instruction (done)
entity fsm is
	Port (
		clk, reset, run : in  STD_LOGIC;
		instruction : in  STD_LOGIC_VECTOR(9 downto 0); -- Format IIIIXXXYYY
		
		-- Signaux de contrôle envoyés vers le datapath
		done, Ain, Gin, IRin, Gout, DINout : out STD_LOGIC;
		Rin, Rout : out STD_LOGIC_VECTOR(7 downto 0);
		operation : out std_logic_vector(3 downto 0)
	);
end fsm;

architecture impl of fsm is
	-- Définition des états
	constant T0  : std_logic_vector(1 downto 0) := "00";
	constant T1    : std_logic_vector(1 downto 0) := "01";
	constant T2   : std_logic_vector(1 downto 0) := "10";
	constant T3  : std_logic_vector(1 downto 0) := "11";

	signal current_state, next_state, next1 : std_logic_vector(1 downto 0) := "00";
	
	-- Sorties des décodeurs de registres
	-- Rx_dec active un seul bit selon le registre destination Rx
	-- Ry_dec active un seul bit selon le registre source Ry
	signal Rx_dec, Ry_dec : std_logic_vector(7 downto 0);

begin
	dFF: vDFF generic map(2) port map(clk, next_state, current_state); -- Registre d'état
	
	-- Décodage des champs Rx et Ry de l'instruction
	-- instruction(5 downto 3) = Rx
	-- instruction(2 downto 0) = Ry
	DecRx: entity work.dec3to8 port map(instruction(5 downto 3), Rx_dec);
	DecRy: entity work.dec3to8 port map(instruction(2 downto 0), Ry_dec);

	process(all)
	begin
		-- valeurs par défaut
		done <= '0'; Ain <= '0'; Gin <= '0'; IRin <= '0'; operation <= "0000"; Gout <= '0'; DINout <= '0';
		Rin  <= (others => '0'); Rout <= (others => '0');

		case current_state is
		
			-- Si run = 1, on passe à T1 pour exécuter l'instruction.
			-- Sinon, on reste en attente dans T0.
			when T0 =>
				IRin <= '1';
			   if run='1' then next1 <= T1;
				else next1 <= T0;
			   end if;
				
			-- Décodage de l'instruction et première étape de traitement
			when T1 => 
				case instruction(9 downto 6) is
						when "0000" => 
							Rout <= Ry_dec;
							Rin  <= Rx_dec;
							done <= '1';
							next1 <= T0;
							
						when "0001" => 
							DINout <= '1';
							Rin  <= Rx_dec;
							done <= '1';
							next1 <= T0;
							
						when "0010" => 
							Rout <= Rx_dec;
							Ain <= '1';
							next1 <= T2;
							
						when "0011" =>
							Rout <= Rx_dec;
							Ain <= '1'; 
							next1 <= T2;
							
						when "0100" => 
							Rout <= Rx_dec;
							Ain <= '1';
							next1 <= T2;
							
						when "0101" => 
							Rout <= Rx_dec;
							Ain <= '1';
							next1 <= T2;
							
						when "0110" => 
							Rout <= Rx_dec;
							Gin <= '1';
							operation <= "0110";
							next1 <= T2;
							
						when "0111" => 
							Rout <= Rx_dec;
							Gin <= '1';
							operation <= "0111";
							next1 <= T2;
							
						when others => 
							next1 <= T0;	
				end case;

			-- Exécution de l'opération arithmétique dans l'ALU
			-- Le registre A contient déjà Rx. On place Ry sur le bus puis on charge le résultat dans G.
			when T2 => 
				case instruction(9 downto 6) is
					when "0010" =>
						Rout <= Ry_dec;
						Gin <= '1';
						operation <= "0010";
						next1 <= T3;

					when "0011" =>
						Rout <= Ry_dec;
						Gin <= '1';
						operation <= "0011";
						next1 <= T3;
						
					when "0100" => 
							Rout <= Ry_dec;
							Gin <= '1';
							operation <= "0100";
							next1 <= T3;
							
					when "0101" => 
							Rout <= Ry_dec;
							Gin <= '1';
							operation <= "0101";
							next1 <= T3;
							
					when "0110" | "0111" => 
							Gout <= '1';
							Rin  <= Rx_dec;
							done <= '1';
							next1 <= T0;

					when others => 
						next1 <= T0;
				end case;

			-- Écriture du résultat final contenu dans G vers Rx
			-- Cette étape termine les instructions ADD et SUB.
			when T3 =>
				case instruction(9 downto 6) is
					when "0010" | "0011" | "0100" | "0101" =>
						Gout <= '1';
						Rin  <= Rx_dec;
						done <= '1';
						next1 <= T0;

					when others =>
						next1 <= T0;
				end case;
				
			-- Si l'état courant est invalide, retour à T0
			when others => 
				next1 <= T0;	
				
		end case;
	end process;

	-- Si reset = 1, la FSM revient immédiatement à l'état T0, sinon elle suit la transition calculée dans next1.
	next_state <= T0 when reset='1' else next1;

end impl;