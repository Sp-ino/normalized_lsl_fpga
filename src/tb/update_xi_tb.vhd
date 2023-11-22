library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity tb is
end tb;


architecture behavioral of tb is

    component update_xi is
        port (
            ck : in std_logic;
            eb_m1 : in std_logic_vector (word_len - 1 downto 0);
            ef_m1 : in std_logic_vector (word_len - 1 downto 0);
            geb_m1 : in std_logic_vector (word_len - 1 downto 0);
            gef_m1 : in std_logic_vector (word_len - 1 downto 0);
            xib1_m1 : in std_logic_vector (word_len - 1 downto 0);
            xif1_m1 : in std_logic_vector (word_len - 1 downto 0);
            xib_m1 : out std_logic_vector (word_len - 1 downto 0);
            xif_m1 : out std_logic_vector (word_len - 1 downto 0)
        );
    end component;

    signal ck: std_logic;
    signal geb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal gef: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal eb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal ef: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal xib: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal xif: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal xib_out: std_logic_vector (word_len - 1 downto 0);
    signal xif_out: std_logic_vector (word_len - 1 downto 0);

    constant tck: time := 10ns;
    
    constant xib_val: std_logic_vector := b"001010101010111011";
    constant xif_val: std_logic_vector := b"000110000000001011";
    constant geb_val: std_logic_vector := b"000101010100010111";
    constant gef_val: std_logic_vector := b"000111111100010111";
    constant eb_val: std_logic_vector := b"000111110100010111";
    constant ef_val: std_logic_vector := b"000111111111110111";

    constant lambdaxib: signed := signed(lambda)*signed(xib_val);
    constant lambdaxif: signed := signed(lambda)*signed(xif_val);
    constant gebsq: signed := signed(geb_val)*signed(eb_val);
    constant gefsq: signed := signed(gef_val)*signed(ef_val);
    constant norm_gebsq: signed := signed(normalization)*gebsq(frac_len + word_len - 1 downto frac_len);
    constant norm_gefsq: signed := signed(normalization)*gefsq(frac_len + word_len - 1 downto frac_len);
    constant norm_gebsq_resized: signed := norm_gebsq(frac_len + word_len - 1 downto frac_len);
    constant norm_gefsq_resized: signed := norm_gefsq(frac_len + word_len - 1 downto frac_len);

    constant xib_result: std_logic_vector := std_logic_vector(lambdaxib(frac_len + word_len - 1 downto frac_len) + norm_gebsq_resized);
    constant xif_result: std_logic_vector := std_logic_vector(lambdaxif(frac_len + word_len - 1 downto frac_len) + norm_gefsq_resized);

begin

    dut: update_xi
    port map (
        ck => ck,
        eb_m1 => eb,
        ef_m1 => ef,
        geb_m1 => geb,
        gef_m1 => gef,
        xib1_m1 => xib,
        xif1_m1 => xif,
        xif_m1 => xif_out,
        xib_m1 => xib_out
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
        geb <= geb_val;
        gef <= gef_val;
        xib <= xib_val;
        xif <= xif_val;
        
        wait for 1*tck;

        assert xib_result = xib_out report "incorrect output on xib" severity error;
        assert xif_result = xif_out report "incorrect output on xif" severity error;

    end process test_sig;


end behavioral;