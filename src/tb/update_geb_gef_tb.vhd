library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity tb is
end tb;


architecture behavioral of tb is

    component update_geb_gef is
        port (
            ck : in std_logic;
            gam_m1 : in std_logic_vector ( 17 downto 0 );
            eb_m1 : in std_logic_vector ( 17 downto 0 );
            gam1_m1 : in std_logic_vector ( 17 downto 0 );
            ef_m1 : in std_logic_vector ( 17 downto 0 );
            geb_m1 : out std_logic_vector ( 17 downto 0 );
            gef_m1 : out std_logic_vector ( 17 downto 0 )
        );
    end component;

    signal ck: std_logic;
    signal gam: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal eb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal gam1: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal ef: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal geb_out: std_logic_vector (word_len - 1 downto 0);
    signal gef_out: std_logic_vector (word_len - 1 downto 0);

    constant tck: time := 10ns;
    constant gam_val: std_logic_vector := b"001010101010111011";
    constant eb_val: std_logic_vector := b"001011111110111011";
    constant gam1_val: std_logic_vector := b"000110000000001011";
    constant ef_val: std_logic_vector := b"000101010100010111";

    constant geb_m1: signed := signed(gam_val)*signed(eb_val);
    constant gef_m1: signed := signed(gam1_val)*signed(ef_val);

    constant geb_result: std_logic_vector := std_logic_vector(geb_m1(frac_len + word_len - 1 downto frac_len));
    constant gef_result: std_logic_vector := std_logic_vector(gef_m1(frac_len + word_len - 1 downto frac_len));

begin

    dut: update_geb_gef
    port map (
        ck => ck,
        gam_m1 => gam,
        eb_m1 => eb,
        gam1_m1 => gam1,
        ef_m1 => ef,
        geb_m1 => geb_out,
        gef_m1 => gef_out
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
        gam <= gam_val;
        gam1 <= gam1_val;
        
        wait for tck;

        assert geb_out = geb_result report "incorrect output on eb" severity error;
        assert gef_out = gef_result report "incorrect output on ef" severity error;

        wait for tck/2;

    end process test_sig;


end behavioral;