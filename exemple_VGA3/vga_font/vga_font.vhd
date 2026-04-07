library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_font is
   port(	clock		:  in       std_logic;
			reset		:  in       std_logic;
			mem_adr	:  in       std_logic_vector(12 downto 0);
			mem_out	:  out      std_logic_vector(6 downto 0);
			mem_in	:  in       std_logic_vector(6 downto 0);
			mem_wr	:  in       std_logic;
			vga_hs	:  out      std_logic;
			vga_vs	:  out      std_logic;
			r, g, b	:  out      std_logic_vector(3 downto 0)
		);
end;

architecture DE1 of vga_font is
   	signal pclock	: std_logic;
		signal char		: std_logic_vector(6 downto 0);
		signal X		: std_logic_vector(9 downto 0);
		signal FX1, FX2	: std_logic_vector(2 downto 0);
		signal Y		: std_logic_vector(8 downto 0);
   	signal FY		: std_logic_vector(2 downto 0);
   	signal font		: std_logic_vector(0 to 7);
		signal b1, b2, blank	: std_logic;
		signal hs1, hs2, hs3, vs1, vs2, vs3	: std_logic;
begin
   Video_RAM: entity work.vram port map(
      address_a => Y(8 downto 3)& X(9 downto 3),
      address_b => mem_adr,
		clock_a => pclock,
      clock_b => clock,
      data_a => (others => '-'),	-- Don't care
      data_b => mem_in,
      wren_a => '0',
      wren_b => mem_wr,
		q_a => char,
      q_b => mem_out
	);
   font_table: entity work.vrom port map(
      clock => pclock,
      address => char & FY,
      q => font
   );

   Timing_Circuit: process(pclock, reset) is
      variable hcount   : integer range 0 to 800;
      variable vcount   : integer range 0 to 525;
      variable xpix     : integer range 0 to 639;
      variable ypix     : integer range 0 to 479;
      variable pixel_on : std_logic;
   begin
      if(reset = '1') then
         hcount := 0;         vcount := 0;
         vga_hs <= '1';       vga_vs <= '1';
      elsif(pclock'event and pclock = '1') then
         if(hcount >= 0 and hcount <= 639 and vcount >= 0 and vcount <= 479) then
            X <= std_logic_vector(to_unsigned(hcount, 10));
				Y <= std_logic_vector(to_unsigned(vcount, 9));
            b1 <= '1'; -- don't blank the screen when in the zone 	
         else
            b1 <= '0'; -- blank the screen when not in range
         end if;
			
			if(hcount = 799) then
				hcount := 0;
				if(vcount = 524) then	
					vcount := 0;
				else
					vcount := vcount + 1;
				end if;
			else
				hcount := hcount + 1;
			end if;
	
			if(hcount = 656) then		hs1 <= '0';
			elsif(hcount = 752) then	hs1 <= '1';
			end if;

			if(vcount = 490) then		vs1 <= '0';
			elsif(vcount = 492) then	vs1 <= '1';
			end if;
      	
         FY <= Y(2 downto 0);	FX1 <= X(2 downto 0);
			hs2 <= hs1;	vs2 <= vs1;	b2 <= b1;
			hs3 <= hs2;	vs3 <= vs2; blank <= b2;   FX2 <= FX1;
			vga_hs <= hs3;	vga_vs <= vs3;
			
			if(blank = '1') then
				-- Conversion des coordonnées VGA courantes en entiers pour
				-- pouvoir définir facilement des zones colorées en pixels.
				xpix := to_integer(unsigned(X));
				ypix := to_integer(unsigned(Y));
				pixel_on := font(to_integer(unsigned(FX2)));
				
				-- Texte/cadres en premier plan, fonds colorés par zones.
				if(pixel_on = '1') then
					-- Texte du titre en noir sur bandeau violet
					if (xpix >= 272 and xpix <= 367 and ypix >= 24 and ypix <= 31) then
						-- Noir : les trois composantes RGB sont à 0.
						r <= "0000";
						g <= "0000";
						b <= "0000";
					else
						-- Blanc : les trois composantes RGB sont au maximum.
						r <= "1111";
						g <= "1111";
						b <= "1111";
					end if;
				else
					-- Fond noir hors de la calculatrice : aucune composante RGB active.
					if (xpix < 32 or xpix > 607 or ypix < 8 or ypix > 303) then
						r <= "0000";
						g <= "0000";
						b <= "0000";
					
					-- Bandeau du titre : violet clair (rouge et bleu forts, vert modéré).
					elsif (ypix >= 8 and ypix <= 39) then
						r <= "1100";
						g <= "1010";
						b <= "1111";
					
					-- Zone d'affichage A / OP / B / RESULTAT : bleu foncé.
					elsif (ypix >= 40 and ypix <= 103) then
						r <= "0001";
						g <= "0010";
						b <= "0101";
					
					-- Colonne des opérateurs : violet/bleu plus soutenu pour la distinguer.
					elsif (xpix >= 464 and xpix <= 607 and ypix >= 104 and ypix <= 303) then
						r <= "0011";
						g <= "0010";
						b <= "0110";
					
					-- Zone RESET en bas à gauche : rouge sombre pour attirer l'attention.
					elsif (xpix >= 32 and xpix <= 319 and ypix >= 264 and ypix <= 303) then
						r <= "0101";
						g <= "0010";
						b <= "0010";
					
					-- Corps principal de la calculatrice : gris bleuté sombre.
					else
						r <= "0010";
						g <= "0010";
						b <= "0011";
					end if;
				end if;
			else
				r <= (others => '0');
				g <= (others => '0');
				b <= (others => '0');
         end if;  
      end if;
   end process;
  ---------------------------------------------		
  pll : work.VGAPLL PORT MAP (
		inclk0 => clock,
		areset => reset,
		c0	 => pclock
	);
end DE1;
