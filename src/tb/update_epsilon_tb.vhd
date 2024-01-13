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
    signal eb_out: std_logic_vector (word_len - 1 downto 0);
    signal ef_out: std_logic_vector (word_len - 1 downto 0);

    constant tck: time := 10ns;
    constant eb_val: std_logic_vector := b"001010101010111011";
    constant ef_val: std_logic_vector := b"001011111110111011";
    constant eb_extended: std_logic_vector := b"000001010101010111011000000000000000";
    constant ef_extended: std_logic_vector := b"000001011111110111011000000000000000";
    constant kb_val: std_logic_vector := b"000110000000001011";
    constant kf_val: std_logic_vector := b"000101010100010111";

    constant kbef: signed := signed(kb_val)*signed(ef_val);
    constant kfeb: signed := signed(kf_val)*signed(eb_val);
    constant eb_result_sign: signed := signed(eb_extended) - kbef;
    constant ef_result_sign: signed := signed(ef_extended) - kfeb;
    constant eb_result: std_logic_vector := std_logic_vector(eb_result_sign(frac_len + word_len - 1 downto frac_len));
    constant ef_result: std_logic_vector := std_logic_vector(ef_result_sign(frac_len + word_len - 1 downto frac_len));

begin

    dut: update_epsilon
    port map (
        ck => ck,
        Kb1_m => kb,
        Kf1_m => kf,
        eb1_m => eb,
        ef_m => ef,
        eb_m1 => eb_out,
        ef_m1 => ef_out
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

        wait for tck/2;
        eb <= eb_val;
        ef <= ef_val;
        kb <= kb_val;
        kf <= kf_val;
        
        wait for tck;

        assert eb_out = eb_result report "incorrect output on eb" severity error;
        assert ef_out = ef_result report "incorrect output on ef" severity error;

        wait for tck/2;

    end process test_sig;


end behavioral;