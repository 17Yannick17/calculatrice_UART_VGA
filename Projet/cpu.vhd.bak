library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Ce module relie la FSM et le datapath. Il reçoit l'horloge, le reset, le signal run et les
-- données/instructions DIN, puis expose le bus interne et l'état done.
entity cpu is
    port(
        clk, reset, run : in std_logic;
        DIN : in std_logic_vector(8 downto 0);

        Bus_o : out std_logic_vector(8 downto 0);
        done : out std_logic;
		  
		  NEG  : out std_logic
		  
		  -- sorties pour observer les valeurs des registres dans le testbench
		  
--		  data0_o,data1_o,data2_o,data3_o,data4_o,data5_o : out std_logic_vector(8 downto 0);
--		  data6_o,data7_o,dataA_o,dataG_o, dataIR_o : out std_logic_vector(8 downto 0)
    );
end cpu;

architecture implcpu of cpu is

    -- signaux de contrôle entre FSM et datapath
    signal Ain, Gin, IRin, Gout, DINout : std_logic;
	 signal operation : std_logic_vector(2 downto 0);
    signal Rin, Rout : std_logic_vector(7 downto 0);

    -- instruction venant du datapath
    signal instruction : std_logic_vector(8 downto 0) := "000000000";

begin

    FSM : entity work.fsm
        port map(clk,reset,run,instruction,done,Ain,Gin,IRin,Gout,DINout,Rin,Rout,operation);

    DATAPATH : entity work.datapath
        port map(
            clk         => clk,
            Ain         => Ain,
            Gin         => Gin,
            IRin        => IRin,
            Gout        => Gout,
            DINout      => DINout,
            operation   => operation,
            DIN         => DIN,
            Rin         => Rin,
            Rout        => Rout,
            Bus_o       => Bus_o,
            instruction => instruction,
            NEG         => NEG,
            DIV0        => open
--		  ,data0_o,data1_o,data2_o,data3_o,data4_o,data5_o,data6_o,data7_o,dataA_o,dataG_o, dataIR_o
		  );

end implcpu;