library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity tb is
end tb;


architecture behavioral of tb is

    component update_block is
        port (
            ck : in std_logic;
            div_data_valid : in std_logic;
            gam1_m : in std_logic_vector ( 17 downto 0 );
            gam_m : in std_logic_vector ( 17 downto 0 );
            beta1_m : in std_logic_vector ( 17 downto 0 );
            eb1_m : in std_logic_vector ( 17 downto 0 );
            eb_m : in std_logic_vector ( 17 downto 0 );
            ef_m : in std_logic_vector ( 17 downto 0 );
            Kb1_m : in std_logic_vector ( 17 downto 0 );
            Kf1_m : in std_logic_vector ( 17 downto 0 );
            chib_m : in std_logic_vector ( 17 downto 0 );
            chib1_m : in std_logic_vector ( 17 downto 0 );
            chif_m : in std_logic_vector ( 17 downto 0 );
            e_m : in std_logic_vector ( 17 downto 0 );
            ys_m : in std_logic_vector ( 17 downto 0 );
            v1_m : in std_logic_vector ( 17 downto 0 );
            gam_m1 : out std_logic_vector ( 17 downto 0 );
            beta_m : out std_logic_vector ( 17 downto 0 );
            eb_m1 : out std_logic_vector ( 17 downto 0 );
            ef_m1 : out std_logic_vector ( 17 downto 0 );
            chib_m1 : out std_logic_vector ( 17 downto 0 );
            chif_m1 : out std_logic_vector ( 17 downto 0 );
            Kb_m : out std_logic_vector ( 17 downto 0 );
            Kf_m : out std_logic_vector ( 17 downto 0 );
            e_m1 : out std_logic_vector ( 17 downto 0 );
            ys_m1 : out std_logic_vector ( 17 downto 0 );
            v_m : out std_logic_vector ( 17 downto 0 );
            div_data_out_valid : out std_logic;
            divisor_ready : out std_logic;
            dividend_ready : out std_logic
        );
    end component;

    signal ck: std_logic;
    signal valid: std_logic;
    signal out_valid: std_logic;
    signal ready1: std_logic;
    signal ready2: std_logic;
    signal gam: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal gam1: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal beta: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal eb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal eb1: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal ef: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal kb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal kf: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal chib: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal chif: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal v: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal e: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal ys: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal gam_res: std_logic_vector (word_len - 1 downto 0);
    signal kb_res: std_logic_vector (word_len - 1 downto 0);
    signal kf_res: std_logic_vector (word_len - 1 downto 0);
    signal beta_res: std_logic_vector (word_len - 1 downto 0);
    signal eb_res: std_logic_vector (word_len - 1 downto 0);
    signal ef_res: std_logic_vector (word_len - 1 downto 0);
    signal chib_res: std_logic_vector (word_len - 1 downto 0);
    signal chif_res: std_logic_vector (word_len - 1 downto 0);
    signal e_res: std_logic_vector (word_len - 1 downto 0);
    signal ys_res: std_logic_vector (word_len - 1 downto 0);
    signal v_res: std_logic_vector (word_len - 1 downto 0);

    constant tck: time := 10ns;
    constant a_val: std_logic_vector := b"001010101010111011";
    constant b_val: std_logic_vector := b"000110000000001011";
    constant c_val: std_logic_vector := b"000101010100010111";
    constant d_val: std_logic_vector := b"000111111100010111";
    constant e_val: std_logic_vector := b"000011100000110000";
    constant f_val: std_logic_vector := b"000010000000111111";
    constant g_val: std_logic_vector := b"000011111110111111";
    constant h_val: std_logic_vector := b"000011111100001111";
    constant i_val: std_logic_vector := b"000111111110111111";

begin

    dut: update_block
    port map (
        ck => ck,
        div_data_valid => valid,
        gam1_m => gam1,
        gam_m => gam,
        Kb1_m => kb,
        Kf1_m => kf,
        beta1_m => beta,
        chib_m => chib,
        chib1_m => chib,
        chif_m => chif,
        eb1_m => eb1,
        eb_m => eb,
        ef_m => ef,
        e_m => e,
        ys_m => ys,
        v1_m => v,
        gam_m1 => gam_res,
        eb_m1 => eb_res,
        ef_m1 => ef_res,
        beta_m => beta_res,
        Kb_m => kb_res,
        Kf_m => kf_res,
        chib_m1 => chib_res,
        chif_m1 => chif_res,
        e_m1 => e_res,
        ys_m1 => ys_res,
        v_m => v_res,
        div_data_out_valid => out_valid,
        divisor_ready => ready1,
        dividend_ready => ready2
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

        valid <= '0';

        wait for 0.5*tck;
        valid <= '1';
        eb <= a_val;
        eb1 <= a_val;
        ef <= b_val;
        kb <= c_val;
        kf <= d_val;
        beta <= e_val;
        gam <= f_val;
        gam1 <= f_val;
        chib <= g_val;
        chif <= h_val;
        e <= i_val;
        v <= a_val;

        wait for 1*tck;
        valid <= '0';
        eb <= (others => '0');
        eb1 <= (others => '0');
        ef <= (others => '0');
        kb <= (others => '0');
        kf <= (others => '0');
        beta <= (others => '0');
        gam <= (others => '0');
        gam1 <= (others => '0');
        chib <= (others => '0');
        chif <= (others => '0');
        e <= (others => '0');
        ys <= (others => '0');
        v <= (others => '0');


        wait for 36*tck;

        wait for 4*tck;

        ------------------------------VERIFICATION------------------------------------------
        ------------------------------------------------------------------------------------
        --                                                                                --
        --                                                                                --
        ------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------

    end process test_sig;


end behavioral;