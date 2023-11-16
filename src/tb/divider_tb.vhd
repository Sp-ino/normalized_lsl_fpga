library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity tb is
end tb;


architecture behavioral of tb is

    component divider_test is
        port (
            i_a: in std_logic_vector (word_len - 1 downto 0);
            i_b: in std_logic_vector (word_len - 1 downto 0);
            i_ck: in std_logic;
            valid: in std_logic;
            o_valid: out std_logic;
            o_aready: out std_logic;
            o_bready: out std_logic;
            o_res: out std_logic_vector (divider_out_len - 1 downto 0)
        );
    end component;

    signal ck: std_logic;
    signal ival: std_logic := '0';
    signal oval: std_logic;
    signal aready: std_logic;
    signal bready: std_logic;
    signal a: std_logic_vector (word_len - 1 downto 0) := b"000000000000000001";
    signal b: std_logic_vector (word_len - 1 downto 0) := b"000000000000000001";
    signal result: std_logic_vector (divider_out_len - 1 downto 0);

    constant tck: time := 10ns;
    constant a_val: std_logic_vector := b"001010101010111011";
    constant b_val: std_logic_vector := b"000110000000001011";

begin

    dut: divider_test
    port map (
        i_a => a,
        i_b => b,
        i_ck => ck,
        valid => ival,
        o_valid => oval,
        o_aready => aready,
        o_bready => bready,
        o_res => result
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
        
        wait for tck;
        a <= a_val;
        b <= b_val;
        wait for tck;
        ival <= '1';
        
        wait for 2*tck;
        ival <= '0';

        wait for tck;
        a <= b_val;
        b <= a_val;
        wait for tck;
        ival <= '1';

        wait for 32*tck;

        ------------------------------VERIFICATION------------------------------------
        ------------------------------------------------------------------------------
        --                                                                          --
        -- result should be b"0000000000000000000000001110001110001010"             --
        -- exactly 4 clock cycles after ival has been asserted.         --
        --                                                                          --
        ------------------------------------------------------------------------------
        ------------------------------------------------------------------------------

    end process test_sig;


end behavioral;