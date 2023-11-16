library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity tb is
end tb;


architecture behavioral of tb is

    component add_multiply_test is
        port (
            i_a: in std_logic_vector (word_len - 1 downto 0);
            i_b: in std_logic_vector (word_len - 1 downto 0);
            i_ck: in std_logic;
            o_z: out std_logic_vector (2*word_len - 1 downto 0)
        );
    end component;

    signal ck: std_logic;
    signal a: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal b: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal result: std_logic_vector (word_len*2 - 1 downto 0);

    constant tck: time := 10ns;
    constant a_val: std_logic_vector := b"001010101010111011";
    constant b_val: std_logic_vector := b"000110000000001011";

begin

    dut: add_multiply_test
    port map (
        i_a => a,
        i_b => b,
        i_ck => ck,
        o_z => result
    );

    ck_gen: process
    begin

        ck <= '1';
        wait for tck/2;
        ck <= '0';
        wait for tck/2;

    end process ck_gen;


    test_sig: process
    begin

        wait for 2*tck;
        b <= b_val;
        
        wait for 4*tck;
        a <= a_val;

        wait for 4*tck;

        ------------------------------VERIFICATION------------------------------------------
        ------------------------------------------------------------------------------------
        --                                                                                --
        --      result should be x"024084079" for 4 cycles, and then x"06415b682"         --
        --                                                                                --
        ------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------

    end process test_sig;


end behavioral;