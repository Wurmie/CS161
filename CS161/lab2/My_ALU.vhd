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

--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   21:10:35 01/14/2015
-- Design Name: 
-- Module Name:   /home/csmajs/vnguy057/Desktop/Lab1_REDO/MY_ALU_8_BIT_TB.vhd
-- Project Name:  Lab1_REDO
-- Target Device:
-- Tool versions:
-- Description: 
-- 
-- VHDL Test Bench Created by ISE for module: MY_ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes:
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_arith.all;
 
ENTITY my_alu_8bit_tb IS
END my_alu_8bit_tb;
 
ARCHITECTURE behavior OF my_alu_8bit_tb IS
 
    COMPONENT my_alu
     generic(
        NUMBITS    : natural    := 8
     );
    PORT(
         A : IN  std_logic_vector;
         B : IN  std_logic_vector;
         opcode : IN  std_logic_vector(0 to 3);
         result : OUT  std_logic_vector;
         carry : OUT  std_logic;
         overflow : OUT  std_logic;
         zero : OUT  std_logic
        );
    END COMPONENT;
  

   --Inputs
   signal A : std_logic_vector(0 to 7) := (others => '0');
   signal B : std_logic_vector(0 to 7) := (others => '0');
   signal opcode : std_logic_vector(0 to 3) := (others => '0');

     --Outputs
   signal result : std_logic_vector(0 to 7);
   signal carry : std_logic;
   signal overflow : std_logic;
   signal zero : std_logic;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: my_alu generic map(
        NUMBITS => 8

    )
    PORT MAP (
          A => A,
          B => B,
          opcode => opcode,
          result => result,
          carry => carry,
          overflow => overflow,
          zero => zero
        );


   -- Stimulus process
   stim_proc: process
   begin      
      -- hold reset state for 100ms.
        wait for 10 ns;
      
        -- --------------------------------------------------------------------------------
        -- --------------------------------------------------------------------------------
        -- Testing Unsigned Add
        -- --------------------------------------------------------------------------------
        -- --------------------------------------------------------------------------------
        report "Testing Unsigned Add";
        opcode <= "1000";
      
            -- Test 1
            A <= conv_std_logic_vector(2, 8);
            B <= conv_std_logic_vector(2, 8);
          
            wait for 10 ns;
            assert result = conv_std_logic_vector(4, 8)     report "Test_1: result incorrect"     severity Warning;
--            assert carry = '0'                                 report "Test_1: carryout incorrect"    severity Warning;
--            assert overflow = '0'                                 report "Test_1: overflow incorrect"    severity Warning;
--            assert zero = '0'                                        report "Test_1: zero incorrect"        severity Warning;

            -- Test 2
            A <= conv_std_logic_vector(8, 8);
            B <= conv_std_logic_vector(2, 8);
          
            wait for 10 ns;
            assert result = conv_std_logic_vector(16, 8)     report "Test_2: result incorrect"     severity Warning;
--            assert carry = '0'                                 report "Test_1: carryout incorrect"    severity Warning;
--            assert overflow = '0'                                 report "Test_1: overflow incorrect"    severity Warning;
--            assert zero = '0'                                        report "Test_1: zero incorrect"        severity Warning;
          
       
				
        wait;
   end process;

END;
