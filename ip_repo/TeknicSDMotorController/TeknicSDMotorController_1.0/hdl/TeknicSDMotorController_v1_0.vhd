library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TeknicSDMotorController_v1_0 is
	-- generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXIS
		-- C_S00_AXIS_TDATA_WIDTH	: integer	:= 32
	-- );
	port (
		-- Users to add ports here
		motor_out : out std_logic;
		motor_out2 : out std_logic;
		motor_out3 : out std_logic;
		motor_out4 : out std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S00_AXIS
		s00_axis_aclk	: in std_logic;
		s00_axis_aresetn	: in std_logic;
		s00_axis_tready	: out std_logic;
		s00_axis_tdata	: in std_logic_vector(7 downto 0);
		-- s00_axis_tstrb	: in std_logic_vector((C_S00_AXIS_TDATA_WIDTH/8)-1 downto 0);
		-- s00_axis_tlast	: in std_logic;
		s00_axis_tvalid	: in std_logic
	);
end TeknicSDMotorController_v1_0;

architecture arch_imp of TeknicSDMotorController_v1_0 is

	-- component declaration
	component TeknicSDMotorController_v1_0_S00_AXIS is
		-- generic (
		-- C_S_AXIS_TDATA_WIDTH	: integer	:= 32
		-- );
		port (
		motor_out : out std_logic;
		motor_out2 : out std_logic;
		motor_out3 : out std_logic;
		motor_out4 : out std_logic;
		S_AXIS_ACLK	: in std_logic;
		S_AXIS_ARESETN	: in std_logic;
		S_AXIS_TREADY	: out std_logic;
		S_AXIS_TDATA	: in std_logic_vector(7 downto 0);
		-- S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		-- S_AXIS_TLAST	: in std_logic;
		S_AXIS_TVALID	: in std_logic
		);
	end component TeknicSDMotorController_v1_0_S00_AXIS;

begin

-- Instantiation of Axi Bus Interface S00_AXIS
TeknicSDMotorController_v1_0_S00_AXIS_inst : TeknicSDMotorController_v1_0_S00_AXIS
	-- generic map (
		-- C_S_AXIS_TDATA_WIDTH	=> C_S00_AXIS_TDATA_WIDTH
	-- )
	port map (
		motor_out => motor_out,
		motor_out2 => motor_out2,
		motor_out3 => motor_out3,
		motor_out4 => motor_out4,
		S_AXIS_ACLK	=> s00_axis_aclk,
		S_AXIS_ARESETN	=> s00_axis_aresetn,
		S_AXIS_TREADY	=> s00_axis_tready,
		S_AXIS_TDATA	=> s00_axis_tdata,
		-- S_AXIS_TSTRB	=> s00_axis_tstrb,
		-- S_AXIS_TLAST	=> s00_axis_tlast,
		S_AXIS_TVALID	=> s00_axis_tvalid
	);

	-- Add user logic here

	-- User logic ends

end arch_imp;
