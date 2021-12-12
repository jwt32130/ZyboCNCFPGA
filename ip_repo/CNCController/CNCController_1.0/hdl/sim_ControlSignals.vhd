----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/09/2021 08:16:31 PM
-- Design Name: 
-- Module Name: sim_ControlSignals - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd


library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity design_1_wrapper_tb is
end;

architecture bench of design_1_wrapper_tb is

  component design_1_wrapper
    port (
      AXIS_ACLK_0 : in STD_LOGIC;
      AXIS_ARESETN_0 : in STD_LOGIC;
      M01_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
      M01_AXIS_0_tready : in STD_LOGIC;
      M01_AXIS_0_tvalid : out STD_LOGIC;
      M02_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
      M02_AXIS_0_tready : in STD_LOGIC;
      M02_AXIS_0_tvalid : out STD_LOGIC;
      M03_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
      M03_AXIS_0_tready : in STD_LOGIC;
      M03_AXIS_0_tvalid : out STD_LOGIC;
      M04_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
      M04_AXIS_0_tready : in STD_LOGIC;
      M04_AXIS_0_tvalid : out STD_LOGIC;
      M05_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
      M05_AXIS_0_tready : in STD_LOGIC;
      M05_AXIS_0_tvalid : out STD_LOGIC;
      S_AXIS_0_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
      S_AXIS_0_tready : out STD_LOGIC;
      S_AXIS_0_tvalid : in STD_LOGIC;
      S_AXI_0_araddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
      S_AXI_0_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
      S_AXI_0_arready : out STD_LOGIC;
      S_AXI_0_arvalid : in STD_LOGIC;
      S_AXI_0_awaddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
      S_AXI_0_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
      S_AXI_0_awready : out STD_LOGIC;
      S_AXI_0_awvalid : in STD_LOGIC;
      S_AXI_0_bready : in STD_LOGIC;
      S_AXI_0_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
      S_AXI_0_bvalid : out STD_LOGIC;
      S_AXI_0_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
      S_AXI_0_rready : in STD_LOGIC;
      S_AXI_0_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
      S_AXI_0_rvalid : out STD_LOGIC;
      S_AXI_0_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
      S_AXI_0_wready : out STD_LOGIC;
      S_AXI_0_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
      S_AXI_0_wvalid : in STD_LOGIC;
      S_AXI_ACLK_0 : in STD_LOGIC;
      S_AXI_ARESETN_0 : in STD_LOGIC;
      reverse_in_0 : in STD_LOGIC;
      reverse_out_0 : out STD_LOGIC;
      stop_out : out STD_LOGIC;
      stop_until_clear : in STD_LOGIC;
      tmpclear : in STD_LOGIC
    );
  end component;

  signal AXIS_ACLK_0: STD_LOGIC;
  signal AXIS_ARESETN_0: STD_LOGIC;
  signal M01_AXIS_0_tdata: STD_LOGIC_VECTOR ( 7 downto 0 );
  signal M01_AXIS_0_tready: STD_LOGIC;
  signal M01_AXIS_0_tvalid: STD_LOGIC;
  signal M02_AXIS_0_tdata: STD_LOGIC_VECTOR ( 7 downto 0 );
  signal M02_AXIS_0_tready: STD_LOGIC;
  signal M02_AXIS_0_tvalid: STD_LOGIC;
  signal M03_AXIS_0_tdata: STD_LOGIC_VECTOR ( 7 downto 0 );
  signal M03_AXIS_0_tready: STD_LOGIC;
  signal M03_AXIS_0_tvalid: STD_LOGIC;
  signal M04_AXIS_0_tdata: STD_LOGIC_VECTOR ( 7 downto 0 );
  signal M04_AXIS_0_tready: STD_LOGIC;
  signal M04_AXIS_0_tvalid: STD_LOGIC;
  signal M05_AXIS_0_tdata: STD_LOGIC_VECTOR ( 7 downto 0 );
  signal M05_AXIS_0_tready: STD_LOGIC;
  signal M05_AXIS_0_tvalid: STD_LOGIC;
  signal S_AXIS_0_tdata: STD_LOGIC_VECTOR ( 63 downto 0 );
  signal S_AXIS_0_tready: STD_LOGIC;
  signal S_AXIS_0_tvalid: STD_LOGIC;
  signal S_AXI_0_araddr: STD_LOGIC_VECTOR ( 6 downto 0 );
  signal S_AXI_0_arprot: STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S_AXI_0_arready: STD_LOGIC;
  signal S_AXI_0_arvalid: STD_LOGIC;
  signal S_AXI_0_awaddr: STD_LOGIC_VECTOR ( 6 downto 0 );
  signal S_AXI_0_awprot: STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S_AXI_0_awready: STD_LOGIC;
  signal S_AXI_0_awvalid: STD_LOGIC;
  signal S_AXI_0_bready: STD_LOGIC;
  signal S_AXI_0_bresp: STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S_AXI_0_bvalid: STD_LOGIC;
  signal S_AXI_0_rdata: STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S_AXI_0_rready: STD_LOGIC;
  signal S_AXI_0_rresp: STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S_AXI_0_rvalid: STD_LOGIC;
  signal S_AXI_0_wdata: STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S_AXI_0_wready: STD_LOGIC;
  signal S_AXI_0_wstrb: STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S_AXI_0_wvalid: STD_LOGIC;
  signal S_AXI_ACLK_0: STD_LOGIC;
  signal S_AXI_ARESETN_0: STD_LOGIC;
  signal reverse_in_0: STD_LOGIC;
  signal reverse_out_0: STD_LOGIC;
  signal stop_out: STD_LOGIC;
  signal stop_until_clear: STD_LOGIC;
  signal tmpclear: STD_LOGIC ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;
