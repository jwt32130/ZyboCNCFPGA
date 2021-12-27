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
		direction : out std_logic;
		step : out std_logic;
		enable : out std_logic;
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
	--minimum step pulse width 715ns
	--minimum time direction before step 25ns
	--minimum direction hold time 1us
	--50Mhz clock - 20ns
	--720ns pulse width times for simplicity
	signal pulse_width_counter : integer range 0 to 40;
	-- signal s_direction : std_logic;
	begin
		-- I/O Connections assignments
	
		-- Control state machine implementation
		process(S_AXIS_ACLK)
		begin
		  if (rising_edge (S_AXIS_ACLK)) then
			if(S_AXIS_ARESETN = '0') then
				step  <= '0';
			else
				-- |20ns    |20ns    |
				-- |set/0   |-/1     |-/step/2
				if(pulse_width_counter = 1) then
					step <= '1';
				elsif(pulse_width_counter = 37) Then
					step <= '0';
				end if;
			end if;  
		  end if;
		end process;


		process(S_AXIS_ACLK)
		begin
		  if (rising_edge (S_AXIS_ACLK)) then
			if(S_AXIS_ARESETN = '0') then
			  pulse_width_counter <= 40;
			else
				if(S_AXIS_TVALID = '1') then
					if(S_AXIS_TDATA(0) = '1') then
						pulse_width_counter <= 0;
					end if;
				
				elsif(pulse_width_counter < 40) Then
					pulse_width_counter <= pulse_width_counter + 1;
				end if;
			end if;  
		  end if;
		end process;

		process(S_AXIS_ACLK)
		begin
		  if (rising_edge (S_AXIS_ACLK)) then
			if(S_AXIS_ARESETN = '0') then
				direction  <= '0';
			else
				if(S_AXIS_TVALID = '1') then
					direction <= S_AXIS_TDATA(1);
				end if;
			end if;  
		  end if;
		end process;

		process(S_AXIS_ACLK)
		begin
		  if (rising_edge (S_AXIS_ACLK)) then
			if(S_AXIS_ARESETN = '0') then
			  -- Synchronous reset (active low)
			  enable <= '0';
				-- counter <= 0;
			else
				enable <= '1';
			end if;  
		  end if;
		end process;
end arch_imp;
