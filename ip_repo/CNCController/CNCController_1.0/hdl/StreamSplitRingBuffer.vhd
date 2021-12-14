library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity StreamSplitRingBuffer is
	generic (
		RAMDEPTH : integer := 3
	);
	port (
		stop_and_clear : in std_logic;

		reverse_in : in std_logic;
		reverse_out : out std_logic;

		new_data_clocked_in : out std_logic;

		-- AXI4Stream sink: Clock
		AXIS_ACLK	: in std_logic;
		-- AXI4Stream sink: Reset
		AXIS_ARESETN	: in std_logic;
		-- Ready to accept data in
		S_AXIS_TREADY	: out std_logic;
		-- Data in
		S_AXIS_TDATA	: in std_logic_vector(63 downto 0);
		-- Byte qualifier
		-- S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		-- Indicates boundary of last packet
		-- S_AXIS_TLAST	: in std_logic;
		-- Data is in valid
		S_AXIS_TVALID	: in std_logic;


        -- Global ports
		-- M_AXIS_ACLK	: in std_logic;
		-- 
		-- M_AXIS_ARESETN	: in std_logic;
		-- Master Stream Ports. TVALID indicates that the master is driving a valid transfer, A transfer takes place when both TVALID and TREADY are asserted. 
		M00_AXIS_TVALID	: out std_logic;
		-- TDATA is the primary payload that is used to provide the data that is passing across the interface from the master.
		M00_AXIS_TDATA	: out std_logic_vector(23 downto 0);
		-- TSTRB is the byte qualifier that indicates whether the content of the associated byte of TDATA is processed as a data byte or a position byte.
		-- M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
		-- TLAST indicates the boundary of a packet.
		-- M_AXIS_TLAST	: out std_logic;
		-- TREADY indicates that the slave can accept a transfer in the current cycle.
		M00_AXIS_TREADY	: in std_logic;

		-- M_AXIS_0_ACLK	: in std_logic;
		-- M_AXIS_0_ARESETN	: in std_logic;
		M01_AXIS_TVALID	: out std_logic;
		M01_AXIS_TDATA	: out std_logic_vector(7 downto 0);
		M01_AXIS_TREADY	: in std_logic;

		-- M_AXIS_ACLK_2	: in std_logic;
		-- M_AXIS_ARESETN_2	: in std_logic;
		M02_AXIS_TVALID	: out std_logic;
		M02_AXIS_TDATA	: out std_logic_vector(7 downto 0);
		M02_AXIS_TREADY	: in std_logic;

		-- M_AXIS_ACLK_3	: in std_logic;
		-- M_AXIS_ARESETN_3	: in std_logic;
		M03_AXIS_TVALID	: out std_logic;
		M03_AXIS_TDATA	: out std_logic_vector(7 downto 0);
		M03_AXIS_TREADY	: in std_logic;

		-- M_AXIS_ACLK_4	: in std_logic;
		-- M_AXIS_ARESETN_4	: in std_logic;
		M04_AXIS_TVALID	: out std_logic;
		M04_AXIS_TDATA	: out std_logic_vector(7 downto 0);
		M04_AXIS_TREADY	: in std_logic;

		-- M_AXIS_ACLK_5	: in std_logic;
		-- M_AXIS_ARESETN_5	: in std_logic;
		M05_AXIS_TVALID	: out std_logic;
		M05_AXIS_TDATA	: out std_logic_vector(7 downto 0);
		M05_AXIS_TREADY	: in std_logic
	);
end StreamSplitRingBuffer;

