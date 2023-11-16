library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity tb is
end tb;


architecture behavioral of tb is

    component update_kappa is
        port (
            ck : in std_logic;
            Kb1_m : in std_logic_vector (17 downto 0);
            Kf1_m : in std_logic_vector (17 downto 0);
            beta1_m : in std_logic_vector (17 downto 0);
            chif_m : in std_logic_vector (17 downto 0);
            eb_m1 : in std_logic_vector (17 downto 0);
            ef_m : in std_logic_vector (17 downto 0);
            ef_m1 : in std_logic_vector (17 downto 0);
            gam1_m : in std_logic_vector (17 downto 0);
            Kf_m : out std_logic_vector (17 downto 0);
            Kb_m : out std_logic_vector (17 downto 0)
        );
    end component;

    signal ck: std_logic;
    signal kb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal kf: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal eb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal ef: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal beta: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal chi: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal gam: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal kb_res: std_logic_vector (word_len - 1 downto 0);
    signal kf_res: std_logic_vector (word_len - 1 downto 0);

    constant tck: time := 10ns;
    constant a_val: std_logic_vector := b"001010101010111011";
    constant b_val: std_logic_vector := b"000110000000001011";
    constant c_val: std_logic_vector := b"000101010100010111";
    constant d_val: std_logic_vector := b"000111111100010111";
    constant e_val: std_logic_vector := b"000011100000110000";
    constant f_val: std_logic_vector := b"000010000000111111";

begin

    dut: update_kappa
    port map (
        ck => ck,
        Kb1_m => kb,
        Kf1_m => kf,
        beta1_m => beta,
        chif_m => chi,
        eb_m1 => eb,
        ef_m => ef,
        ef_m1 => ef,
        gam1_m => gam,
        Kf_m => kf_res,
        Kb_m => kb_res
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
        beta <= d_val;
        gam <= e_val;
        chi <= f_val;

        wait for 4*tck;

        wait for 20*tck;

        ------------------------------VERIFICATION------------------------------------------
        ------------------------------------------------------------------------------------
        --                                                                                --
        --      The decimal values of the results should be kb_res = 0.947052001953125    --
        --      and kf_res = 1.98910522460938, which in 18 bit fixed point with fraction  --
        --      length of 15 correspond to x"07939" and x"0fe9b", respectively.           --
        --                                                                                --
        ------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------

    end process test_sig;


end behavioral;