library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TeknicSDMotorController_v1_0_S00_AXIS is
	-- generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- AXI4Stream sink: Data Width
		-- C_S_AXIS_TDATA_WIDTH	: integer	:= 8
	-- );
	port (
		-- Users to add ports here
		motor_out : out std_logic;
		motor_out2 : out std_logic;
		motor_out3 : out std_logic;
		motor_out4 : out std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line

		-- AXI4Stream sink: Clock
		S_AXIS_ACLK	: in std_logic;
		-- AXI4Stream sink: Reset
		S_AXIS_ARESETN	: in std_logic;
		-- Ready to accept data in
		S_AXIS_TREADY	: out std_logic;
		-- Data in
		S_AXIS_TDATA	: in std_logic_vector(7 downto 0);
		-- Byte qualifier
		-- S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		-- Indicates boundary of last packet
		-- S_AXIS_TLAST	: in std_logic;
		-- Data is in valid
		S_AXIS_TVALID	: in std_logic
	);
end TeknicSDMotorController_v1_0_S00_AXIS;

architecture arch_imp of TeknicSDMotorController_v1_0_S00_AXIS is
	-- function called clogb2 that returns an integer which has the 
	-- value of the ceiling of the log base 2.
    -- signal counter : integer range 0 to 50000000;
    -- signal m : std_logic ;
	begin
		-- I/O Connections assignments
	
		-- Control state machine implementation
		process(S_AXIS_ACLK)
		begin
		  if (rising_edge (S_AXIS_ACLK)) then
			if(S_AXIS_ARESETN = '0') then
			  -- Synchronous reset (active low)
			  motor_out <= '0';
				motor_out2 <= '1';
				motor_out3 <= '0';
				motor_out4 <= '1';
				-- counter <= 0;
			else
				if(S_AXIS_TVALID = '1') then
					motor_out <= S_AXIS_TDATA(0);
					motor_out2 <= S_AXIS_TDATA(1);
					motor_out3 <= S_AXIS_TDATA(2);
					motor_out4 <= S_AXIS_TDATA(3);
				end if;
				
				-- if(counter < 49000000) then
				    -- counter <= counter + 1;
				-- else 
				    -- counter <= 0;
				-- end if;
				
				-- if(counter = 0) then
				    -- motor_out4 <= '1';
				-- end if;
				-- if(counter = 25000000) then
				    -- motor_out4 <= '0';
				-- end if;
			end if;  
		  end if;
		end process;
end arch_imp;
