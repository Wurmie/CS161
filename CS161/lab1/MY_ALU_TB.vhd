------------------------------------------------------------------------------
--Company:
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
         opcode : IN  std_logic_vector(0 to 2);
         result : OUT  std_logic_vector;
         carry : OUT  std_logic;
         overflow : OUT  std_logic;
         zero : OUT  std_logic
        );
    END COMPONENT;
  

   --Inputs
   signal A : std_logic_vector(0 to 7) := (others => '0');
   signal B : std_logic_vector(0 to 7) := (others => '0');
   signal opcode : std_logic_vector(0 to 2) := (others => '0');

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
        opcode <= "000";
      
            -- Test 1
            A <= conv_std_logic_vector(2, 8);
            B <= conv_std_logic_vector(2, 8);
          
            wait for 10 ns;
            assert result = conv_std_logic_vector(4, 8)     report "Test_1: result incorrect"     severity Warning;
            assert carry = '0'                                 report "Test_1: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_1: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_1: zero incorrect"        severity Warning;
          
          
            -- Test 2
            A <= conv_std_logic_vector(0, 8);
            B <= conv_std_logic_vector(0, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(0, 8)     report "Test_2: result incorrect"     severity Warning;
            assert carry = '0'                                 report "Test_2: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_2: overflow incorrect"    severity Warning;
            assert zero = '1'                                        report "Test_2: zero incorrect"        severity Warning;
          
            -- Test 3
            A <= conv_std_logic_vector(128, 8);
            B <= conv_std_logic_vector(4, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(132, 8) report "Test_3: result incorrect"     severity Warning;
            assert carry = '0'                                  report "Test_3: carryout incorrect"    severity Warning;
            assert overflow = '0'                                  report "Test_3: overflow incorrect"    severity Warning;
            assert zero = '0'                                         report "Test_3: zero incorrect"        severity Warning;
      
            -- Test 4
            A <= conv_std_logic_vector(128, 8);
            B <= conv_std_logic_vector(128, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(0, 8)     report "Test_4: result incorrect"     severity Warning;
            assert carry = '1'                                 report "Test_4: carryout incorrect"    severity Warning;
            assert overflow = '1'                                 report "Test_4: overflow incorrect"    severity Warning;
            assert zero = '1'                                        report "Test_4: zero incorrect"        severity Warning;
          
            -- Test 5
            A <= conv_std_logic_vector(128, 8);
            B <= conv_std_logic_vector(132, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(4, 8)     report "Test_5: result incorrect"     severity Warning;
            assert carry = '1'                                 report "Test_5: carryout incorrect"    severity Warning;
            assert overflow = '1'                                 report "Test_5: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_5: zero incorrect"        severity Warning;
          
        report "Testing signed add";
            opcode <= "001";
          
            -- Test 6
            A <= conv_std_logic_vector(-1, 8);
            B <= conv_std_logic_vector(1, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(0, 8)     report "Test_6: result incorrect"     severity Warning;
            assert carry = '0'                                 report "Test_6: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_6: overflow incorrect"    severity Warning;
            assert zero = '1'                                        report "Test_6: zero incorrect"        severity Warning;
          
            -- Test 7
            A <= conv_std_logic_vector(-2, 8);
            B <= conv_std_logic_vector(-3, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(-5, 8)     report "Test_7: result incorrect"     severity Warning;
            assert carry = '1'                                    report "Test_7: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_7: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_7: zero incorrect"        severity Warning;
          
            -- Test 8
            A <= conv_std_logic_vector(127, 8);
            B <= conv_std_logic_vector(126, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(-3, 8)     report "Test_8: result incorrect"     severity Warning;
            assert carry = '0'                                    report "Test_8: carryout incorrect"    severity Warning;
            assert overflow = '1'                                 report "Test_8: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_8: zero incorrect"        severity Warning;
          
            -- Test 9
            A <= conv_std_logic_vector(-127, 8);
            B <= conv_std_logic_vector(-127, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(2, 8)     report "Test_9: result incorrect"     severity Warning;
            assert carry = '1'                                    report "Test_9: carryout incorrect"    severity Warning;
            assert overflow = '1'                                 report "Test_9: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_9: zero incorrect"        severity Warning;
          
            -- Test 10
            A <= conv_std_logic_vector(5, 8);
            B <= conv_std_logic_vector(-4, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(1, 8)     report "Test_10: result incorrect"     severity Warning;
            assert carry = '0'                                    report "Test_10: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_10: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_10: zero incorrect"        severity Warning;
          
            -- Test 11
            A <= conv_std_logic_vector(-5, 8);
            B <= conv_std_logic_vector(4, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(-1, 8)     report "Test_11: result incorrect"     severity Warning;
            assert carry = '1'                                    report "Test_11: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_11: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_11: zero incorrect"        severity Warning;
          
        report "010: Unsigned Subtraction";
            opcode <= "010";
            --Test 12
            A <= conv_std_logic_vector(1, 8);
            B <= conv_std_logic_vector(2, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(-1, 8)     report "Test_12: result incorrect"     severity Warning;

            assert carry = '1'                                    report "Test_12: carryout incorrect"    severity Warning;
            assert overflow = '1'                                 report "Test_12: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_12: zero incorrect"        severity Warning;
				
				--Test 13
            A <= conv_std_logic_vector(2, 8);
            B <= conv_std_logic_vector(1, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(1, 8)     report "Test_13: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_13: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_13: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_13: zero incorrect"        severity Warning;
				
				--Test 14
            A <= conv_std_logic_vector(1, 8);
            B <= conv_std_logic_vector(1, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(0, 8)     report "Test_14: result incorrect"     severity Warning;

            assert carry = '1'                                    report "Test_14: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_14: overflow incorrect"    severity Warning;
            assert zero = '1'                                        report "Test_14: zero incorrect"        severity Warning;
				
				report "011: Signed Subtraction";
            opcode <= "011";
				
            --Test 15
            A <= conv_std_logic_vector(1, 8);
            B <= conv_std_logic_vector(2, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(-1, 8)     report "Test_15: result incorrect"     severity Warning;

            assert carry = '1'                                    report "Test_15: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_15: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_15: zero incorrect"        severity Warning;
				
				--Test 16
            A <= conv_std_logic_vector(2, 8);
            B <= conv_std_logic_vector(1, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(1, 8)     report "Test_16: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_16: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_16: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_16: zero incorrect"        severity Warning;
				
				--Test 17
            A <= conv_std_logic_vector(1, 8);
            B <= conv_std_logic_vector(1, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(0, 8)     report "Test_17: result incorrect"     severity Warning;

            assert carry = '1'                                    report "Test_17: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_17: overflow incorrect"    severity Warning;
            assert zero = '1'                                        report "Test_17: zero incorrect"        severity Warning;
				
				--Test 18
            A <= conv_std_logic_vector(-2, 8);
            B <= conv_std_logic_vector(1, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(-3, 8)     report "Test_18: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_18: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_18: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_18: zero incorrect"        severity Warning;
				
				--Test 19
            A <= conv_std_logic_vector(-1, 8);
            B <= conv_std_logic_vector(2, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(-3, 8)     report "Test_19: result incorrect"     severity Warning;

            assert carry = '1'                                    report "Test_19: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_19: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_19: zero incorrect"        severity Warning;
				
				--Test 20
            A <= conv_std_logic_vector(1, 8);
            B <= conv_std_logic_vector(-2, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(3, 8)     report "Test_20: result incorrect"     severity Warning;

            assert carry = '1'                                    report "Test_20: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_20: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_20: zero incorrect"        severity Warning;
				
				--Test 21
            A <= conv_std_logic_vector(2, 8);
            B <= conv_std_logic_vector(-1, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(3, 8)     report "Test_21: result incorrect"     severity Warning;

            assert carry = '1'                                    report "Test_21: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_21: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_21: zero incorrect"        severity Warning;
				
				--Test 22
            A <= conv_std_logic_vector(-2, 8);
            B <= conv_std_logic_vector(-1, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(-1, 8)     report "Test_22: result incorrect"     severity Warning;

            assert carry = '1'                                    report "Test_22: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_22: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_22: zero incorrect"        severity Warning;
				
				--Test 23A
            A <= conv_std_logic_vector(-1, 8);
            B <= conv_std_logic_vector(-2, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(1, 8)     report "Test_23A: result incorrect"     severity Warning;

            assert carry = '1'                                    report "Test_23A: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_23A: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_23A: zero incorrect"        severity Warning;
				
				--Test 24A
            A <= conv_std_logic_vector(-1, 8);
            B <= conv_std_logic_vector(-1, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(0, 8)     report "Test_24A: result incorrect"     severity Warning;

            assert carry = '1'                                    report "Test_24A: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_24A: overflow incorrect"    severity Warning;
            assert zero = '1'                                        report "Test_24A: zero incorrect"        severity Warning;

        report "100: BITWISE AND";
            opcode <= "100";
            --Test 23
            A <= conv_std_logic_vector(0, 8);
            B <= conv_std_logic_vector(0, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(0, 8)     report "Test_23: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_23: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_23: overflow incorrect"    severity Warning;
            assert zero = '1'                                        report "Test_23: zero incorrect"        severity Warning;
				
				--Test 24
            A <= conv_std_logic_vector(1, 8);
            B <= conv_std_logic_vector(0, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(0, 8)     report "Test_24: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_24: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_24: overflow incorrect"    severity Warning;
            assert zero = '1'                                        report "Test_24: zero incorrect"        severity Warning;
				
				--Test 25
            A <= conv_std_logic_vector(0, 8);
            B <= conv_std_logic_vector(1, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(0, 8)     report "Test_25: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_25: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_25: overflow incorrect"    severity Warning;
            assert zero = '1'                                        report "Test_25: zero incorrect"        severity Warning;
				
				--Test 26
            A <= conv_std_logic_vector(1, 8);
            B <= conv_std_logic_vector(1, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(1, 8)     report "Test_26: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_26: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_26: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_26: zero incorrect"        severity Warning;
				
			report "101: BITWISE OR";
            opcode <= "101";
            --Test 27
            A <= conv_std_logic_vector(0, 8);
            B <= conv_std_logic_vector(0, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(0, 8)     report "Test_27: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_27: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_27: overflow incorrect"    severity Warning;
            assert zero = '1'                                        report "Test_27: zero incorrect"        severity Warning;
				
				--Test 28
            A <= conv_std_logic_vector(1, 8);
            B <= conv_std_logic_vector(0, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(1, 8)     report "Test_28: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_28: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_28: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_28: zero incorrect"        severity Warning;
				
				--Test 29
            A <= conv_std_logic_vector(0, 8);
            B <= conv_std_logic_vector(1, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(1, 8)     report "Test_29: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_29: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_29: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_29: zero incorrect"        severity Warning;
				
				--Test 30
            A <= conv_std_logic_vector(1, 8);
            B <= conv_std_logic_vector(1, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(1, 8)     report "Test_30: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_30: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_30: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_30: zero incorrect"        severity Warning;
				
				report "110: BITWISE XOR";
            opcode <= "110";
            --Test 31
            A <= conv_std_logic_vector(0, 8);
            B <= conv_std_logic_vector(0, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(0, 8)     report "Test_31: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_31: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_31: overflow incorrect"    severity Warning;
            assert zero = '1'                                        report "Test_31: zero incorrect"        severity Warning;
				
				--Test 32
            A <= conv_std_logic_vector(1, 8);
            B <= conv_std_logic_vector(0, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(1, 8)     report "Test_32: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_32: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_32: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_32: zero incorrect"        severity Warning;
				
				--Test 33
            A <= conv_std_logic_vector(0, 8);
            B <= conv_std_logic_vector(1, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(1, 8)     report "Test_33: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_33: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_33: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_33: zero incorrect"        severity Warning;
				
				--Test 34
            A <= conv_std_logic_vector(1, 8);
            B <= conv_std_logic_vector(1, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(0, 8)     report "Test_34: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_34: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_34: overflow incorrect"    severity Warning;
            assert zero = '1'                                        report "Test_34: zero incorrect"        severity Warning;
				
				report "111: DIVIDE BY 2";
            opcode <= "111";
            --Test 35
            A <= conv_std_logic_vector(0, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(0, 8)     report "Test_23: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_23: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_23: overflow incorrect"    severity Warning;
            assert zero = '1'                                        report "Test_23: zero incorrect"        severity Warning;
				
				--Test 36
            A <= conv_std_logic_vector(1, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(0, 8)     report "Test_24: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_24: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_24: overflow incorrect"    severity Warning;
            assert zero = '1'                                        report "Test_24: zero incorrect"        severity Warning;
				
				--Test 37
            A <= conv_std_logic_vector(4, 8);

            wait for 10 ns;
            assert result = conv_std_logic_vector(2, 8)     report "Test_25: result incorrect"     severity Warning;

            assert carry = '0'                                    report "Test_25: carryout incorrect"    severity Warning;
            assert overflow = '0'                                 report "Test_25: overflow incorrect"    severity Warning;
            assert zero = '0'                                        report "Test_25: zero incorrect"        severity Warning;
				
        wait;
   end process;

END;