architecture arch_imp of StreamSplitRingBuffer is
	-- function called clogb2 that returns an integer which has the 
	-- value of the ceiling of the log base 2.

	type DATA_FIFO_TYPE is array (0 to (RAMDEPTH - 1)) of std_logic_vector(63 downto 0);
    signal data_fifo : DATA_FIFO_TYPE;

	subtype INDEX_TYPE is integer range DATA_FIFO_TYPE'range;
	signal fill_index : INDEX_TYPE;
	signal fill_count : integer range 0 to RAMDEPTH;
	signal read_index : INDEX_TYPE;
	signal read_start : INDEX_TYPE;
	signal read_count : integer range 0 to RAMDEPTH;

	signal stream_data_out	: std_logic_vector(63 downto 0);
	signal rev : std_logic;

	procedure incr(signal index: inout INDEX_TYPE) is
	begin
		if(index = INDEX_TYPE'high) then
			index <= INDEX_TYPE'low;
		else
			index <= index + 1;
		end if;
	end procedure;
	procedure decr(signal index: inout INDEX_TYPE) is
	begin
		if(index = INDEX_TYPE'low) then
			index <= INDEX_TYPE'high;
		else
			index <= index - 1;
		end if;
	end procedure;



	signal rx_good : std_logic;
	signal read_stream : std_logic;
	signal tx_good : std_logic;
	signal write_stream : std_logic;
	signal reverse_data : std_logic;
	-- signal fifo_pending : std_logic;
	signal can_reverse : std_logic;

	signal write_forward : std_logic;
	signal write_fifo_backward : std_logic;
	signal write_fifo_forward : std_logic;
	signal fifo_index : INDEX_TYPE;
begin

	reverse_out <= reverse_in;
	can_reverse <= '1' when read_count < fill_count else '0';
	
	read_stream <= (M00_AXIS_TREADY and not (reverse_in or reverse_data)) or stop_and_clear;
	rx_good <= S_AXIS_TVALID and read_stream;
	write_forward <= (S_AXIS_TVALID and (not (reverse_in or reverse_data)));
	write_fifo_backward <= (reverse_in and can_reverse);
	write_fifo_forward <= (reverse_data and (not reverse_in));
	write_stream <= (write_forward or write_fifo_backward or write_fifo_forward ) and (not stop_and_clear);
	tx_good <= M00_AXIS_TREADY and write_stream;
	fifo_index <= read_index when reverse_in = '1' else fill_index;

	new_data_clocked_in <= rx_good and tx_good;

	process( AXIS_ACLK )
	begin
		if rising_edge(AXIS_ACLK) then
			if (AXIS_ARESETN = '0') then
				fill_index <= 0;
				read_start <= INDEX_TYPE'high;
				read_index <= INDEX_TYPE'high;
				read_count <= 0;
				reverse_data <= '0';
			else 
				if(tx_good = '1') then
					--reversing fifo
					if(reverse_in = '1' and can_reverse = '1' ) then
						reverse_data <= '1';
						if(read_count < fill_count) then
							decr(read_index);
							decr(fill_index);
							read_count <= read_count + 1;
						end if;
					--progressing fifo back to original location
					elsif(read_count > 0) then
						if(read_count = 1) then
							reverse_data <= '0';
						end if;
						incr(read_index);
						incr(fill_index);
						read_count <= read_count - 1;
					--back to normal
					elsif(rx_good = '1') then
						-- data_fifo(fill_index)(63 downto 0) <= S_AXIS_TDATA(63 downto 0);
						read_start <= fill_index;
						read_index <= fill_index;
						incr(fill_index);
					end if;
				end if;
			end if;
		end if;
	end process ; 

	process(AXIS_ACLK)
	begin
		if(rising_edge(AXIS_ACLK)) then
			if(tx_good = '1' and rx_good = '1') then
				data_fifo(fill_index) <= S_AXIS_TDATA;
			end if;
		end if;
	end process;



	process(AXIS_ACLK)
	begin
		if(rising_edge(AXIS_ACLK)) then
			if (AXIS_ARESETN = '0') then
				fill_count <= 0;
			else
				if(tx_good = '1' and rx_good = '1' and fill_count < RAMDEPTH) then
					fill_count <= fill_count + 1;
				end if;
			end if;
		end if;
	end process;

    stream_data_out <= S_AXIS_TDATA when reverse_in = '0' and reverse_data = '0' else data_fifo(fifo_index);
	M00_AXIS_TDATA <= stream_data_out(23 downto 0);
	M01_AXIS_TDATA <= stream_data_out(31 downto 24);
	M02_AXIS_TDATA <= stream_data_out(39 downto 32);
	M03_AXIS_TDATA <= stream_data_out(47 downto 40);
	M04_AXIS_TDATA <= stream_data_out(55 downto 48);
	M05_AXIS_TDATA <= stream_data_out(63 downto 56);

    M00_AXIS_TVALID <= write_stream;
	-- only the timer can control the ready. it is assumed that the motor controllers are alwasy ready
    S_AXIS_TREADY <= read_stream;

    M01_AXIS_TVALID <= write_stream;

    M02_AXIS_TVALID <= write_stream;

    M03_AXIS_TVALID <= write_stream;

    M04_AXIS_TVALID <= write_stream;

    M05_AXIS_TVALID <= write_stream;
end arch_imp;
