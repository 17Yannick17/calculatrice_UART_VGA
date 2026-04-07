LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
-- Décodeur 3 vers 8. Il convertit une adresse binaire sur 3 bits en commande one-hot sur 8 bits. 
-- Utile pour générer des signaux Rin ou Rout à partir d'un numéro de registre.
ENTITY dec3to8 IS
PORT (
    W  : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
    Y  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END dec3to8;
 
ARCHITECTURE Behavior OF dec3to8 IS
BEGIN
 
PROCESS(W)
BEGIN
 
CASE W IS
 
WHEN "000" => Y <= "00000001";
WHEN "001" => Y <= "00000010";
WHEN "010" => Y <= "00000100";
WHEN "011" => Y <= "00001000";
WHEN "100" => Y <= "00010000";
WHEN "101" => Y <= "00100000";
WHEN "110" => Y <= "01000000";
WHEN "111" => Y <= "10000000";
 
WHEN OTHERS => Y <= "00000000";
 
END CASE;
 
END PROCESS;
 
END Behavior;