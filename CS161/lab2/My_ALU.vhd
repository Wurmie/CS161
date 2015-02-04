----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:59:01 02/04/2015 
-- Design Name: 
-- Module Name:    my_alu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use ieee.std_logic_unsigned.all ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_alu is
	generic(NUMBITS: natural :=12); --number of total bits
	Port ( A : in STD_LOGIC_VECTOR (NUMBITS-1 downto 0);
			B : in STD_LOGIC_VECTOR (NUMBITS-1 downto 0);
			opcode : in STD_LOGIC_VECTOR (3 downto 0);
			result : out STD_LOGIC_VECTOR (NUMBITS-1 downto 0);
			carry : out STD_LOGIC;
			overflow : out STD_LOGIC;
			zero : out STD_LOGIC);
end my_alu;

architecture Behavioral of my_alu is
signal total: std_logic_vector(NUMBITS downto 0);
begin

	process(A,B,opcode,total)
	begin
	case opcode is
		when "1000" => --unsigned add
			total <= std_logic_vector(unsigned('0' &A) + unsigned('0' &B));
			--result <= total(NUMBITS-1 downto 0);
--			for i in 0 to 7 loop --number of shifts
--				for j in 3 to NUMBITS-1 loop --Checking each column
--					if total(j downto j-3) > "0100" then
--						total(j downto j-3) <= total(j downto j-3) + "0011";
--					end if;
--				end loop;
--			end loop;
			result <= total;
		when others =>
--need while loop to add every 4 bits together
	end case;
	end process;

end Behavioral;

