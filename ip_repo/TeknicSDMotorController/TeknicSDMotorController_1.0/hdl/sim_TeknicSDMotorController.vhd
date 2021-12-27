-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity TeknicSDMotorController_v1_0_S00_AXIS_tb is
end;

architecture bench of TeknicSDMotorController_v1_0_S00_AXIS_tb is

  component TeknicSDMotorController_v1_0_S00_AXIS
  	port (
  		direction : out std_logic;
  		step : out std_logic;
  		enable : out std_logic;
  		S_AXIS_ACLK	: in std_logic;
  		S_AXIS_ARESETN	: in std_logic;
  		S_AXIS_TREADY	: out std_logic;
  		S_AXIS_TDATA	: in std_logic_vector(7 downto 0);
  		S_AXIS_TVALID	: in std_logic
  	);
  end component;

  signal direction: std_logic;
  signal step: std_logic;
  signal enable: std_logic;
  signal S_AXIS_ACLK: std_logic;
  signal S_AXIS_ARESETN: std_logic;
  signal S_AXIS_TREADY: std_logic;
  signal S_AXIS_TDATA: std_logic_vector(7 downto 0);
  signal S_AXIS_TVALID: std_logic ;

  constant clock_period: time := 20 ns;
  signal stop_the_clock: boolean;

begin

  uut: TeknicSDMotorController_v1_0_S00_AXIS port map ( direction      => direction,
                                                        step           => step,
                                                        enable         => enable,
                                                        S_AXIS_ACLK    => S_AXIS_ACLK,
                                                        S_AXIS_ARESETN => S_AXIS_ARESETN,
                                                        S_AXIS_TREADY  => S_AXIS_TREADY,
                                                        S_AXIS_TDATA   => S_AXIS_TDATA,
                                                        S_AXIS_TVALID  => S_AXIS_TVALID );

  stimulus: process
  begin
  
    -- Put initialisation code here
    S_AXIS_ARESETN <= '0';
    S_AXIS_TDATA  <= x"FF";
    S_AXIS_TVALID <= '0';
    wait until rising_edge(S_AXIS_ACLK);
    S_AXIS_ARESETN <= '1';
    wait until rising_edge(S_AXIS_ACLK);
    S_AXIS_TVALID <= '1';
    wait until rising_edge(S_AXIS_ACLK);
    S_AXIS_TVALID <= '0';
    wait for 2 us;


    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      S_AXIS_ACLK <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;