begin

  uut: design_1_wrapper port map ( AXIS_ACLK_0       => AXIS_ACLK_0,
                                   AXIS_ARESETN_0    => AXIS_ARESETN_0,
                                   M01_AXIS_0_tdata  => M01_AXIS_0_tdata,
                                   M01_AXIS_0_tready => M01_AXIS_0_tready,
                                   M01_AXIS_0_tvalid => M01_AXIS_0_tvalid,
                                   M02_AXIS_0_tdata  => M02_AXIS_0_tdata,
                                   M02_AXIS_0_tready => M02_AXIS_0_tready,
                                   M02_AXIS_0_tvalid => M02_AXIS_0_tvalid,
                                   M03_AXIS_0_tdata  => M03_AXIS_0_tdata,
                                   M03_AXIS_0_tready => M03_AXIS_0_tready,
                                   M03_AXIS_0_tvalid => M03_AXIS_0_tvalid,
                                   M04_AXIS_0_tdata  => M04_AXIS_0_tdata,
                                   M04_AXIS_0_tready => M04_AXIS_0_tready,
                                   M04_AXIS_0_tvalid => M04_AXIS_0_tvalid,
                                   M05_AXIS_0_tdata  => M05_AXIS_0_tdata,
                                   M05_AXIS_0_tready => M05_AXIS_0_tready,
                                   M05_AXIS_0_tvalid => M05_AXIS_0_tvalid,
                                   S_AXIS_0_tdata    => S_AXIS_0_tdata,
                                   S_AXIS_0_tready   => S_AXIS_0_tready,
                                   S_AXIS_0_tvalid   => S_AXIS_0_tvalid,
                                   S_AXI_0_araddr    => S_AXI_0_araddr,
                                   S_AXI_0_arprot    => S_AXI_0_arprot,
                                   S_AXI_0_arready   => S_AXI_0_arready,
                                   S_AXI_0_arvalid   => S_AXI_0_arvalid,
                                   S_AXI_0_awaddr    => S_AXI_0_awaddr,
                                   S_AXI_0_awprot    => S_AXI_0_awprot,
                                   S_AXI_0_awready   => S_AXI_0_awready,
                                   S_AXI_0_awvalid   => S_AXI_0_awvalid,
                                   S_AXI_0_bready    => S_AXI_0_bready,
                                   S_AXI_0_bresp     => S_AXI_0_bresp,
                                   S_AXI_0_bvalid    => S_AXI_0_bvalid,
                                   S_AXI_0_rdata     => S_AXI_0_rdata,
                                   S_AXI_0_rready    => S_AXI_0_rready,
                                   S_AXI_0_rresp     => S_AXI_0_rresp,
                                   S_AXI_0_rvalid    => S_AXI_0_rvalid,
                                   S_AXI_0_wdata     => S_AXI_0_wdata,
                                   S_AXI_0_wready    => S_AXI_0_wready,
                                   S_AXI_0_wstrb     => S_AXI_0_wstrb,
                                   S_AXI_0_wvalid    => S_AXI_0_wvalid,
                                   S_AXI_ACLK_0      => S_AXI_ACLK_0,
                                   S_AXI_ARESETN_0   => S_AXI_ARESETN_0,
                                   reverse_in_0      => reverse_in_0,
                                   reverse_out_0     => reverse_out_0,
                                   stop_out          => stop_out,
                                   stop_until_clear  => stop_until_clear,
                                   tmpclear          => tmpclear );


  stimulus: process
  begin
  
    -- Put initialisation code here
    S_AXIS_0_tdata <= x"0000000000000000";
    S_AXIS_0_tvalid <= '0';
    AXIS_ARESETN_0 <= '0';
    stop_until_clear <= '0';
    tmpclear <= '0';
    reverse_in_0 <= '0';

    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    AXIS_ARESETN_0 <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    tmpclear <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    tmpclear <= '0';
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);


    --check writing incremental data

    S_AXIS_0_tvalid <= '1';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"0000000000000001";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"0000000000000002";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"0000000000000003";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"0000000000000000";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"0000000000000005";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tvalid <= '0';

    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);

    --check 1 timing should be 2 clock cycles
    S_AXIS_0_tdata <= x"0000000000000001";
    S_AXIS_0_tvalid <= '1';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"0000000000000000";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tvalid <= '0';

    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);

    --check 2 timing should be 2 clock cycles
    S_AXIS_0_tdata <= x"0000000000000002";
    S_AXIS_0_tvalid <= '1';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"0000000000000000";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tvalid <= '0';

    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);

    --check single writes
    S_AXIS_0_tdata <= x"0000000000000000";
    S_AXIS_0_tvalid <= '1';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tvalid <= '0';
    wait until rising_edge(AXIS_ACLK_0);
    S_AXIS_0_tdata <= x"0000000000000001";
    S_AXIS_0_tvalid <= '1';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tvalid <= '0';
    wait until rising_edge(AXIS_ACLK_0);
    S_AXIS_0_tdata <= x"0000000000000002";
    S_AXIS_0_tvalid <= '1';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tvalid <= '0';
    wait until rising_edge(AXIS_ACLK_0);
    S_AXIS_0_tdata <= x"0000000000000003";
    S_AXIS_0_tvalid <= '1';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tvalid <= '0';
    wait until rising_edge(AXIS_ACLK_0);


    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);

    --check for proper clock count. should be exactly 10 clock cycles from start -> start of next
    S_AXIS_0_tdata <= x"000000000000000a";
    S_AXIS_0_tvalid <= '1';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tvalid <= '0';

    wait until rising_edge(AXIS_ACLK_0);
    wait for 100 ns;
    wait until rising_edge(AXIS_ACLK_0);

    -----------------------
    --test clear bit
    stop_until_clear <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    stop_until_clear <= '0';
    S_AXIS_0_tdata <= x"0000000000000003";
    S_AXIS_0_tvalid <= '1';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"0000000000000003";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tvalid <= '0';
    wait until rising_edge(AXIS_ACLK_0);

    tmpclear <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    tmpclear <= '0';
    wait until rising_edge(AXIS_ACLK_0);

    wait until rising_edge(AXIS_ACLK_0);
    S_AXIS_0_tdata <= x"0000000000000003";
    S_AXIS_0_tvalid <= '1';
    stop_until_clear <= '1';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    stop_until_clear <= '0';
    S_AXIS_0_tdata <= x"0000000000000003";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tvalid <= '0';
    wait until rising_edge(AXIS_ACLK_0);

    tmpclear <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    tmpclear <= '0';
    wait until rising_edge(AXIS_ACLK_0);

    wait until rising_edge(AXIS_ACLK_0);
    S_AXIS_0_tdata <= x"0000000000000003";
    S_AXIS_0_tvalid <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    stop_until_clear <= '1';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    stop_until_clear <= '0';
    S_AXIS_0_tdata <= x"0000000000000003";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tvalid <= '0';
    wait until rising_edge(AXIS_ACLK_0);

    tmpclear <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    tmpclear <= '0';
    wait until rising_edge(AXIS_ACLK_0);

    wait until rising_edge(AXIS_ACLK_0);
    S_AXIS_0_tdata <= x"0000000000000003";
    S_AXIS_0_tvalid <= '1';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    stop_until_clear <= '1';
    S_AXIS_0_tdata <= x"0000000000000003";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tvalid <= '0';
    stop_until_clear <= '0';
    wait until rising_edge(AXIS_ACLK_0);

    tmpclear <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    tmpclear <= '0';
    wait until rising_edge(AXIS_ACLK_0);


    --reset
    wait for 100 ns;
    AXIS_ARESETN_0 <= '0';
    for i in 0 to 20 loop
    wait until rising_edge(AXIS_ACLK_0);
    end loop ; -- 
    AXIS_ARESETN_0 <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    AXIS_ARESETN_0 <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    tmpclear <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    tmpclear <= '0';
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);



    S_AXIS_0_tvalid <= '1';
    S_AXIS_0_tdata <= x"0000000000000000";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"0000000000000004";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"0000000000000002";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    reverse_in_0 <= '1';
    S_AXIS_0_tdata <= x"0000000000000008";
    wait until rising_edge(AXIS_ACLK_0);  
    wait until rising_edge(AXIS_ACLK_0);  
    wait until rising_edge(AXIS_ACLK_0);  
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    reverse_in_0 <= '0';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"0000000000000005";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tvalid <= '0';

