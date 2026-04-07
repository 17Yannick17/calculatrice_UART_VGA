library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Text_screen_test is
	port( CLOCK_50	: in std_logic;
			KEY		: in std_logic_vector(1 downto 0);
			VGA_R, VGA_G, VGA_B : out std_logic_vector(3 downto 0);
			VGA_HS 	: out std_logic;
			VGA_VS 	: out std_logic
			);
end Text_screen_test;

architecture DE1 of Text_screen_test is 
	alias clock : std_logic is Clock_50;
	alias reset : std_logic is KEY(0);
	constant screen_width:  integer := 80;
	constant screen_height: integer := 60;
	
	signal mem_in, mem_out, data: std_logic_vector(6 downto 0);
	signal mem_adr: std_logic_vector(12 downto 0);
	signal mem_wr: std_logic;
	signal x : unsigned(6 downto 0);
	signal y : unsigned(5 downto 0);
	
	type state is ( clean0, clean1, clean2, clean3, done);
	signal SV : state;
	
begin
	vga : entity work.vga_font port map(	--VGA with font table. 
		clock => clock,
		reset => not reset,
		mem_adr => mem_adr,
		mem_out => mem_out,
		mem_in => mem_in,
		mem_wr => mem_wr,   
		vga_hs => vga_hs,
		vga_vs => vga_vs,
		r => vga_r,
		g => vga_g,
		b => vga_b
	);
	mem_adr <= std_logic_vector(y) & std_logic_vector(x);	
	
	screen_test: process(clock, reset)
	begin
		if(reset = '0') then	
			mem_wr <= '0';
			x <= to_unsigned(0, 7);
			y <= to_unsigned(0, 6);
			data <= "0100000";
			mem_in <= "0100000";
			SV <= clean0;			
		elsif(clock'event AND clock = '1') then
			case SV is
				when clean0 =>	
					mem_wr <= '1';	

					-- Cadre principal et séparations de la calculatrice (plus large et plus haut)
					if ((x >= 4 and x <= 75 and y >= 1 and y <= 38) and
						 (x = 4 or x = 75 or y = 1 or y = 38 or y = 5 or y = 13 or
						  y = 18 or y = 23 or y = 28 or y = 33 or
						  ((x = 22 or x = 40 or x = 58) and y >= 13 and y <= 33) or
						  ((x = 40 or x = 58) and y >= 33 and y <= 38))) then
						mem_in <= "1111111";

					-- Titre : CALCULATRICE
					elsif (y = 3 and x >= 34 and x <= 45) then
						case to_integer(x) is
							when 34 => mem_in <= "1000011"; -- C
							when 35 => mem_in <= "1000001"; -- A
							when 36 => mem_in <= "1001100"; -- L
							when 37 => mem_in <= "1000011"; -- C
							when 38 => mem_in <= "1010101"; -- U
							when 39 => mem_in <= "1001100"; -- L
							when 40 => mem_in <= "1000001"; -- A
							when 41 => mem_in <= "1010100"; -- T
							when 42 => mem_in <= "1010010"; -- R
							when 43 => mem_in <= "1001001"; -- I
							when 44 => mem_in <= "1000011"; -- C
							when 45 => mem_in <= "1000101"; -- E
							when others => mem_in <= "0100000";
						end case;

					-- Ligne d'affichage : A   ? ?
					elsif (y = 8 and x >= 8 and x <= 17) then
						case to_integer(x) is
							when 8  => mem_in <= "1000001"; -- A
							when 9  => mem_in <= "0100000";
							when 10 => mem_in <= "0111101"; -- =
							when 11 => mem_in <= "0100000";
							when 12 => mem_in <= "0111111"; -- ?
							when 13 => mem_in <= "0111111"; -- ?
							when others => mem_in <= "0100000";
						end case;

					-- Ligne d'affichage : OP  ?
					elsif (y = 8 and x >= 31 and x <= 40) then
						case to_integer(x) is
							when 31 => mem_in <= "1001111"; -- O
							when 32 => mem_in <= "1010000"; -- P
							when 33 => mem_in <= "0100000";
							when 34 => mem_in <= "0111101"; -- =
							when 35 => mem_in <= "0100000";
							when 36 => mem_in <= "0111111"; -- ?
							when others => mem_in <= "0100000";
						end case;

					-- Ligne d'affichage : B   ? ?
					elsif (y = 8 and x >= 59 and x <= 69) then
						case to_integer(x) is
							when 59 => mem_in <= "1000010"; -- B
							when 60 => mem_in <= "0100000";
							when 61 => mem_in <= "0111101"; -- =
							when 62 => mem_in <= "0100000";
							when 63 => mem_in <= "0111111"; -- ?
							when 64 => mem_in <= "0111111"; -- ?
							when others => mem_in <= "0100000";
						end case;

					-- Ligne d'affichage : RESULTAT = ?? (un peu plus bas)
					elsif (y = 11 and x >= 24 and x <= 41) then
						case to_integer(x) is
							when 24 => mem_in <= "1010010"; -- R
							when 25 => mem_in <= "1000101"; -- E
							when 26 => mem_in <= "1010011"; -- S
							when 27 => mem_in <= "1010101"; -- U
							when 28 => mem_in <= "1001100"; -- L
							when 29 => mem_in <= "1010100"; -- T
							when 30 => mem_in <= "1000001"; -- A
							when 31 => mem_in <= "1010100"; -- T
							when 32 => mem_in <= "0100000";
							when 33 => mem_in <= "0111101"; -- =
							when 34 => mem_in <= "0100000";
							when 35 => mem_in <= "0111111"; -- ?
							when 36 => mem_in <= "0111111"; -- ?
							when others => mem_in <= "0100000";
						end case;

					-- 1re ligne de touches
					elsif (y = 16 and x = 13) then mem_in <= "0110001"; -- 1
					elsif (y = 16 and x = 31) then mem_in <= "0110010"; -- 2
					elsif (y = 16 and x = 49) then mem_in <= "0110011"; -- 3
					elsif (y = 16 and x = 66) then mem_in <= "0101011"; -- +

					-- 2e ligne de touches
					elsif (y = 21 and x = 13) then mem_in <= "0110100"; -- 4
					elsif (y = 21 and x = 31) then mem_in <= "0110101"; -- 5
					elsif (y = 21 and x = 49) then mem_in <= "0110110"; -- 6
					elsif (y = 21 and x = 66) then mem_in <= "0101101"; -- -

					-- 3e ligne de touches
					elsif (y = 26 and x = 13) then mem_in <= "0110111"; -- 7
					elsif (y = 26 and x = 31) then mem_in <= "0111000"; -- 8
					elsif (y = 26 and x = 49) then mem_in <= "0111001"; -- 9
					elsif (y = 26 and x = 66) then mem_in <= "0101010"; -- *

					-- 4e ligne de touches
					elsif (y = 31 and x >= 11 and x <= 13) then
						case to_integer(x) is
							when 11 => mem_in <= "1000001"; -- A
							when 12 => mem_in <= "1001110"; -- N
							when 13 => mem_in <= "1010011"; -- S
							when others => mem_in <= "0100000";
						end case;
					elsif (y = 31 and x = 31) then mem_in <= "0110000"; -- 0
					elsif (y = 31 and x >= 48 and x <= 50) then
						case to_integer(x) is
							when 48 => mem_in <= "1011000"; -- X
							when 49 => mem_in <= "1011110"; -- ^
							when 50 => mem_in <= "0110010"; -- 2
							when others => mem_in <= "0100000";
						end case;
					elsif (y = 31 and x = 66) then mem_in <= "0101111"; -- /

					-- Dernière ligne : RESET large, X^3 et = alignés
					elsif (y = 35 and x >= 11 and x <= 15) then
						case to_integer(x) is
							when 11 => mem_in <= "1010010"; -- R
							when 12 => mem_in <= "1000101"; -- E
							when 13 => mem_in <= "1010011"; -- S
							when 14 => mem_in <= "1000101"; -- E
							when 15 => mem_in <= "1010100"; -- T
							when others => mem_in <= "0100000";
						end case;
					elsif (y = 35 and x >= 48 and x <= 50) then
						case to_integer(x) is
							when 48 => mem_in <= "1011000"; -- X
							when 49 => mem_in <= "1011110"; -- ^
							when 50 => mem_in <= "0110011"; -- 3
							when others => mem_in <= "0100000";
						end case;
					elsif (y = 35 and x = 66) then mem_in <= "0111101"; -- =

					-- Fond
					else
						mem_in <= "0100000"; -- espace
					end if;
					SV <= clean1;		
				when clean1 =>
					x <= x+1;
					data <= std_logic_vector(unsigned(data) + 1);
					SV <= clean2;
				when clean2 =>
					mem_wr <= '0';	
					if(x > screen_width-1) then 
						x<= to_unsigned(0, 7);
						y <= y+1;
						SV <= clean3;
					else
						SV <= clean0;
					end if;
				when clean3 =>
					if(y > screen_height-1) then	
						SV <= done;	
					else
						SV <= clean0;
					end if;
				when done =>
					null;
				when others =>
					SV <= clean0;
			end case;
		end if;		
	end process;
end architecture DE1;
