----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/10/2021 01:18:10 PM
-- Design Name: 
-- Module Name: LatchAndClear - Behavioral
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

entity LatchAndClear is
    Port ( latchsig : in STD_LOGIC;
           clearsig : in STD_LOGIC;
           resetn : in STD_LOGIC;
           clk : in STD_LOGIC;
           outsig : out STD_LOGIC);
end LatchAndClear;

architecture Behavioral of LatchAndClear is

begin

    process( clk )
    begin
        if rising_edge(clk) then
            if(resetn = '0') then
                outsig <= '1';
            else
                if(latchsig = '1') then
                    outsig <= '1';
                elsif(clearsig = '1') then
                    outsig <= '0';
                end if;
            end if;
        end if;
        
    end process ; 

end Behavioral;