--reset
    wait for 100 ns;
    AXIS_ARESETN_0 <= '0';
    for i in 0 to 20 loop
    wait until rising_edge(AXIS_ACLK_0);
    end loop ; -- 
    AXIS_ARESETN_0 <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    AXIS_ARESETN_0 <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    tmpclear <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    tmpclear <= '0';
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);


    S_AXIS_0_tvalid <= '1';
    S_AXIS_0_tdata <= x"0000000000000000";
    reverse_in_0 <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    reverse_in_0 <= '0';
    S_AXIS_0_tvalid <= '1';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    reverse_in_0 <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    reverse_in_0 <= '0';
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tvalid <= '0';
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);

    S_AXIS_0_tvalid <= '1';
    S_AXIS_0_tdata <= x"0000000000000001";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"0000000000000002";
    wait until rising_edge(AXIS_ACLK_0);
    reverse_in_0 <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    reverse_in_0 <= '0';
    S_AXIS_0_tvalid <= '0';



    S_AXIS_0_tvalid <= '1';
    S_AXIS_0_tdata <= x"0000000000000001";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"0000000000000004";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"0000000000000008";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"000000000000000a";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"00000000000000FF";
    reverse_in_0 <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);

    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);

    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);

    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);

    reverse_in_0 <= '0';
    wait until rising_edge(AXIS_ACLK_0);
    reverse_in_0 <= '1';
    wait until rising_edge(AXIS_ACLK_0);
    reverse_in_0 <= '0';

    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tdata <= x"0000000000000000";
    wait until rising_edge(AXIS_ACLK_0) and S_AXIS_0_tready = '1';
    S_AXIS_0_tvalid <= '0';
    wait until rising_edge(AXIS_ACLK_0);
    wait until rising_edge(AXIS_ACLK_0);








    wait for 500 ns;

    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

      -- Put test bench stimulus code here


clocking: process
begin
  while not stop_the_clock loop
    AXIS_ACLK_0 <= '0', '1' after clock_period / 2;
    S_AXI_ACLK_0 <= '0', '1' after clock_period / 2;
    wait for clock_period;
  end loop;
  wait;
end process;



end;
  