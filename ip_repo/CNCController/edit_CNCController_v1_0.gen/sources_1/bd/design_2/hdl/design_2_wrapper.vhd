--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
--Date        : Mon Dec 13 23:09:00 2021
--Host        : jacob-VirtualBox running 64-bit Ubuntu 20.04.3 LTS
--Command     : generate_target design_2_wrapper.bd
--Design      : design_2_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_2_wrapper is
  port (
    AXIS_ACLK : in STD_LOGIC;
    AXIS_ARESETN : in STD_LOGIC;
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
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    axi_clear_reset : in STD_LOGIC;
    axi_reset : in STD_LOGIC_VECTOR ( 0 to 0 );
    axistop : in STD_LOGIC_VECTOR ( 0 to 0 );
    reverse_in_0 : in STD_LOGIC;
    reverse_out_0 : out STD_LOGIC;
    stop_out : out STD_LOGIC;
    stop_until_clear : in STD_LOGIC
  );
end design_2_wrapper;

architecture STRUCTURE of design_2_wrapper is
  component design_2 is
  port (
    AXIS_ACLK : in STD_LOGIC;
    AXIS_ARESETN : in STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    reverse_in_0 : in STD_LOGIC;
    reverse_out_0 : out STD_LOGIC;
    stop_out : out STD_LOGIC;
    stop_until_clear : in STD_LOGIC;
    S_AXIS_0_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_0_tvalid : in STD_LOGIC;
    S_AXIS_0_tready : out STD_LOGIC;
    S_AXI_0_awaddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    S_AXI_0_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_0_awvalid : in STD_LOGIC;
    S_AXI_0_awready : out STD_LOGIC;
    S_AXI_0_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_0_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_0_wvalid : in STD_LOGIC;
    S_AXI_0_wready : out STD_LOGIC;
    S_AXI_0_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_0_bvalid : out STD_LOGIC;
    S_AXI_0_bready : in STD_LOGIC;
    S_AXI_0_araddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    S_AXI_0_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_0_arvalid : in STD_LOGIC;
    S_AXI_0_arready : out STD_LOGIC;
    S_AXI_0_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_0_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_0_rvalid : out STD_LOGIC;
    S_AXI_0_rready : in STD_LOGIC;
    M01_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M01_AXIS_0_tvalid : out STD_LOGIC;
    M01_AXIS_0_tready : in STD_LOGIC;
    M02_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M02_AXIS_0_tvalid : out STD_LOGIC;
    M02_AXIS_0_tready : in STD_LOGIC;
    M03_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M03_AXIS_0_tvalid : out STD_LOGIC;
    M03_AXIS_0_tready : in STD_LOGIC;
    M04_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M04_AXIS_0_tvalid : out STD_LOGIC;
    M04_AXIS_0_tready : in STD_LOGIC;
    M05_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M05_AXIS_0_tvalid : out STD_LOGIC;
    M05_AXIS_0_tready : in STD_LOGIC;
    axi_reset : in STD_LOGIC_VECTOR ( 0 to 0 );
    axistop : in STD_LOGIC_VECTOR ( 0 to 0 );
    axi_clear_reset : in STD_LOGIC
  );
  end component design_2;
begin
design_2_i: component design_2
     port map (
      AXIS_ACLK => AXIS_ACLK,
      AXIS_ARESETN => AXIS_ARESETN,
      M01_AXIS_0_tdata(7 downto 0) => M01_AXIS_0_tdata(7 downto 0),
      M01_AXIS_0_tready => M01_AXIS_0_tready,
      M01_AXIS_0_tvalid => M01_AXIS_0_tvalid,
      M02_AXIS_0_tdata(7 downto 0) => M02_AXIS_0_tdata(7 downto 0),
      M02_AXIS_0_tready => M02_AXIS_0_tready,
      M02_AXIS_0_tvalid => M02_AXIS_0_tvalid,
      M03_AXIS_0_tdata(7 downto 0) => M03_AXIS_0_tdata(7 downto 0),
      M03_AXIS_0_tready => M03_AXIS_0_tready,
      M03_AXIS_0_tvalid => M03_AXIS_0_tvalid,
      M04_AXIS_0_tdata(7 downto 0) => M04_AXIS_0_tdata(7 downto 0),
      M04_AXIS_0_tready => M04_AXIS_0_tready,
      M04_AXIS_0_tvalid => M04_AXIS_0_tvalid,
      M05_AXIS_0_tdata(7 downto 0) => M05_AXIS_0_tdata(7 downto 0),
      M05_AXIS_0_tready => M05_AXIS_0_tready,
      M05_AXIS_0_tvalid => M05_AXIS_0_tvalid,
      S_AXIS_0_tdata(63 downto 0) => S_AXIS_0_tdata(63 downto 0),
      S_AXIS_0_tready => S_AXIS_0_tready,
      S_AXIS_0_tvalid => S_AXIS_0_tvalid,
      S_AXI_0_araddr(6 downto 0) => S_AXI_0_araddr(6 downto 0),
      S_AXI_0_arprot(2 downto 0) => S_AXI_0_arprot(2 downto 0),
      S_AXI_0_arready => S_AXI_0_arready,
      S_AXI_0_arvalid => S_AXI_0_arvalid,
      S_AXI_0_awaddr(6 downto 0) => S_AXI_0_awaddr(6 downto 0),
      S_AXI_0_awprot(2 downto 0) => S_AXI_0_awprot(2 downto 0),
      S_AXI_0_awready => S_AXI_0_awready,
      S_AXI_0_awvalid => S_AXI_0_awvalid,
      S_AXI_0_bready => S_AXI_0_bready,
      S_AXI_0_bresp(1 downto 0) => S_AXI_0_bresp(1 downto 0),
      S_AXI_0_bvalid => S_AXI_0_bvalid,
      S_AXI_0_rdata(31 downto 0) => S_AXI_0_rdata(31 downto 0),
      S_AXI_0_rready => S_AXI_0_rready,
      S_AXI_0_rresp(1 downto 0) => S_AXI_0_rresp(1 downto 0),
      S_AXI_0_rvalid => S_AXI_0_rvalid,
      S_AXI_0_wdata(31 downto 0) => S_AXI_0_wdata(31 downto 0),
      S_AXI_0_wready => S_AXI_0_wready,
      S_AXI_0_wstrb(3 downto 0) => S_AXI_0_wstrb(3 downto 0),
      S_AXI_0_wvalid => S_AXI_0_wvalid,
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARESETN => S_AXI_ARESETN,
      axi_clear_reset => axi_clear_reset,
      axi_reset(0) => axi_reset(0),
      axistop(0) => axistop(0),
      reverse_in_0 => reverse_in_0,
      reverse_out_0 => reverse_out_0,
      stop_out => stop_out,
      stop_until_clear => stop_until_clear
    );
end STRUCTURE;
