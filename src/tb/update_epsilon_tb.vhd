library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity tb is
end tb;


architecture behavioral of tb is

    component update_epsilon is
        port (
            ck : in std_logic;
            Kb1_m : in std_logic_vector ( 17 downto 0 );
            Kf1_m : in std_logic_vector ( 17 downto 0 );
            eb1_m : in std_logic_vector ( 17 downto 0 );
            ef_m : in std_logic_vector ( 17 downto 0 );
            eb_m1 : out std_logic_vector ( 17 downto 0 );
            ef_m1 : out std_logic_vector ( 17 downto 0 )
        );
    end component;

    signal ck: std_logic;
    signal kb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal kf: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal eb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal ef: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal eb_res: std_logic_vector (word_len - 1 downto 0);
    signal ef_res: std_logic_vector (word_len - 1 downto 0);

    constant tck: time := 10ns;
    constant a_val: std_logic_vector := b"001010101010111011";
    constant b_val: std_logic_vector := b"000110000000001011";
    constant c_val: std_logic_vector := b"000101010100010111";

begin

    dut: update_epsilon
    port map (
        ck => ck,
        Kb1_m => kb,
        Kf1_m => kf,
        eb1_m => eb,
        ef_m => ef,
        eb_m1 => eb_res,
        ef_m1 => ef_res
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
        eb <= a_val;
        ef <= a_val;
        kb <= b_val;
        kf <= c_val;
        
        wait for 4*tck;

        wait for 20*tck;

        ------------------------------VERIFICATION------------------------------------------
        ------------------------------------------------------------------------------------
        --                                                                                --
        --      The decimal values of the results should be eb_res = 0.3330078125         --
        --      and ef_res = 0.4471435546875, which in 18 bit fixed point with fraction   --
        --      length of 15 correspond to x"02aa0" and x"0393c", respectively.           --
        --                                                                                --
        ------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------

    end process test_sig;


end behavioral;