-------------------------------------------------------------------------------
--Company:
-- Engineer:
-- 
-- Create Date:    14:53:57 02/03/2015
-- Design Name:
-- Module Name:    BCD_arithmetic - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_alu is
    generic(NUMBITS: natural :=32); --number of total bits
    Port ( A : in  STD_LOGIC_VECTOR (NUMBITS-1 downto 0);
           B : in  STD_LOGIC_VECTOR (NUMBITS-1 downto 0);
           opcode : in  STD_LOGIC_VECTOR (2 downto 0);
           result : out  STD_LOGIC_VECTOR (NUMBITS-1 downto 0);
           carry : out  STD_LOGIC;
           overflow : out  STD_LOGIC;
           zero : out  STD_LOGIC);
end my_alu;

architecture Behavioral of my_alu is
signal total: std_logic_vector(NUMBITS downto 0);
begin
    process(A,B,opcode,total)
    begin
        case opcode is
            when "1000" => --unsigned add
            --need while loop to add every 4 bits together
            result <= total(NUMBITS-1 downto 0);
            overflow <= total(NUMBITS);
            carry <= total(NUMBITS);
            if (unsigned(total(NUMBITS-1 downto 0)) = 0) then
                zero <= '1';
            else
                zero <= '0';
            end if;
          
            when "1001" =>
            total <= std_logic_vector(signed(A(NUMBITS-1) & A) + signed(B(NUMBITS-1) & B));
            result <= total(NUMBITS-1 downto 0);
            if (((signed(A) >= 0) and (signed(B) >= 0) and (signed(total(NUMBITS-1 downto 0)) < 0)) or
                    ((signed(A) < 0) and (signed(B) < 0) and (signed(total(NUMBITS-1 downto 0)) >= 0))) then
                overflow <= '1';
            else
                overflow <= '0';
            end if;
                carry <= total(NUMBITS);
            if (signed(total) = 0) then
                zero <= '1';
            else
                zero <= '0';
            end if;
          
            when "1100" =>
            total <= std_logic_vector(unsigned('0' & A) - unsigned('0' & B));
            result <= total(NUMBITS-1 downto 0);
            if (unsigned(A) > unsigned(B)) then
                carry <= '0';
            else
                carry <= '1';
            end if;
                if (unsigned(A) >= unsigned(B)) then
                     overflow <= '0';
            else
                     overflow <= '1';
            end if;
            if (signed(total) = 0) then
                zero <= '1';
            else
                zero <= '0';
            end if;
          
            when "1101" =>
            total <= std_logic_vector(signed(A(NUMBITS-1) & A) - signed(B(NUMBITS-1) & B));
            result <= total(NUMBITS-1 downto 0);
            if (((signed(A) >= 0) and (signed(B) < 0) and (signed(total(NUMBITS-1 downto 0)) < 0)) or
                ((signed(A) < 0) and (signed(B) >= 0) and (signed(total(NUMBITS-1 downto 0)) >= 0))) then
                overflow <= '1';
            else
                overflow <= '0';
            end if;
            carry <= total(NUMBITS);
            if (signed(total) = 0) then
                zero <= '1';
            else
                zero <= '0';
            end if;
                when others =>
          
        end case;
    end process;

end Behavioral;
