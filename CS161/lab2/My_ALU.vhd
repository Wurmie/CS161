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
use ieee.std_logic_arith.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_alu is
    generic(NUMBITS: natural := 32); --number of total bits
    Port ( A : in STD_LOGIC_VECTOR (NUMBITS-1 downto 0);
            B : in STD_LOGIC_VECTOR (NUMBITS-1 downto 0);
            opcode : in STD_LOGIC_VECTOR (3 downto 0);
            result : out STD_LOGIC_VECTOR (NUMBITS+3 downto 0);
            outTotal : out STD_LOGIC_VECTOR (NUMBITS+3 downto 0);
            carry : out STD_LOGIC;
            overflow : out STD_LOGIC;
            zero : out STD_LOGIC);
end my_alu;

architecture Behavioral of my_alu is
signal total: std_logic_vector(NUMBITS downto 0);
signal sign: std_logic_vector(3 downto 0);
signal num0: std_logic_vector(3 downto 0);
signal num1: std_logic_vector(3 downto 0);
signal num2: std_logic_vector(3 downto 0);
signal num3: std_logic_vector(3 downto 0);
signal num4: std_logic_vector(3 downto 0);
signal num5: std_logic_vector(3 downto 0);
signal num6: std_logic_vector(3 downto 0);
signal num7: std_logic_vector(3 downto 0);


begin

    process(A,B,opcode,total)
    begin
    case opcode is
        when "1000" => --unsigned add
            total <= conv_std_logic_vector(unsigned('0' & A) + unsigned('0' & B));
            num0 <= conv_std_logic_vector(to_integer(unsigned(total))/1 mod 10);
            num1 <= conv_std_logic_vector(to_integer(unsigned(total))/10 mod 10);
            num2 <= conv_std_logic_vector(to_integer(unsigned(total))/100 mod 10);
            num3 <= conv_std_logic_vector(to_integer(unsigned(total))/1000 mod 10);
            num4 <= conv_std_logic_vector(to_integer(unsigned(total))/10000 mod 10);
            num5 <= conv_std_logic_vector(to_integer(unsigned(total))/100000 mod 10);
            num6 <= conv_std_logic_vector(to_integer(unsigned(total))/1000000 mod 10);
            num7 <= conv_std_logic_vector(to_integer(unsigned(total))/10000000 mod 10);
            result <= std_logic_vector("0000" & num7 & num6 & num5 & num4 & num3 & num2 & num1 & num0);
            outTotal <= "000" & total;
				overflow <= total(NUMBITS);
				carry <= total(NUMBITS);
				if (unsigned(total(NUMBITS-1 downto 0)) = 0) then
					zero <= '1';
				else
					zero <= '0';
				end if;
			when "1001" => --unsigned sub
            total <= std_logic_vector(unsigned('0' & A) - unsigned('0' & B));
            num0 <= std_logic_vector(unsigned(total) mod 10);
            num1 <= std_logic_vector(unsigned(total)/10 mod 10);
            num2 <= std_logic_vector(unsigned(total)/100 mod 10);
            num3 <= std_logic_vector(unsigned(total)/1000 mod 10);
            num4 <= std_logic_vector(unsigned(total)/10000 mod 10);
            num5 <= std_logic_vector(unsigned(total)/100000 mod 10);
            num6 <= std_logic_vector(unsigned(total)/1000000 mod 10);
            num7 <= std_logic_vector(unsigned(total)/10000000 mod 10);
            result <= std_logic_vector("0000" & num7 & num6 & num5 & num4 & num3 & num2 & num1 & num0);
            outTotal <= "000" & total;
				overflow <= total(NUMBITS);
				carry <= total(NUMBITS);
				if (unsigned(total(NUMBITS-1 downto 0)) = 0) then
					zero <= '1';
				else
					zero <= '0';
				end if;
			when "1100" => --signed add
            total <= std_logic_vector(signed('0' & A) + signed('0' & B));
				if (signed(total) >= 0) then
					num7 <= "0001";
					total <= not(total) + 1;
				else
					num7 <= "0000";
				end if;
            num0 <= std_logic_vector(unsigned(total) mod 10);
            num1 <= std_logic_vector(unsigned(total)/10 mod 10);
            num2 <= std_logic_vector(unsigned(total)/100 mod 10);
            num3 <= std_logic_vector(unsigned(total)/1000 mod 10);
            num4 <= std_logic_vector(unsigned(total)/10000 mod 10);
            num5 <= std_logic_vector(unsigned(total)/100000 mod 10);
            num6 <= std_logic_vector(unsigned(total)/1000000 mod 10);
            result <= std_logic_vector(num7 & "0000" & num6 & num5 & num4 & num3 & num2 & num1 & num0);
            outTotal <= "000" & total;
				overflow <= total(NUMBITS);
				carry <= total(NUMBITS);
				if (unsigned(total(NUMBITS-1 downto 0)) = 0) then
					zero <= '1';
				else
					zero <= '0';
				end if;
			when "1101" => --signed sub
            total <= std_logic_vector(signed('0' & A) - signed('0' & B));
				if (signed(total) >= 0) then
					num7 <= "0001";
					total <= not(total) + 1;
				else
					num7 <= "0000";
				end if;
            num0 <= std_logic_vector(unsigned(total) mod 10);
            num1 <= std_logic_vector(unsigned(total)/10 mod 10);
            num2 <= std_logic_vector(unsigned(total)/100 mod 10);
            num3 <= std_logic_vector(unsigned(total)/1000 mod 10);
            num4 <= std_logic_vector(unsigned(total)/10000 mod 10);
            num5 <= std_logic_vector(unsigned(total)/100000 mod 10);
            num6 <= std_logic_vector(unsigned(total)/1000000 mod 10);
            result <= std_logic_vector(num7 & "0000" & num6 & num5 & num4 & num3 & num2 & num1 & num0);
            outTotal <= "000" & total;
				overflow <= total(NUMBITS);
				carry <= total(NUMBITS);
				if (unsigned(total(NUMBITS-1 downto 0)) = 0) then
					zero <= '1';
				else
					zero <= '0';
				end if;
        when others =>
    end case;
    end process;

end Behavioral;
