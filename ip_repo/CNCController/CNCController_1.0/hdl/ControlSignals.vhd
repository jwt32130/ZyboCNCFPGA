----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2021 11:28:13 PM
-- Design Name: 
-- Module Name: ColtrolSignals - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ControlSignals is
    Port ( 
        S_AXIS_tdata : in STD_LOGIC_VECTOR (23 downto 0);
        S_AXIS_tready : out std_logic;
        S_AXIS_tvalid : in std_logic;
        S_AXIS_ARESETN : in std_logic;
        S_AXIS_ACLK : in std_logic
        -- reverse_sigin : in std_logic


    );
end ControlSignals;

architecture Behavioral of ControlSignals is
    signal timer_count : unsigned(23 downto 0);
    signal new_data_ready : std_logic;
    signal clock_data_in : std_logic;
    signal rx_en : std_logic;
begin
    --timer resets at 2 because of the delay to read and delay to finish. easy way to fix the shifts without trying to correct on read.
    --minimum 2 pulse delay but should realistically never be a problem
    new_data_ready <= '1' when (S_AXIS_tvalid = '1' and timer_count <= x"000002") else '0';
    S_AXIS_tready <= clock_data_in;
    rx_en <= clock_data_in and S_AXIS_tvalid;
    process( S_AXIS_ACLK)
    begin
        if(rising_edge(S_AXIS_ACLK)) then
            if S_AXIS_ARESETN = '0' then
                clock_data_in <= '0';
            else
                if(new_data_ready = '1' and clock_data_in = '0') then
                    clock_data_in <= '1';
                else
                    clock_data_in <= '0';
                end if;
            end if;
        end if;
    end process;
    process( S_AXIS_ACLK )
    begin
        if rising_edge(S_AXIS_ACLK) then
            if S_AXIS_ARESETN = '0' then
                timer_count <= (others => '0');
            else
                if(rx_en = '1') then
                    timer_count(23 downto 0) <= unsigned(S_AXIS_tdata(23 downto 0));
                else
                    if(timer_count > 0) then
                        timer_count <= timer_count - 1;
                    end if;
                end if;
            end if;
        end if;
    end process ;


end Behavioral;
